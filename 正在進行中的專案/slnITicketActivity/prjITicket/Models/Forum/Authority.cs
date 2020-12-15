using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace prjITicket.Models.Forum
{
    public class Authority
    {
        //此類別寫入判斷瀏覽者權限的方法
        //1. 未登入
        //2. 一般會員
        //3. 商家會員
        //4. 管理者

        public int Authorityjudgment(Member member)
        {
            int author = 0;
            TicketSysEntities db = new TicketSysEntities();
            if (member == null)
            {
                author = 0;
            }
            else
            {
                if (member.MemberRoleId == 4)
                {
                    author =4;
                }
                if (member.MemberRoleId ==3)
                {
                    //author.Add("商家會員");
                }
                if (member.MemberRoleId == 2)
                {
                    //author.Add("一般會員");
                }
            }
            return author;

        }
    }
}