﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using prjITicket.Models;
using prjITicket.ViewModel;
using Newtonsoft.Json;
using AllPay.Payment.Integration;
using System.Collections;
using ZXing.QrCode;
using System.IO;
using ZXing;
using System.Drawing;

namespace prjITicket.Controllers
{
    //todo測試價格篩選環境下的換頁
    //todo 按價格區間篩選
    //todo 加入收藏
    //todo 點數
    public class ActivityController : Controller
    {
        TicketSysEntities db = new TicketSysEntities();
        //顯示活動一覽呼叫的controller
        public ActionResult ActivityList()
        {           
            //抓到需要秀在左邊的類別
            List<Categories> categories = db.Categories.ToList();          
            //隨機抽3個活動當輪播圖
            int length = db.Activity.Where(a=>a.ActivityStatusID==1).Count();
            List<int> indexs = new List<int>();
            Random random = new Random();
            while (indexs.Count<3)
            {
                int index = random.Next(0, length);
                if (!indexs.Contains(index))
                    indexs.Add(index);
            }
            List<Activity> activities = db.Activity.Where(a => a.ActivityStatusID == 1).ToList();
            List<Activity> scrollActivities = indexs.Select(i => activities[i]).ToList();
            //從subcategory抓出6個熱門搜索
            List<SubCategories> hotSearch = db.SubCategories.OrderByDescending(sc => sc.SearchedTime).Take(6).ToList();
            //抓出每個活動最便宜的票,再取這當中的最大值,準備塞給價格篩選器的最大值
            int maxPriceAll = (int)db.Tickets.GroupBy(t => t.ActivityID).Max(g => g.Min(t => t.Price * (1 - t.Discount)));
            //把資料塞進ViewModel
            VMActivityList vm = new VMActivityList()
            {
                Categories = categories,
                ScrollImgActivities = scrollActivities,
                HotSubCategories = hotSearch,
                MaxPriceAll = maxPriceAll
            };
            return View(vm);
        }
        //調用顯示活動詳細資料的controller
        public ActionResult ActivityDetail(int activityId)
        {
            Activity activity = db.Activity.Where(a => a.ActivityStatusID == 1).FirstOrDefault(a => a.ActivityID == activityId);
            if (activity == null)
            {
                //todo回傳找不到活動的錯誤頁面
            }
            //找出所有與這個Activity相關的group
            List<TicketGroups> groups = db.TicketGroups.Where(tg => tg.TicketGroupDetail.Select(tgd => tgd.ActivityId).Contains(activityId)).ToList();
            //塞入ViewModel傳到前端
            VMActivityDetail vm = new VMActivityDetail() { Activity = activity, Groups = groups };
            return View(vm);
        }
        //顯示購物車清單的controller
        public ActionResult ShoppingCartList()
        {
            if (Session[CDictionary.SK_Logined_Member] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            return View();
        }       
        //驗證購物車清單是否合法的方法
        public bool CheckShoppingCartItem(List<CShoppingCart> shoppingCart,out string result)
        {
            bool flag = true;
            int count = shoppingCart.Count();
            result = "購物失敗\\n";
            int index = 0;
            for (int i = 0; i < count; i++)
            {
                Tickets ticket = db.Tickets.ToList().FirstOrDefault(t => t.TicketID == shoppingCart[index].TicketID);
                if (ticket.Activity.ActivityStatusID != 1)
                {
                    //OK
                    shoppingCart.Remove(shoppingCart[index]);
                    result += $"{ticket.Activity.ActivityName}已經下架,已從購物車移除\\n";
                    flag = false;
                    continue;
                }
                else if (ticket.UnitsInStock == 0)
                {
                    //OK
                    shoppingCart.Remove(shoppingCart[index]);
                    result += $"{ticket.Activity.ActivityName}{ticket.TicketCategory.TicketCategoryName}{ticket.TicketTimes.TicketTime.ToString("yyyy/MM/dd HH:mm:ss")}售完,已從購物車移除\\n";
                    flag = false;
                    continue;
                }
                else if (ticket.UnitsInStock < shoppingCart[index].Quantity)
                {
                    //OK
                    shoppingCart[index].Quantity = ticket.UnitsInStock;
                    result += $"{ticket.Activity.ActivityName}{ticket.TicketCategory.TicketCategoryName}{ticket.TicketTimes.TicketTime.ToString("yyyy/MM/dd HH:mm:ss")}超過購買量,已調整\\n";
                    flag = false;
                }
                index++;
            }
            return flag;
        }
        //去歐付寶假付款
        public string GoToPay(CGoToPay input)
        {
            if (Session[CDictionary.SK_Logined_Member] == null || Session[CDictionary.ShoppingCart] == null)
            {
                //ShoppingCart為空,交易失敗並且跳轉 //OK
                //todo 測試Member為空
                return $"<script>alert('交易失敗,返回首頁');location.href='{Url.Action("ActivityList")}'</script>";
            }
            else if ((Session[CDictionary.ShoppingCart] as List<CShoppingCart>).Count() == 0)
            {
                //OK
                return $"<script>alert('購物車沒有物品,返回首頁');location.href='{Url.Action("ActivityList")}'</script>";
            }
            else
            {
                //檢查購物車是否合法
                string resultString="";
                List<CShoppingCart> shoppingCarts = Session[CDictionary.ShoppingCart] as List<CShoppingCart>;
                //不合法,就調整完跳轉回主頁  //OK
                if (!CheckShoppingCartItem(shoppingCarts, out resultString))
                {
                    return $"<script>alert('{resultString}');location.href='{Url.Action("ActivityList")}'</script>";
                }
                //合法,就造出Order跟OrderDetail      
                int memberId = (Session[CDictionary.SK_Logined_Member] as Member).MemberID;
                string orderGuid = String.Concat(Guid.NewGuid().ToString().Where(c => c != '-')).Substring(0, 20);
                Orders order = new Orders()
                {
                    Name = input.name,
                    Email = input.email,
                    DistrictId = input.districtId,
                    Address = input.address,
                    MemberID = memberId,
                    OrderDate = DateTime.Now,
                    OrderStatus = false,
                    OrderGuid = orderGuid
                };
                db.Orders.Add(order);
                db.SaveChanges();
                int totalPrice = 0;
                foreach (CShoppingCart item in shoppingCarts)
                {
                    Tickets ticket = db.Tickets.FirstOrDefault(t => t.TicketID == item.TicketID);
                    totalPrice = totalPrice + (int)Math.Round(ticket.Price * (1 - ticket.Discount), 0) * item.Quantity;
                    Order_Detail od = new Order_Detail()
                    {
                        TicketId = ticket.TicketID,
                        OrderID = order.OrderID,
                        Quantity = item.Quantity,
                        Discount = ticket.Discount
                    };
                    db.Order_Detail.Add(od);
                }
                db.SaveChanges();
                //一旦產生訂單就清空購物車 //OK
                Session[CDictionary.ShoppingCart] = null;
                //執行歐付寶程式碼
                List<string> enErrors = new List<string>();
                try
                {
                    using (AllInOne oPayment = new AllInOne())
                    {
                        /* 服務參數 */
                        oPayment.ServiceMethod = HttpMethod.HttpPOST;
                        oPayment.ServiceURL = "https://payment-stage.opay.tw/Cashier/AioCheckOut/V5";
                        oPayment.HashKey = "5294y06JbISpM5x9";
                        oPayment.HashIV = "v77hoKGq4kWxNNIS";
                        oPayment.MerchantID = "2000132";
                        /* 基本參數 */
                        oPayment.Send.ReturnURL = Request.Url.ToString().Substring(0, Request.Url.ToString().IndexOf("/",8)) + Url.Action("FinishPay");
                        //oPayment.Send.ClientBackURL = "http://localhost:53238" + Url.Action("Index");
                        oPayment.Send.OrderResultURL = Request.Url.ToString().Substring(0, Request.Url.ToString().IndexOf("/",8)) + Url.Action("FinishPay");
                        oPayment.Send.MerchantTradeNo = orderGuid;
                        oPayment.Send.MerchantTradeDate = DateTime.Now;
                        oPayment.Send.TotalAmount = totalPrice;
                        oPayment.Send.TradeDesc = "Itcket購票網";
                        //oPayment.Send.ChoosePayment = PaymentMethod.ALL;
                        //oPayment.Send.Remark = "<<您要填寫的其他備註>>";
                        //oPayment.Send.ChooseSubPayment = PaymentMethodItem.None;
                        //oPayment.Send.NeedExtraPaidInfo = ExtraPaymentInfo.Yes;
                        //oPayment.Send.HoldTrade = HoldTradeType.No;
                        //oPayment.Send.DeviceSource = DeviceType.PC;
                        //oPayment.Send.UseRedeem = UseRedeemFlag.Yes; //購物金/紅包折抵
                        //oPayment.Send.IgnorePayment = "<<您不要顯示的付款方式>>"; // 例如財付通:Tenpay
                        // 加入選購商品資料。
                        foreach (Order_Detail od in db.Order_Detail.Where(od=>od.OrderID==order.OrderID))
                        {
                            oPayment.Send.Items.Add(new Item()
                            {
                                Name = od.Tickets.Activity.ActivityName+od.Tickets.TicketCategory.TicketCategoryName+od.Tickets.TicketTimes.TicketTime.ToString("yyyy/MM/dd HH:mm:ss"),
                                Price = Math.Round(od.Tickets.Price * (1 - od.Discount),0) * od.Quantity,
                                Currency = "台幣",
                                Quantity = od.Quantity,
                                URL = "test"
                            });
                        }            
                        /* 產生訂單 */
                        enErrors.AddRange(oPayment.CheckOut());
                        /* 產生產生訂單 Html Code 的方法 */
                        string szHtml = String.Empty;
                        enErrors.AddRange(oPayment.CheckOutString(ref szHtml));
                        return szHtml;
                    }
                }
                catch (Exception ex)
                {
                    // 例外錯誤處理。
                    enErrors.Add(ex.Message);
                    return String.Concat(enErrors);
                }
                finally
                {
                    // 顯示錯誤訊息。
                    if (enErrors.Count() > 0)
                    {
                        string szErrorMessage = String.Join("\\r\\n", enErrors);
                    }
                }
            }
        }
        //顯示購物完成的頁面
        public ActionResult FinishPay()
        {
            List<string> enErrors = new List<string>();
            Hashtable htFeedback = null;
            using (AllInOne oPayment = new AllInOne())
            {
                oPayment.HashKey = "5294y06JbISpM5x9";
                oPayment.HashIV = "v77hoKGq4kWxNNIS";
                /* 取回付款結果 */
                enErrors.AddRange(oPayment.CheckOutFeedback(ref htFeedback));
            }
            //抓到成功訂單的Guid
            string orderGuid = htFeedback["MerchantTradeNo"].ToString();
            Orders order = db.Orders.FirstOrDefault(o => o.OrderGuid == orderGuid);
            //把訂單的付款狀態改為true
            order.OrderStatus = true;
            //為OrderDetail產生QRCode
            foreach(Order_Detail od in order.Order_Detail.ToList())
            {
                for(int i = 0; i < od.Quantity; i++)
                {
                    TicketQRCodes qrCode = new TicketQRCodes()
                    {
                        QRCode = Guid.NewGuid().ToString(),
                        OrderDetailId = od.OrderDetailID
                    };
                    db.TicketQRCodes.Add(qrCode);
                }
            }
            db.SaveChanges();
            //todo 發送Email

            return View(order);
        }
        //上傳產品的頁面
        public ActionResult UpLoadActivity()
        {
            Member member = Session[CDictionary.SK_Logined_Member] as Member;
            Seller seller= db.Seller.Where(x => x.MemberId == member.MemberID).FirstOrDefault();

            if (member == null || member.MemberRoleId != 3)
            {
                return RedirectToAction("Login", "Login");
            }
            else if (seller.fPass != true)
            {
                return RedirectToAction("ActivityList", "Activity");
            }
            return View();
        }
        //設定活動票的價格和庫存量的頁面
        public ActionResult AddPriceAndUnitsInStock(int activityId)
        {
            Member member = Session[CDictionary.SK_Logined_Member] as Member;
            if (member == null || member.MemberRoleId != 3)
            {
                return RedirectToAction("Login", "Login");
            }
            ViewBag.ActivityId = activityId;
            Activity activity = db.Activity.FirstOrDefault(a => a.ActivityID == activityId);
            return View(activity);
        }
        //在ActivityList頁面中Ajax調用這個方法取得活動分頁
        public ActionResult GetActivityPages(int currentPage = 1, string orderMode = "scoredown", int minPrice = 0,int maxPrice=int.MaxValue,int priceFilter=0)
        {
            currentPage = currentPage < 1 ? 1 : currentPage;
            int pageSize = 6;
            //ViewBag紀錄搜索模式
            ViewBag.ActionName = "GetActivityPages";
            ViewBag.OrderMode = orderMode;
            List<Activity> activities = db.Activity.Where(a => a.ActivityStatusID == 1).ToList();
            if (priceFilter == 1)
            {
                ViewBag.PriceFilter = 1;
                ViewBag.MinPrice = minPrice;
                ViewBag.MaxPrice = maxPrice;
                activities = activities.Where(a => a.Tickets.Count() != 0 && a.Tickets.Min(t => Math.Round(t.Price*(1-t.Discount),0)) >= minPrice && a.Tickets.Min(t => Math.Round(t.Price * (1 - t.Discount), 0)) <= maxPrice).ToList();
            }
            activities = OrderActivitiesByOrderMode(activities, orderMode);
            IPagedList<Activity> pages = activities.ToPagedList(currentPage, pageSize);
            if (pages.Count() == 0)
            {
                //todo回傳找不到產品的頁面
            }
            return PartialView(pages);
        }
        //在ActivityList頁面中Ajax調用這個方法取得活動分頁
        public ActionResult GetActivityPagesByKeyword(string keyword, int currentPage=1, string orderMode = "scoredown", int minPrice = 0, int maxPrice = int.MaxValue, int priceFilter = 0)
        {
            currentPage = currentPage < 1 ? 1 : currentPage;
            int pageSize = 6;
            //ViewBag紀錄搜索模式與參數
            ViewBag.ActionName = "GetActivityPagesByKeyword";
            ViewBag.Keyword = keyword;
            ViewBag.OrderMode = orderMode;
            List<Activity> activities = db.Activity.Where(a=>a.ActivityStatusID==1&&a.ActivityName.ToLower().Contains(keyword.ToLower())).ToList();
            if (priceFilter == 1)
            {
                ViewBag.PriceFilter = 1;
                ViewBag.MinPrice = minPrice;
                ViewBag.MaxPrice = maxPrice;
                activities = activities.Where(a => a.Tickets.Count() != 0 && a.Tickets.Min(t => Math.Round(t.Price * (1 - t.Discount), 0)) >= minPrice && a.Tickets.Min(t => Math.Round(t.Price * (1 - t.Discount), 0)) <= maxPrice).ToList();
            }
            activities = OrderActivitiesByOrderMode(activities, orderMode);
            IPagedList<Activity> pages = activities.ToPagedList(currentPage, pageSize);
            if (pages.Count() == 0)
            {
                //todo回傳找不到產品的頁面
            }
            return PartialView("GetActivityPages",pages);
        }
        //在ActivityList頁面中Ajax調用這個方法取得活動分頁
        public ActionResult GetActivityPagesByCategoryId(int categoryId,int currentPage = 1, string orderMode = "scoredown", int minPrice = 0, int maxPrice = int.MaxValue, int priceFilter = 0)
        {
            currentPage = currentPage < 1 ? 1 : currentPage;
            int pageSize = 6;
            //ViewBag紀錄搜索模式與參數
            ViewBag.ActionName = "GetActivityPagesByCategoryId";
            ViewBag.CategoryId = categoryId;
            ViewBag.OrderMode = orderMode;
            List<Activity> activities = db.Activity.Where(a=>a.ActivityStatusID==1&&a.SubCategories.Categories.CategoryID==categoryId).ToList();
            if (priceFilter == 1)
            {
                ViewBag.PriceFilter = 1;
                ViewBag.MinPrice = minPrice;
                ViewBag.MaxPrice = maxPrice;
                activities = activities.Where(a => a.Tickets.Count() != 0 && a.Tickets.Min(t => Math.Round(t.Price * (1 - t.Discount), 0)) >= minPrice && a.Tickets.Min(t => Math.Round(t.Price * (1 - t.Discount), 0)) <= maxPrice).ToList();
            }
            activities = OrderActivitiesByOrderMode(activities, orderMode);
            IPagedList<Activity> pages = activities.ToPagedList(currentPage, pageSize);
            if (pages.Count() == 0)
            {
                //todo回傳找不到產品的頁面
            }
            return PartialView("GetActivityPages", pages);
        }
        //在ActivityList頁面中Ajax調用這個方法取得活動分頁
        public ActionResult GetActivityPagesBySubCategoryId(int subCategoryId, int currentPage = 1, string orderMode = "scoredown", int minPrice = 0, int maxPrice = int.MaxValue, int priceFilter = 0)
        {
            currentPage = currentPage < 1 ? 1 : currentPage;
            int pageSize = 6;
            //ViewBag紀錄搜索模式與參數
            ViewBag.ActionName = "GetActivityPagesBySubCategoryId";
            ViewBag.SubCategoryId = subCategoryId;
            ViewBag.OrderMode = orderMode;
            List<Activity> activities = db.Activity.Where(a=>a.ActivityStatusID==1&&a.SubCategoryId==subCategoryId).ToList();
            if (priceFilter == 1)
            {
                ViewBag.PriceFilter = 1;
                ViewBag.MinPrice = minPrice;
                ViewBag.MaxPrice = maxPrice;
                activities = activities.Where(a => a.Tickets.Count() != 0 && a.Tickets.Min(t => Math.Round(t.Price * (1 - t.Discount), 0)) >= minPrice && a.Tickets.Min(t => Math.Round(t.Price * (1 - t.Discount), 0)) <= maxPrice).ToList();
            }
            activities = OrderActivitiesByOrderMode(activities, orderMode);
            IPagedList<Activity> pages = activities.ToPagedList(currentPage, pageSize);
            if (pages.Count() == 0)
            {
                //todo回傳找不到產品的頁面
            }
            return PartialView("GetActivityPages", pages);
        }
        //ActicityList中Ajax調用這個方法獲得按照地區搜索的活動
        public ActionResult GetActivityPagesByDistrictId(int districtId, int currentPage = 1, string orderMode = "scoredown", int minPrice = 0, int maxPrice = int.MaxValue, int priceFilter = 0)
        {
            currentPage = currentPage < 1 ? 1 : currentPage;
            int pageSize = 6;
            //ViewBag紀錄搜索模式與參數
            ViewBag.ActionName = "GetActivityPagesByDistrictId";
            ViewBag.DistrictId = districtId;
            ViewBag.OrderMode = orderMode;
            //這裡districtID實際上有存cityID,當小於0的時候是cityId的相反數,大於0的時候是districtId
            List<Activity> activities = null;
            if (districtId < 0)
            {
                activities = db.Activity.Where(a => a.ActivityStatusID == 1 && a.Districts.CityId == districtId*-1).ToList();
            }
            else
            {
                activities = db.Activity.Where(a => a.ActivityStatusID == 1 && a.DistrictId == districtId).ToList();
            }
            if (priceFilter == 1)
            {
                ViewBag.PriceFilter = 1;
                ViewBag.MinPrice = minPrice;
                ViewBag.MaxPrice = maxPrice;
                activities = activities.Where(a => a.Tickets.Count() != 0 && a.Tickets.Min(t => Math.Round(t.Price * (1 - t.Discount), 0)) >= minPrice && a.Tickets.Min(t => Math.Round(t.Price * (1 - t.Discount), 0)) <= maxPrice).ToList();
            }
            activities = OrderActivitiesByOrderMode(activities, orderMode);
            IPagedList<Activity> pages = activities.ToPagedList(currentPage, pageSize);
            if (pages.Count() == 0)
            {
                //todo回傳找不到產品的頁面
            }
            return PartialView("GetActivityPages", pages);
        }
        //根據OrderMode排序Activity的方法
        public List<Activity> OrderActivitiesByOrderMode(List<Activity> activities,string orderMode)
        {
            //如果沒有價格或者沒有評論,就排最後
            switch (orderMode)
            {
                case "scoreup":
                    return activities.OrderBy(a => { if (a.Comment.Count() == 0) return 6; else return a.Comment.Average(c => c.CommentScore); }).ToList();  
                case "scoredown":
                    return activities.OrderByDescending(a => { if (a.Comment.Count() == 0) return -1; else return a.Comment.Average(c => c.CommentScore); }).ToList();
                case "priceup":
                    return activities.OrderBy(a => { if (a.Tickets.Count() == 0) return int.MaxValue; else return a.Tickets.Min(t => t.Price * (1 - t.Discount)); }).ToList();
                case "pricedown":
                    return activities.OrderByDescending(a => { if (a.Tickets.Count() == 0) return -1; else return a.Tickets.Min(t => t.Price * (1 - t.Discount)); }).ToList();
                default:
                    goto case "scoredown";
            }
        }
        //增加子類別被搜索次數的函數
        public void AddSubCategorySearchedTime(int subCategoryId)
        {
            SubCategories subCategory = db.SubCategories.FirstOrDefault(sc => sc.SubCategoryId == subCategoryId);
            if (subCategory != null)
            {
                subCategory.SearchedTime++;
                db.SaveChanges();
            }
        }
        //在ActivityList頁面中Ajax調用這個方法取得活動的次詳細分頁
        public ActionResult GetActivitySubDetailPage(int activityId)
        {
            Activity activity = db.Activity.Where(a => a.ActivityStatusID == 1).FirstOrDefault(a => a.ActivityID == activityId);
            if (activity == null)
            {
                //todo 回傳活動是空值的錯誤頁面
            }
            return PartialView("GetActivitySubDetailPage", activity);
        }
        //在GetActivitySubDetailPage中Ajax調用這個方法獲得評論分頁
        public ActionResult GetActivityCommentPage(int activityId,int currentPage=1)
        {
            currentPage = currentPage < 1 ? 1 : currentPage;
            int pageSize = 4;
            List<Comment> comments = db.Comment.Where(c => c.CommentActivityId == activityId).OrderByDescending(c=>c.CommentDate).ToList();
            IPagedList<Comment> pages = comments.ToPagedList(currentPage, pageSize);
            ViewBag.ActivityId = activityId;
            return PartialView("GetActivityCommentPage",pages);
        }
        //GetActivitySubDetailPage中Ajax調用上傳評論的方法
        [HttpPost]
        public string AddActivityComment(int activityId, string content,int starCount)
        {
            if (Session[CDictionary.SK_Logined_Member] == null)
            {
                return "必須先登錄";
            }
            if (string.IsNullOrEmpty(content.Trim())) return "不准上傳空值";
            Comment comment = new Comment()
            {
                CommentMemberID = (Session[CDictionary.SK_Logined_Member] as Member).MemberID,
                CommentActivityId = activityId,
                CommentContent = content.Trim(),               
                CommentDate = DateTime.Now,
                CommentScore = starCount
            };
            db.Comment.Add(comment);
            try
            {
                db.SaveChanges();
                return "OK";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        //ActivityDetail的View中實時得到票價的Ajax調用的方法
        public string getTicketPrice(int ticketCategoryId,int ticketTimeId)
        {
            Tickets ticket = db.Tickets.FirstOrDefault(t => t.TicketCategoryId == ticketCategoryId && t.TicketTimeId == ticketTimeId);
            if (ticket == null)
            {
                return "暫無提供";
            }
            else if (ticket.UnitsInStock == 0)
            {
                return "已售完";
            }
            else
            {
                return JsonConvert.SerializeObject(new {ticket.Price,ticket.Discount,ticket.UnitsInStock});
            }
        }
        //ActivityList中Ajax調用獲得城市資訊的函數
        public string getAllCity()
        {
            var cities = db.Cities.Select(c => new { c.CityID, c.CityName }).ToList();
            return JsonConvert.SerializeObject(cities);
        }
        public string getDistrictsByCityId(int cityId)
        {
            var districts = db.Districts.Where(d => d.CityId == cityId).Select(d => new { d.DistrictId, d.DistrictName }).ToList();
            return JsonConvert.SerializeObject(districts);
        }
        //ActivityList中Ajax調用獲得活動類別資訊的函數
        public string getAllCategory()
        {
            var categories = db.Categories.Select(c => new { c.CategoryID, c.CategoryName }).ToList();
            return JsonConvert.SerializeObject(categories);
        }
        public string getSubcategoriesByCategoryId(int categoryId)
        {
            var subCategories = db.SubCategories.Where(sc => sc.CategoryId==categoryId).Select(sc => new { sc.SubCategoryId, sc.SubCategoryName }).ToList();
            return JsonConvert.SerializeObject(subCategories);
        }
        //Ajax調用根據區來獲得郵遞區號
        public string getPostCodeByDistrictId(int districtId)
        {
            return db.Districts.FirstOrDefault(d => d.DistrictId == districtId).PostCode;
        }
        //ActivityDetail加入購物車Ajax調用的方法
        public string AddToShoppingCart(int activityId,int ticketCategoryId,int ticketTimeId)
        {
            //加入購物車之前强迫他登錄
            if (Session[CDictionary.SK_Logined_Member] == null)
            {
                return "toLogin";
            }
            //加入購物車前判斷產品是否被下架
            if (db.Activity.Where(a => a.ActivityStatusID == 1).FirstOrDefault(a => a.ActivityID == activityId) == null)
            {
                return "activityOver";
            }
            Tickets ticket = db.Tickets.FirstOrDefault(t => t.ActivityID == activityId && t.TicketCategoryId == ticketCategoryId && t.TicketTimeId == ticketTimeId);
            //判斷票是否存在與庫存量
            if (ticket == null)
            {
                return "noSupplly";
            }
            else if (ticket.UnitsInStock == 0)
            {
                return "noUnitsInStock";
            }
            int ticketId = ticket.TicketID;
            List<CShoppingCart> shoppingCart = Session[CDictionary.ShoppingCart] as List<CShoppingCart>;
            //如果還沒有購物車就new一個給他
            if (shoppingCart == null)
            {
                shoppingCart = new List<CShoppingCart>();
                shoppingCart.Add(new CShoppingCart() { TicketID = ticketId, Quantity = 1 });
                Session[CDictionary.ShoppingCart] = shoppingCart;
            }
            else
            {
                CShoppingCart sameItem = shoppingCart.FirstOrDefault(sc => sc.TicketID == ticketId);
                if (sameItem == null)
                {
                    shoppingCart.Add(new CShoppingCart() { TicketID = ticketId, Quantity = 1 });
                }
                else
                {
                    //如果他要加的產品已經存在購物車裏面就幫他數量+1
                    //但是如果加超過庫存量,就幫他更新成產品的最大庫存量
                    //如果大於99個就不能加
                    int count = sameItem.Quantity;
                    if (count + 1 > ticket.UnitsInStock)
                    {
                        sameItem.Quantity = ticket.UnitsInStock;
                        return "overCount";
                    }
                    else if (count + 1 > 99)
                    {
                        return "overMaxCount";
                    }
                    else
                    {
                        sameItem.Quantity = count + 1;
                    }
                }
                Session[CDictionary.ShoppingCart] = shoppingCart;
            }
            //從ticketId轉成可以顯示的資料傳回前端
            return ToShoppingCartJson(shoppingCart);
        }
        //Ajax請求獲得購物車資料的方法
        public string GetShoppingCart()
        {
            List<CShoppingCart> shoppingCart = Session[CDictionary.ShoppingCart] as List<CShoppingCart>;
            if (shoppingCart == null||shoppingCart.Count()==0)
            {
                return "noShoppingCart";
            }
            else
            {
                return ToShoppingCartJson(shoppingCart);
            }
        }
        //購物車Session資料轉換詳細資料的函數
        public string ToShoppingCartJson(List<CShoppingCart> shoppingCart)
        {
            var cartItems = shoppingCart.Select(sc =>
            {
                Tickets scticket = db.Tickets.FirstOrDefault(t => t.TicketID == sc.TicketID);
                return new
                {
                    scticket.Activity.ActivityName,
                    scticket.TicketCategory.TicketCategoryName,
                    Time = scticket.TicketTimes.TicketTime.ToString("yyyy/MM/dd HH:mm"),
                    Price = Math.Round(scticket.Price * (1 - scticket.Discount), 0),
                    sc.Quantity,
                    sc.TicketID,
                    scticket.Activity.Picture
                };
            });
            return JsonConvert.SerializeObject(cartItems);
        }
        //Ajax調用刪除購物車條目的方法
        public string DeleteShoppingCartItem(int ticketId)
        {
            List<CShoppingCart> shoppingCart = Session[CDictionary.ShoppingCart] as List<CShoppingCart>;
            if (shoppingCart == null)
            {
                return "noShoppingCart";
            }
            CShoppingCart deleteItem = shoppingCart.FirstOrDefault(sc => sc.TicketID == ticketId);
            if (deleteItem != null)
            {
                shoppingCart.Remove(deleteItem);
            }
            //remove完之後如果數量是0,就告訴前端,讓前端顯示空購物車的畫面
            if (shoppingCart.Count() == 0)
            {
                return "noShoppingCart";
            }
            else
            {
                return ToShoppingCartJson(shoppingCart);
            }
        }
        //購物車列表頁加號按下去Ajax會調用的函數
        public string ShoppingCartItemCountPlus(int ticketId)
        {
            List<CShoppingCart> shoppingCart = Session[CDictionary.ShoppingCart] as List<CShoppingCart>;
            if (shoppingCart == null)
            {
                return "noShoppingCart";
            }
            CShoppingCart plusCountItem = shoppingCart.FirstOrDefault(sc => sc.TicketID == ticketId);
            Tickets ticket = db.Tickets.FirstOrDefault(t => t.TicketID == ticketId);
            if (ticket.UnitsInStock == 0)
            {
                shoppingCart.Remove(plusCountItem);
                return "outOfStock";
            }
            int count = plusCountItem.Quantity;
            if (count + 1 > 99)
            {
                return "overEdge";
            }
            else if (count + 1 > ticket.UnitsInStock)
            {
                //如果加之後數量大於最大庫存數量,就改成最大庫存數量
                plusCountItem.Quantity = ticket.UnitsInStock;
                Session[CDictionary.ShoppingCart] = shoppingCart;
                return "overCount";
            }
            else
            {
                plusCountItem.Quantity = count + 1;
                Session[CDictionary.ShoppingCart] = shoppingCart;
                return ToShoppingCartJson(shoppingCart);
            }
        }
        //購物車列表頁減號按下去Ajax會調用的函數
        public string ShoppingCartItemCountMinus(int ticketId)
        {
            List<CShoppingCart> shoppingCart = Session[CDictionary.ShoppingCart] as List<CShoppingCart>;
            if (shoppingCart == null)
            {
                return "noShoppingCart";
            }
            CShoppingCart minusCountItem = shoppingCart.FirstOrDefault(sc => sc.TicketID == ticketId);
            Tickets ticket = db.Tickets.FirstOrDefault(t => t.TicketID == ticketId);
            if (ticket.UnitsInStock == 0)
            {
                shoppingCart.Remove(minusCountItem);
                return "outOfStock";
            }
            int count = minusCountItem.Quantity;
            if (count - 1 < 1)
            {
                return "overEdge";
            }
            else if (count-1>ticket.UnitsInStock)
            {
                //如果減完之後數量大於最大數量(數量被賣家或管理員臨時砍掉的情況),就改成最大數量
                minusCountItem.Quantity = ticket.UnitsInStock;
                Session[CDictionary.ShoppingCart] = shoppingCart;
                return "overCount";
            }
            else
            {
                minusCountItem.Quantity = count - 1;
                Session[CDictionary.ShoppingCart] = shoppingCart;
                return ToShoppingCartJson(shoppingCart);
            }
        }
        //Ajax調用獲得QRCode的方法
        public string ShowQRCode(int orderDetailId)
        {
            List<string> qrCodes = db.TicketQRCodes.Where(qr => qr.OrderDetailId == orderDetailId).Select(qr => qr.QRCode).ToList();
            BarcodeWriter writer = new BarcodeWriter();
            writer.Format = BarcodeFormat.QR_CODE;
            writer.Options = new QrCodeEncodingOptions() { DisableECI = true, CharacterSet = "UTF-8", Height = 200, Width = 200, Margin = 1 };
            List<string> qrCodesBase64 = new List<string>();
            foreach (string qrCodeStr in qrCodes)
            {
                var qrCode = writer.Write(qrCodeStr);
                MemoryStream ms = new MemoryStream();
                qrCode.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                byte[] data = ms.GetBuffer();
                qrCodesBase64.Add(Convert.ToBase64String(data));
            }
            Order_Detail orderDetail = db.Order_Detail.FirstOrDefault(od => od.OrderDetailID == orderDetailId);
            return JsonConvert.SerializeObject(new { 
                orderDetail.Tickets.Activity.ActivityName,
                orderDetail.Tickets.TicketCategory.TicketCategoryName,
                Time = orderDetail.Tickets.TicketTimes.TicketTime.ToString("yyyy/MM/dd HH:mm:ss"),
                QRCodes=qrCodesBase64
            });
        }
        //Ajax調用檢查活動名稱是否有重複的方法
        public string CheckActivityName(string activityName)
        {
            Activity activity = db.Activity.FirstOrDefault(a => a.ActivityName == activityName);
            if (activity == null)
            {
                return "OK";
            }
            else
            {
                return "NotAvailible";
            }
        }
        //Ajax調用上傳活動資訊的方法
        [ValidateInput(false)]   //不寫這句話無法傳送html標簽
        public string AddActivity(CActivity input)
        {
            if (Session[CDictionary.SK_Logined_Member] == null)
            {
                return "loginOverTime";
            }
            if (CheckActivityName(input.activityName) != "OK")
            {
                return "sameActivityName";
            }
            //todo ActiivityStatusId要調回0
            int sellerId = db.Seller.AsEnumerable().FirstOrDefault(s => s.MemberId == (Session[CDictionary.SK_Logined_Member] as Member).MemberID).SellerID;
            string pictureName = Guid.NewGuid().ToString() + ".png";
            Activity activity = new Activity()
            {
                ActivityName = input.activityName,
                SellerID = sellerId,
                Description = input.description,
                Address = input.address,
                Picture = pictureName,
                Information = input.information,
                SubCategoryId = input.subcategoryId,
                Hostwords = input.hostwords,
                Map = input.map,
                ActivityStatusID = 1,
                DistrictId = input.districtId
            };
            db.Activity.Add(activity);
            foreach(string ticketCategoryName in input.ticketCategories)
            {
                TicketCategory tc = new TicketCategory()
                {
                    TicketCategoryName = ticketCategoryName,
                    ActivityId = activity.ActivityID
                };
                db.TicketCategory.Add(tc);
            }
            foreach(string ticketTime in input.times)
            {
                TicketTimes tt = new TicketTimes()
                {
                    TicketTime = Convert.ToDateTime(ticketTime),
                    ActivityId = activity.ActivityID
                };
                db.TicketTimes.Add(tt);
            }
            try
            {
                string pictureCode = input.picture.Substring(input.picture.IndexOf(",") + 1);  //把"data:image/png;base64,"這部分捨棄,取逗號後面的值
                byte[] imgData = Convert.FromBase64String(pictureCode);
                MemoryStream ms = new MemoryStream(imgData);
                Bitmap bitmap = new Bitmap(ms);
                bitmap.Save(Server.MapPath("~/images/Activity/"+pictureName), System.Drawing.Imaging.ImageFormat.Png);
                db.SaveChanges();                
                return activity.ActivityID.ToString();
            }
            catch (Exception ex)
            {
                return "error";
            }
        }
        //添加票的庫存量,價格,折扣的頁面中Ajax調用這個方法獲得表格資料
        public string getAllTicketInfo(int activityId)
        {
            Activity activity = db.Activity.FirstOrDefault(a => a.ActivityID == activityId);
            var ticketsData = new
            {
                TicketCategoty = activity.TicketCategory.Select(tc => new { tc.TicketCategoryId, tc.TicketCategoryName }),
                TicketTime = activity.TicketTimes.Select(tt => new { tt.TicketTimeId, Time = tt.TicketTime.ToString("yyyy/MM/dd HH:mm") }),
                Tickets = activity.Tickets.Select(t => new { t.TicketID, t.TicketCategoryId, t.TicketTimeId, t.Price, t.UnitsInStock, t.Discount })
            };
            return JsonConvert.SerializeObject(ticketsData);
        }   
        //同上頁面中Ajax調用設定庫存量,價格,折扣的方法
        public string SetTicketProperties(Tickets input)
        {
            Tickets ticket = db.Tickets.FirstOrDefault(t => t.TicketCategoryId == input.TicketCategoryId && t.TicketTimeId == input.TicketTimeId);
            if (ticket == null)
            {
                db.Tickets.Add(input);
            }
            else
            {
                ticket.Price = input.Price;
                ticket.UnitsInStock = input.UnitsInStock;
                ticket.Discount = input.Discount;
            }
            try
            {
                db.SaveChanges();
                return "OK";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }           
        }
        //同上頁面中Ajax調用刪除票的方法
        public string deleteTicket(int ticketCategoryId,int ticketTimeId)
        {
            Tickets ticket = db.Tickets.FirstOrDefault(t => t.TicketCategoryId == ticketCategoryId && t.TicketTimeId == ticketTimeId);
            if (ticket != null)
            {
                db.Tickets.Remove(ticket);
                try
                {
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    return "已經存在訂單,無法刪除";
                }
            }
            return "OK";
        }
    }
}