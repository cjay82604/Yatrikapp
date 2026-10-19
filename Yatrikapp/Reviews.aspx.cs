using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Yatrikapp
{
    public partial class Reviews : Page
    {
        public string AvgRatingText { get; set; } = "4.7";
        public int TotalReviewsCount { get; set; } = 3;
        public int Count5 { get; set; } = 2;
        public int Count4 { get; set; } = 1;
        public int Count3 { get; set; } = 0;
        public int Pct5 { get; set; } = 66;
        public int Pct4 { get; set; } = 33;
        public int Pct3 { get; set; } = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool isLoggedIn = Session["CurrentUser"] != null;

                if (isLoggedIn)
                {
                    phLoggedInReviewBtn.Visible = true;
                    phAnonymousReviewBtn.Visible = false;

                    // If redirected from Leave a Review in Past trips
                    if (!string.IsNullOrEmpty(Request.QueryString["hotel"]))
                    {
                        string targetHotel = Request.QueryString["hotel"];
                        var item = ddlHotels.Items.Cast<ListItem>().FirstOrDefault(i => i.Value.IndexOf(targetHotel, StringComparison.OrdinalIgnoreCase) >= 0);
                        if (item != null)
                        {
                            ddlHotels.SelectedValue = item.Value;
                        }
                        pnlReviewForm.Visible = true;
                        btnToggleForm.Text = "Cancel";
                    }
                    else
                    {
                        pnlReviewForm.Visible = false;
                        btnToggleForm.Text = "Add review";
                    }
                }
                else
                {
                    phLoggedInReviewBtn.Visible = false;
                    phAnonymousReviewBtn.Visible = true;
                    pnlReviewForm.Visible = false;
                }

                BindReviews();
            }
        }

        private void BindReviews()
        {
            // Only show APPROVED reviews
            var list = ReviewStore.GetReviews().Where(r => r.IsApproved).ToList();

            TotalReviewsCount = list.Count;
            double avg = TotalReviewsCount > 0 ? list.Average(r => r.Rating) : 5.0;
            AvgRatingText = avg.ToString("0.0");

            Count5 = list.Count(r => r.Rating == 5);
            Count4 = list.Count(r => r.Rating == 4);
            Count3 = list.Count(r => r.Rating <= 3);

            Pct5 = TotalReviewsCount > 0 ? (Count5 * 100) / TotalReviewsCount : 0;
            Pct4 = TotalReviewsCount > 0 ? (Count4 * 100) / TotalReviewsCount : 0;
            Pct3 = TotalReviewsCount > 0 ? (Count3 * 100) / TotalReviewsCount : 0;

            rptReviews.DataSource = list;
            rptReviews.DataBind();
        }

        protected void btnToggleForm_Click(object sender, EventArgs e)
        {
            pnlApprovalNotice.Visible = false; // Clear banner when user clicks toggle
            pnlReviewForm.Visible = !pnlReviewForm.Visible;
            btnToggleForm.Text = pnlReviewForm.Visible ? "Cancel" : "Add review";
        }

        protected void SetRating_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int r = Convert.ToInt32(btn.CommandArgument);
            hfRating.Value = r.ToString();

            star1.Text = r >= 1 ? "&#9733;" : "&#9734;";
            star2.Text = r >= 2 ? "&#9733;" : "&#9734;";
            star3.Text = r >= 3 ? "&#9733;" : "&#9734;";
            star4.Text = r >= 4 ? "&#9733;" : "&#9734;";
            star5.Text = r >= 5 ? "&#9733;" : "&#9734;";
        }

        protected void btnSubmitReview_Click(object sender, EventArgs e)
        {
            string reviewText = txtReview.Text.Trim();
            if (string.IsNullOrEmpty(reviewText))
            {
                return;
            }

            int rating = 5;
            int.TryParse(hfRating.Value, out rating);

            string hotelSelection = ddlHotels.SelectedValue;
            string[] parts = hotelSelection.Split(new[] { " · " }, StringSplitOptions.None);
            string hotelName = parts[0];
            string loc = parts.Length > 1 ? parts[1] : "India";

            string userName = Session["UserName"] as string ?? "Arjun Sharma";

            // Submit review with IsApproved = false
            ReviewStore.AddReview(new ReviewItem
            {
                AuthorName = userName,
                Date = DateTime.Today.ToString("yyyy-MM-dd"),
                Rating = rating,
                HotelName = hotelName,
                Location = loc,
                ReviewText = reviewText,
                HelpfulCount = 0,
                IsApproved = false // Awaiting approval
            });

            // 1. Hide the form
            pnlReviewForm.Visible = false;

            // 2. Display the green approval notice banner matching screenshot
            pnlApprovalNotice.Visible = true;

            // 3. Switch button back to "Add review"
            btnToggleForm.Text = "Add review";

            // 4. Reset inputs
            txtReview.Text = string.Empty;

            // 5. Rebind approved reviews
            BindReviews();
        }

        protected void rptReviews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Helpful")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                var list = ReviewStore.GetReviews();
                var rev = list.FirstOrDefault(r => r.Id == id);
                if (rev != null)
                {
                    rev.HelpfulCount++;
                }
                BindReviews();
            }
        }

        public string GetStars(int count)
        {
            string stars = "";
            for (int i = 0; i < count; i++) stars += "★";
            return stars;
        }
    }
}