using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace prjITicket.Models.Forum
{
    public class CleanClear
    {
        public void cleanData()
        {
            
            //找出儲存在資料庫的路徑檔案，這是不能刪除的
            TicketSysEntities db = new TicketSysEntities();
            var e = db.Article.Select(n => n.Picture);
            List<string> qqstrs = new List<string>();
            foreach (var item in e)
            {
                if (item != null && item.Length > 30)
                    qqstrs.Add(item.Substring(30));
            }

            //用相對路徑找出該資料夾的絕對路徑
            var w = System.Web.HttpContext.Current.Server.MapPath(@"~/Content/Forum_use/ImageStore");
            //找出該資料夾下所有檔案(絕對路徑))
            var q =System.IO.Directory.GetFileSystemEntries(w);
            
            
            //遞迴比對，如果資料夾中的檔案沒有存在資料庫中，就進行刪除，但是保留一些預設的圖片，自己取的名稱都比較短，所以設定某種長度
            foreach (var item in q)
            {
                if (!qqstrs.Contains(item.Substring(83)) && item.Length>98)
                {
                    System.IO.File.Delete(item);
                }

            }
        }
    }
}