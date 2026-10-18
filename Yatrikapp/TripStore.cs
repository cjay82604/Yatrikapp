using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YourWebFormsProject
{
    [Serializable]
    public class TripItem
    {
        public string BookingId { get; set; }
        public string HotelName { get; set; }
        public string Location { get; set; }
        public string Status { get; set; } // "Upcoming", "Past", "Cancelled"
        public string CheckIn { get; set; }
        public string CheckOut { get; set; }
        public int Nights { get; set; }
        public int Guests { get; set; }
        public int Rooms { get; set; }
        public decimal BaseRate { get; set; }
        public decimal SubTotal { get; set; }
        public decimal GST { get; set; }
        public string TotalPrice { get; set; }
        public string PaymentMethod { get; set; }
        public string ImageUrl { get; set; }
        public string Email { get; set; }
        public string DateRangeText { get; set; }
    }

    public static class TripStore
    {
        public static List<TripItem> GetTrips()
        {
            if (HttpContext.Current.Session["UserTrips"] == null)
            {
                var list = new List<TripItem>
                {
                    // 1. Upcoming (Screenshot 1)
                    new TripItem
                    {
                        BookingId = "YT-6530",
                        HotelName = "Haveli by the Lake",
                        Location = "Udaipur, Rajasthan",
                        Status = "Upcoming",
                        CheckIn = "2026-10-08",
                        CheckOut = "2026-10-23",
                        Nights = 15,
                        Guests = 2,
                        Rooms = 1,
                        BaseRate = 8500,
                        SubTotal = 127500,
                        GST = 15280,
                        TotalPrice = "1,42,800",
                        PaymentMethod = "Pay at hotel",
                        ImageUrl = "https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=800&q=80",
                        Email = "you@example.com"
                    },
                    new TripItem
                    {
                        BookingId = "YT-0044",
                        HotelName = "Marina Heritage Mumbai",
                        Location = "Colaba, Maharashtra",
                        Status = "Upcoming",
                        CheckIn = "2026-11-01",
                        CheckOut = "2026-11-04",
                        Nights = 3,
                        Guests = 2,
                        Rooms = 1,
                        BaseRate = 9600,
                        SubTotal = 28800,
                        GST = 600,
                        TotalPrice = "29,400",
                        PaymentMethod = "Pay at hotel",
                        ImageUrl = "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=800&q=80",
                        Email = "you@example.com"
                    },

                    // 2. Past (Screenshot 2)
                    new TripItem
                    {
                        BookingId = "YT-0041",
                        HotelName = "Haveli by the Lake",
                        Location = "Udaipur, Rajasthan",
                        Status = "Past",
                        CheckIn = "2026-08-15",
                        CheckOut = "2026-08-19",
                        Nights = 4,
                        Guests = 2,
                        Rooms = 1,
                        BaseRate = 8500,
                        SubTotal = 34000,
                        GST = 3638,
                        TotalPrice = "34,000",
                        PaymentMethod = "Paid online",
                        ImageUrl = "https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=800&q=80",
                        Email = "you@example.com"
                    },

                    // 3. Cancelled (Screenshot 3)
                    new TripItem
                    {
                        BookingId = "YT-0045",
                        HotelName = "Spice Garden Resort",
                        Location = "Munnar, Kerala",
                        Status = "Cancelled",
                        CheckIn = "2026-08-22",
                        CheckOut = "2026-08-26",
                        Nights = 4,
                        Guests = 2,
                        Rooms = 1,
                        BaseRate = 5200,
                        SubTotal = 20800,
                        GST = 2226,
                        TotalPrice = "20,800",
                        PaymentMethod = "Refunded",
                        ImageUrl = "https://images.unsplash.com/photo-1514933651103-005eec06c04b?auto=format&fit=crop&w=800&q=80",
                        Email = "you@example.com"
                    }
                };
                HttpContext.Current.Session["UserTrips"] = list;
            }
            return (List<TripItem>)HttpContext.Current.Session["UserTrips"];
        }

        public static void AddTrip(TripItem trip)
        {
            var trips = GetTrips();
            trips.Insert(0, trip);
        }

        public static TripItem GetTripById(string bookingId)
        {
            var trips = GetTrips();
            return trips.FirstOrDefault(t => t.BookingId.Equals(bookingId, StringComparison.OrdinalIgnoreCase));
        }

        public static bool CancelTrip(string bookingId)
        {
            var trip = GetTripById(bookingId);
            if (trip != null && trip.Status == "Upcoming")
            {
                trip.Status = "Cancelled";
                return true;
            }
            return false;
        }
    }
}