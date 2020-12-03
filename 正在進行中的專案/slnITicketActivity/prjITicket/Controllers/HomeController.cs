using prjITicket.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace prjITicket.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        //Home/cleanData
        ///Content/Forum_use/ImageStore/c24f63f8-5e1d-44b7-943e-9caf183927c5.jpg
        public string cleanData()
        {
            //資料庫中都是相對路徑
            //如何指定特定資料夾
            string output = "";
            string ww = "";
            TicketSysEntities db = new TicketSysEntities();
            string filepath = @"D:\Git\testGit\正在進行中的專案\slnITicketActivity\prjITicket\Content\Forum_use\ImageStore";
            DirectoryInfo info = new DirectoryInfo(filepath);
            System.IO.FileInfo[] files = info.GetFiles();
            var cc = files.Select(n => n.ToString());
            Article article = new Article();
            var q = db.Article.Select(n => n.Picture.Substring(30));//擷取檔案名稱

            foreach (var item in files)
            {
                if (q.Contains(item.ToString()))
                {
                    output += "保留" + item.ToString() + "<br>";
                    continue;
                }
                else
                {
                    output += "已刪除" + item.ToString() + "<br>";
                    item.Delete();
                }
            }
            return output;
        }
    }
}