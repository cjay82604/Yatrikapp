using System;
using System.Collections.Generic;
using System.Web;

namespace Yatrikapp
{
    [Serializable]
    public class ReviewItem
    {
        public int Id { get; set; }
        public string AuthorName { get; set; }
        public string AvatarInitial => !string.IsNullOrEmpty(AuthorName) ? AuthorName[0].ToString().ToUpper() : "U";
        public string Date { get; set; }
        public int Rating { get; set; }
        public string HotelName { get; set; }
        public string Location { get; set; }
        public string ReviewText { get; set; }
        public int HelpfulCount { get; set; }
        public bool IsApproved { get; set; } = true; // Approval flag
    }

    public static class ReviewStore
    {
        public static List<ReviewItem> GetReviews()
        {
            if (HttpContext.Current.Session["HotelReviews"] == null)
            {
                var list = new List<ReviewItem>
                {
                    // 3 Approved reviews (Screenshot)
                    new ReviewItem
                    {
                        Id = 1,
                        AuthorName = "Priya Sharma",
                        Date = "2026-07-10",
                        Rating = 5,
                        HotelName = "Haveli by the Lake",
                        Location = "Udaipur",
                        ReviewText = "Absolutely magical. The lake view, the staff, the heritage ambience — Yatrik made it all so easy to book. Will stay again!",
                        HelpfulCount = 0,
                        IsApproved = true
                    },
                    new ReviewItem
                    {
                        Id = 2,
                        AuthorName = "Rahul Mehta",
                        Date = "2026-06-28",
                        Rating = 4,
                        HotelName = "Royal Sands Goa",
                        Location = "Calangute",
                        ReviewText = "Great beach resort. Clean rooms and fantastic seafood. The pool could be better maintained but overall a wonderful trip.",
                        HelpfulCount = 0,
                        IsApproved = true
                    },
                    new ReviewItem
                    {
                        Id = 3,
                        AuthorName = "Anjali Nair",
                        Date = "2026-06-15",
                        Rating = 5,
                        HotelName = "Spice Garden Resort",
                        Location = "Munnar",
                        ReviewText = "Woke up to misty tea gardens every morning. The Ayurvedic massage was the highlight. Pure Kerala magic.",
                        HelpfulCount = 0,
                        IsApproved = true
                    }
                };
                HttpContext.Current.Session["HotelReviews"] = list;
            }
            return (List<ReviewItem>)HttpContext.Current.Session["HotelReviews"];
        }

        public static void AddReview(ReviewItem rev)
        {
            var list = GetReviews();
            rev.Id = list.Count + 1;
            rev.IsApproved = false; // Requires admin approval!
            list.Insert(0, rev);
        }

        public static void ApproveReview(int id)
        {
            var list = GetReviews();
            var item = list.Find(r => r.Id == id);
            if (item != null)
            {
                item.IsApproved = true;
            }
        }
    }
}