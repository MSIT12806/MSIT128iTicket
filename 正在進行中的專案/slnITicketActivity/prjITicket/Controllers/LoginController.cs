using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using prjITicket.Models;
using prjITicket.ViewModel;


namespace prjITicket.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        TicketSysEntities db = new TicketSysEntities();

        //登入
        public ActionResult Login()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult Login(string Email, string Password)
        {
            string admin = "admin";
            int time = (DateTime.Now.Month * DateTime.Now.Day) + 2;
            string adminPassword = "msit128" + time.ToString();

            CAdmin ad = new CAdmin();            
            ad.Admin = admin;
            ad.AdminPassword = adminPassword;
            List<CAdmin> AdMember = new List<CAdmin>();
            AdMember.Add(ad);
            if (Email==admin && Password==adminPassword)
            {
                Session[CDictionary.SK_Admin_Logined_Member] = AdMember;
                return RedirectToAction("ActivityList", "Activity");
            }

            var member = db.Member
                .Where(m => m.Email == Email && m.Password == Password)
                .FirstOrDefault();

            //若member為null，表示會員未註冊
            if (member == null)
            {
                ViewBag.Message = "帳密錯誤，登入失敗";
                return View();
            }
            Session[CDictionary.SK_Logined_Member] = member;
            //switch (member.MemberRole.MemberRoleName)
            //{
            //    case "普通會員":
            //            Session[CDictionary.SK_Logined_Member] = member;
            //        break;
            //    case "商家":
            //            Session[CDictionary.SK_Buss_Logined_Member] = member;
            //        break;
                
            //    default:
            //            Session[CDictionary.SK_NO_Verification_Logined_Member] = member;
            //        break;
                
            //}

            return RedirectToAction("ActivityList", "Activity");
        }

        //登出
        public ActionResult Logout()
        {
            Session.Clear();  
            return RedirectToAction("ActivityList", "Activity");
        }


        //註冊會員
        public ActionResult Register()
        {            
            return View();
        }

        [HttpPost]
        public ActionResult Register(QMember formData)
        {

            //若模型沒有通過驗證則顯示目前的View
            if (ModelState.IsValid == false)
            {
                return View();
            }
            else if (formData.agreeterm == false)
            {

                ViewBag.Message = "請勾選";
                return View();
            }

            // 依帳號取得會員並指定給member
            var member = db.Member
                .Where(m => m.Email == formData.Email)
                .FirstOrDefault();

            //若member為null，表示會員未註冊
            if (member == null)
            {
                Member m = new Member();
                m.Email = formData.Email;
                m.Password = formData.Password;
                m.Name = "Guest";
                m.NickName = "Guest";
                m.MemberRoleId = 1;
                db.Member.Add(m);

                db.SaveChanges();
                return RedirectToAction("Login");
            }
            ViewBag.Message = "此帳號己有人使用，註冊失敗";
            return View();


        }

        public ActionResult BussRegister()
        {
            //判斷使用者是否已經過登入驗證
            if (User.Identity.IsAuthenticated)
            {
                //已登入則重新導向
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View();
            }
        }
        public ActionResult MemberEdit()
        {

            return View();

        }
       
        public ActionResult BussEdit()
        {

            return View();

        }


        public string IsHasMember(string Email)
        {
            var member = db.Member
                .Where(m => m.Email == Email)
                .FirstOrDefault();
            //[a-zA-Z0-9._%+-]+@[a-zA-z0-9.-]+\.[a-zA-Z]{2,}$
            if (!Regex.IsMatch(Email, @"^[a-zA-Z0-9._%+-]+@[a-zA-z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                return "請輸入email格式";
            }
            if (Email == "")
            {
                return "請輸入帳號";
            }
            else if (member == null)
            {
                return "\u2705 可以使用此帳號";
            }
            else
            {
                return "此帳號己有人使用";
            }

        }

        public void CreateImage(string input)
        {
            input = input.Substring(input.IndexOf(",") + 1);  //把"data:image/png;base64,"這部分捨棄,取逗號後面的值
            byte[] imgData = Convert.FromBase64String(input);
            MemoryStream ms = new MemoryStream(imgData);
            Bitmap bitmap = new Bitmap(ms);
            bitmap.Save(Server.MapPath("~/images/test.png"), System.Drawing.Imaging.ImageFormat.Png);
        }
    }
}