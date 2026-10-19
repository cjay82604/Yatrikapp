using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Yatrikapp
{
    [Serializable]
    public class HotelItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Category { get; set; }
        public string Location { get; set; }
        public double Rating { get; set; }
        public int Reviews { get; set; }
        public decimal Price { get; set; }
        public string ImageUrl { get; set; }
        public bool IsFullyBooked { get; set; }
        public bool IsSaved { get; set; }
        public string ShortLocation => !string.IsNullOrEmpty(Location) ? Location.Split(',')[0].Trim() : "";
    }

    public static class HotelStore
    {
        public static List<HotelItem> GetHotels()
        {
            if (HttpContext.Current.Session["AllHotelsList"] == null)
            {
                var list = new List<HotelItem>
                {
                    new HotelItem { Id = 1, Name = "Haveli by the Lake", Category = "Heritage", Location = "Udaipur, Rajasthan", Rating = 4.9, Reviews = 204, Price = 8500, ImageUrl = "https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=600&q=80", IsFullyBooked = false, IsSaved = false },
                    new HotelItem { Id = 7, Name = "Spice Garden Resort", Category = "Resort", Location = "Munnar, Kerala", Rating = 4.7, Reviews = 196, Price = 5200, ImageUrl = "https://images.unsplash.com/photo-1514933651103-005eec06c04b?auto=format&fit=crop&w=600&q=80", IsFullyBooked = false, IsSaved = false },
                    new HotelItem { Id = 10, Name = "Royal Sands Goa", Category = "Beach Resort", Location = "Calangute, Goa", Rating = 4.6, Reviews = 312, Price = 6800, ImageUrl = "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=600&q=80", IsFullyBooked = false, IsSaved = true },
                    new HotelItem { Id = 3, Name = "Jaipur Palace View", Category = "Heritage", Location = "Jaipur, Rajasthan", Rating = 4.8, Reviews = 178, Price = 7200, ImageUrl = "https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=600&q=80", IsFullyBooked = true, IsSaved = false },
                    new HotelItem { Id = 4, Name = "Himalayan Nest", Category = "Mountain Lodge", Location = "Manali, Himachal Pradesh", Rating = 4.8, Reviews = 143, Price = 4500, ImageUrl = "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=600&q=80", IsFullyBooked = false, IsSaved = false },
                    new HotelItem { Id = 8, Name = "Marina Heritage Mumbai", Category = "City Hotel", Location = "Colaba, Maharashtra", Rating = 4.7, Reviews = 209, Price = 9800, ImageUrl = "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=600&q=80", IsFullyBooked = false, IsSaved = false },
                    new HotelItem { Id = 5, Name = "Backwater Villa", Category = "Resort", Location = "Alleppey, Kerala", Rating = 4.8, Reviews = 187, Price = 7500, ImageUrl = "https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=600&q=80", IsFullyBooked = false, IsSaved = false },
                    new HotelItem { Id = 2, Name = "Rann Desert Camp", Category = "Heritage", Location = "Bhuj, Gujarat", Rating = 4.9, Reviews = 112, Price = 12000, ImageUrl = "https://images.unsplash.com/photo-1509316975850-ff9c5deb0cd9?auto=format&fit=crop&w=600&q=80", IsFullyBooked = false, IsSaved = true },
                    new HotelItem { Id = 11, Name = "Coorg Mist Retreat", Category = "Mountain Lodge", Location = "Madikeri, Karnataka", Rating = 4.6, Reviews = 138, Price = 5800, ImageUrl = "https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=600&q=80", IsFullyBooked = false, IsSaved = false },
                    new HotelItem { Id = 9, Name = "Rishikesh River Lodge", Category = "Resort", Location = "Rishikesh, Uttarakhand", Rating = 4.7, Reviews = 241, Price = 4200, ImageUrl = "https://images.unsplash.com/photo-1544551763-46a013bb70d5?auto=format&fit=crop&w=600&q=80", IsFullyBooked = false, IsSaved = false },
                    new HotelItem { Id = 12, Name = "Pondicherry French Quarter Inn", Category = "City Hotel", Location = "White Town, Puducherry", Rating = 4.5, Reviews = 204, Price = 5500, ImageUrl = "https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=600&q=80", IsFullyBooked = false, IsSaved = false },
                    new HotelItem { Id = 6, Name = "Corbett Jungle Stay", Category = "Resort", Location = "Jim Corbett, Uttarakhand", Rating = 4.8, Reviews = 98, Price = 9500, ImageUrl = "https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=600&q=80", IsFullyBooked = true, IsSaved = false }
                };
                HttpContext.Current.Session["AllHotelsList"] = list;
            }
            return (List<HotelItem>)HttpContext.Current.Session["AllHotelsList"];
        }

        public static List<HotelItem> GetSavedHotels()
        {
            return GetHotels().Where(h => h.IsSaved).ToList();
        }

        public static void ToggleSaveHotel(int id)
        {
            var hotel = GetHotels().FirstOrDefault(h => h.Id == id);
            if (hotel != null)
            {
                hotel.IsSaved = !hotel.IsSaved;
            }
        }

        public static void AddHotel(string name, string category, string city, string state, decimal price, bool available)
        {
            var list = GetHotels();
            int newId = list.Count > 0 ? list.Max(h => h.Id) + 1 : 1;
            string loc = string.IsNullOrEmpty(state) ? city : $"{city}, {state}";
            list.Insert(0, new HotelItem
            {
                Id = newId,
                Name = name,
                Category = category,
                Location = loc,
                Price = price,
                Rating = 4.8,
                Reviews = 10,
                IsFullyBooked = !available,
                IsSaved = false,
                ImageUrl = "https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=600&q=80"
            });
        }

        public static void UpdateHotel(int id, string name, string category, string city, string state, decimal price, bool available)
        {
            var list = GetHotels();
            var hotel = list.FirstOrDefault(h => h.Id == id);
            if (hotel != null)
            {
                hotel.Name = name;
                hotel.Category = category;
                hotel.Location = string.IsNullOrEmpty(state) ? city : $"{city}, {state}";
                hotel.Price = price;
                hotel.IsFullyBooked = !available;
            }
        }

        public static void DeleteHotel(int id)
        {
            var list = GetHotels();
            var hotel = list.FirstOrDefault(h => h.Id == id);
            if (hotel != null)
            {
                list.Remove(hotel);
            }
        }
    }
}