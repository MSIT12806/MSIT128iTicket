//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace prjITicket.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Article
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Article()
        {
            this.Emotion = new HashSet<Emotion>();
            this.Reply = new HashSet<Reply>();
        }
    
        public int ArticleID { get; set; }
        public string ArticleTitle { get; set; }
        public string ArticleContent { get; set; }
        public int MemberID { get; set; }
        public System.DateTime Date { get; set; }
        public string Picture { get; set; }
        public int ArticleCategoryID { get; set; }
    
        public virtual ArticleCategories ArticleCategories { get; set; }
        public virtual Member Member { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Emotion> Emotion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reply> Reply { get; set; }
    }
}
