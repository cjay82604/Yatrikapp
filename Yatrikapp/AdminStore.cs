using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Yatrikapp
{
    [Serializable]
    public class AdminBookingItem
    {
        public string Id { get; set; }
        public string GuestName { get; set; }
        public string Email { get; set; }
        public string HotelName { get; set; }
        public string Dates { get; set; }
        public string DateText => Dates;
        public int Guests { get; set; }
        public decimal Amount { get; set; }
        public string Status { get; set; }

        public string StatusClass
        {
            get
            {
                if (string.IsNullOrEmpty(Status)) return "confirmed";
                string s = Status.ToLower();
                if (s.Contains("confirm")) return "confirmed";
                if (s.Contains("pending")) return "pending";
                if (s.Contains("cancel")) return "cancelled";
                return "completed";
            }
        }
    }

    public static class AdminStore
    {
        private static readonly object _lock = new object();

        public static List<AdminBookingItem> GetBookings()
        {
            if (HttpContext.Current.Application["AdminBookingsList"] == null)
            {
                lock (_lock)
                {
                    if (HttpContext.Current.Application["AdminBookingsList"] == null)
                    {
                        var list = new List<AdminBookingItem>
                        {
                            new AdminBookingItem { Id = "YT-7470", GuestName = "Arjun Sharma", Email = "j@gmail.com", HotelName = "Rann Desert Camp", Dates = "2026-09-29\n→ 2026-09-29", Guests = 2, Amount = 13440, Status = "Confirmed" },
                            new AdminBookingItem { Id = "YT-0041", GuestName = "Priya Sharma", Email = "priya.s@gmail.com", HotelName = "Haveli by the Lake", Dates = "2026-08-15\n→ 2026-08-19", Guests = 2, Amount = 34000, Status = "Confirmed" },
                            new AdminBookingItem { Id = "YT-0042", GuestName = "Rahul Mehta", Email = "rahul.m@gmail.com", HotelName = "Royal Sands Goa", Dates = "2026-09-10\n→ 2026-09-14", Guests = 3, Amount = 27200, Status = "Pending" },
                            new AdminBookingItem { Id = "YT-0043", GuestName = "Anjali Nair", Email = "anjali.n@gmail.com", HotelName = "Himalayan Nest", Dates = "2026-10-05\n→ 2026-10-09", Guests = 2, Amount = 18000, Status = "Confirmed" },
                            new AdminBookingItem { Id = "YT-0044", GuestName = "Vikram Patel", Email = "vikram.p@gmail.com", HotelName = "Marina Heritage Mumbai", Dates = "2026-11-01\n→ 2026-11-04", Guests = 2, Amount = 29400, Status = "Confirmed" },
                            new AdminBookingItem { Id = "YT-0045", GuestName = "Sneha Iyer", Email = "sneha.i@gmail.com", HotelName = "Spice Garden Resort", Dates = "2026-08-22\n→ 2026-08-26", Guests = 2, Amount = 20800, Status = "Cancelled" }
                        };
                        HttpContext.Current.Application["AdminBookingsList"] = list;
                    }
                }
            }
            return (List<AdminBookingItem>)HttpContext.Current.Application["AdminBookingsList"];
        }

        public static void AddBooking(string guestName, string hotelName, string dates, decimal amount, string status, string email = "guest@example.com", int guests = 2)
        {
            var list = GetBookings();
            lock (_lock)
            {
                list.Insert(0, new AdminBookingItem
                {
                    Id = "YT-" + new Random().Next(7000, 7999),
                    GuestName = guestName,
                    Email = email,
                    HotelName = hotelName,
                    Dates = dates,
                    Guests = guests,
                    Amount = amount,
                    Status = status
                });
            }
        }

        public static void ConfirmBooking(string id)
        {
            var booking = GetBookings().FirstOrDefault(b => b.Id == id);
            if (booking != null) booking.Status = "Confirmed";
        }

        public static void CancelBooking(string id)
        {
            var booking = GetBookings().FirstOrDefault(b => b.Id == id);
            if (booking != null) booking.Status = "Cancelled";
        }

        public static decimal GetTotalRevenue()
        {
            return GetBookings().Where(b => b.Status != "Cancelled").Sum(b => b.Amount);
        }

        public static int GetTotalBookingsCount()
        {
            return GetBookings().Count;
        }

        public static int GetConfirmedCount()
        {
            return GetBookings().Count(b => b.Status.Equals("Confirmed", StringComparison.OrdinalIgnoreCase));
        }

        public static int GetPendingCount()
        {
            return GetBookings().Count(b => b.Status.Equals("Pending", StringComparison.OrdinalIgnoreCase));
        }

        public static int GetCancelledCount()
        {
            return GetBookings().Count(b => b.Status.Equals("Cancelled", StringComparison.OrdinalIgnoreCase));
        }
    }
}