using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Yatrikapp
{
    [Serializable]
    public class AdminReviewItem
    {
        public int Id { get; set; }
        public string GuestName { get; set; }
        public string Email { get; set; }
        public string ReviewDate { get; set; }
        public string HotelName { get; set; }
        public int Rating { get; set; }
        public string Comment { get; set; }
        public string Status { get; set; } // "Published", "Pending", "Flagged"

        public string Initials
        {
            get
            {
                if (string.IsNullOrEmpty(GuestName)) return "U";
                var parts = GuestName.Trim().Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                if (parts.Length == 1) return parts[0].Substring(0, Math.Min(2, parts[0].Length)).ToUpper();
                return $"{parts[0][0]}{parts[1][0]}".ToUpper();
            }
        }

        public string StarSymbols
        {
            get
            {
                string stars = "";
                for (int i = 0; i < 5; i++)
                {
                    stars += i < Rating ? "★" : "☆";
                }
                return stars;
            }
        }
    }

    public partial class AdminReviews : Page
    {
        public int Pct5 { get; set; }
        public int Pct4 { get; set; }
        public int Pct3 { get; set; }
        public int Pct2 { get; set; }
        public int Pct1 { get; set; }

        private string CurrentFilter
        {
            get => (ViewState["CurrentFilter"] as string) ?? "All";
            set => ViewState["CurrentFilter"] = value;
        }

        private static List<AdminReviewItem> GetReviewsList()
        {
            if (HttpContext.Current.Application["AdminReviewsList"] == null)
            {
                var list = new List<AdminReviewItem>
                {
                    new AdminReviewItem { Id = 1, GuestName = "Priya Sharma", Email = "priya.s@gmail.com", ReviewDate = "2026-07-10", HotelName = "Haveli by the Lake", Rating = 5, Comment = "Absolutely magical. The lake view, the staff, the heritage ambience — Yatrik made it all so easy to book. Will stay again!", Status = "Published" },
                    new AdminReviewItem { Id = 2, GuestName = "Rahul Mehta", Email = "rahul.m@gmail.com", ReviewDate = "2026-06-28", HotelName = "Royal Sands Goa", Rating = 4, Comment = "Great beach resort. Clean rooms and fantastic seafood. The pool could be better maintained but overall a wonderful trip.", Status = "Published" },
                    new AdminReviewItem { Id = 3, GuestName = "Anjali Nair", Email = "anjali.n@gmail.com", ReviewDate = "2026-06-15", HotelName = "Spice Garden Resort", Rating = 5, Comment = "Woke up to misty tea gardens every morning. The Ayurvedic massage was the highlight. Pure Kerala magic.", Status = "Published" },
                    new AdminReviewItem { Id = 4, GuestName = "Vikram Patel", Email = "vikram.p@gmail.com", ReviewDate = "2026-07-22", HotelName = "Marina Heritage Mumbai", Rating = 3, Comment = "Good location near Gateway of India. Service was slow during peak hours. Room was clean but smaller than expected for the price.", Status = "Pending" },
                    new AdminReviewItem { Id = 5, GuestName = "Rohan Kapoor", Email = "rohan.k@gmail.com", ReviewDate = "2026-08-01", HotelName = "Himalayan Nest", Rating = 5, Comment = "Best mountain lodge I have stayed at. Cosy, clean, excellent food. The bonfire evenings were unforgettable.", Status = "Pending" },
                    new AdminReviewItem { Id = 6, GuestName = "Sneha Iyer", Email = "sneha.i@gmail.com", ReviewDate = "2026-07-30", HotelName = "Jaipur Palace View", Rating = 2, Comment = "Disappointed. Paid a lot but the room had no hot water for 2 nights. Staff were unapologetic. Would not recommend.", Status = "Flagged" }
                };
                HttpContext.Current.Application["AdminReviewsList"] = list;
            }
            return (List<AdminReviewItem>)HttpContext.Current.Application["AdminReviewsList"];
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindReviews();
            }
        }

        private void BindReviews()
        {
            var list = GetReviewsList();

            int total = list.Count;
            int published = list.Count(r => r.Status.Equals("Published", StringComparison.OrdinalIgnoreCase));
            int pending = list.Count(r => r.Status.Equals("Pending", StringComparison.OrdinalIgnoreCase));
            int flagged = list.Count(r => r.Status.Equals("Flagged", StringComparison.OrdinalIgnoreCase));
            double avg = total > 0 ? list.Average(r => r.Rating) : 0;

            litSubCount.Text = $"{total} reviews across all properties";
            litAvgRating.Text = $"{avg:0.0} ★";
            litPublishedCount.Text = published.ToString();
            litPendingCount.Text = pending.ToString();
            litFlaggedCount.Text = flagged.ToString();

            int c5 = list.Count(r => r.Rating == 5);
            int c4 = list.Count(r => r.Rating == 4);
            int c3 = list.Count(r => r.Rating == 3);
            int c2 = list.Count(r => r.Rating == 2);
            int c1 = list.Count(r => r.Rating == 1);

            litCount5.Text = c5.ToString();
            litCount4.Text = c4.ToString();
            litCount3.Text = c3.ToString();
            litCount2.Text = c2.ToString();
            litCount1.Text = c1.ToString();

            Pct5 = total > 0 ? (int)((double)c5 / total * 100) : 0;
            Pct4 = total > 0 ? (int)((double)c4 / total * 100) : 0;
            Pct3 = total > 0 ? (int)((double)c3 / total * 100) : 0;
            Pct2 = total > 0 ? (int)((double)c2 / total * 100) : 0;
            Pct1 = total > 0 ? (int)((double)c1 / total * 100) : 0;

            btnFilterAll.CssClass = "yt-filter-btn" + (CurrentFilter == "All" ? " active" : "");
            btnFilterPublished.CssClass = "yt-filter-btn" + (CurrentFilter == "Published" ? " active" : "");
            btnFilterPending.CssClass = "yt-filter-btn" + (CurrentFilter == "Pending" ? " active" : "");
            btnFilterFlagged.CssClass = "yt-filter-btn" + (CurrentFilter == "Flagged" ? " active" : "");

            var query = list.AsEnumerable();
            if (CurrentFilter != "All")
            {
                query = query.Where(r => r.Status.Equals(CurrentFilter, StringComparison.OrdinalIgnoreCase));
            }

            string search = txtSearch.Text.Trim().ToLower();
            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(r =>
                    (r.GuestName != null && r.GuestName.ToLower().Contains(search)) ||
                    (r.HotelName != null && r.HotelName.ToLower().Contains(search)) ||
                    (r.Comment != null && r.Comment.ToLower().Contains(search))
                );
            }

            rptReviews.DataSource = query.ToList();
            rptReviews.DataBind();
        }

        protected void Filter_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            CurrentFilter = btn.CommandArgument;
            BindReviews();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindReviews();
        }

        protected void rptReviews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int reviewId = Convert.ToInt32(e.CommandArgument);
            var list = GetReviewsList();
            var item = list.FirstOrDefault(r => r.Id == reviewId);

            if (item != null)
            {
                if (e.CommandName == "Publish") item.Status = "Published";
                else if (e.CommandName == "Pending") item.Status = "Pending";
                else if (e.CommandName == "Flag") item.Status = "Flagged";
                else if (e.CommandName == "Delete") list.Remove(item);

                BindReviews();
            }
        }
    }
}