using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using prjITicket.Models;

namespace prjITicket.ViewModel
{
    public class VMReport
    {
        public Article Article { get; set; }
        public List<Report> Report { get; set; }
        
    }
    public class VMforum_mailblock
    {
        public List<ArticleCategories> ArticleCategories { get; set; }
        public List<Article> Article { get; set; }
    }

}