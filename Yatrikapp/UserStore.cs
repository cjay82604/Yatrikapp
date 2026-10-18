using System;
using System.Collections.Generic;
using System.Web;

namespace YourWebFormsProject
{
    public class UserAccount
    {
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Password { get; set; }
        public string Location { get; set; } = "India";
    }

    public static class UserStore
    {
        private static readonly object _lock = new object();

        private static Dictionary<string, UserAccount> GetUsers()
        {
            if (HttpContext.Current.Application["RegisteredUsers"] == null)
            {
                lock (_lock)
                {
                    if (HttpContext.Current.Application["RegisteredUsers"] == null)
                    {
                        var dict = new Dictionary<string, UserAccount>(StringComparer.OrdinalIgnoreCase);
                        // Default demo user matching the Figma screenshot placeholder
                        dict["j@gmail.com"] = new UserAccount
                        {
                            FullName = "Arjun Sharma",
                            Email = "j@gmail.com",
                            Mobile = "",
                            Location = "India",
                            Password = "password123"
                        };
                        dict["you@example.com"] = new UserAccount
                        {
                            FullName = "Arjun Sharma",
                            Email = "you@example.com",
                            Mobile = "+91 98765 43210",
                            Location = "India",
                            Password = "password123"
                        };
                        HttpContext.Current.Application["RegisteredUsers"] = dict;
                    }
                }
            }
            return (Dictionary<string, UserAccount>)HttpContext.Current.Application["RegisteredUsers"];
        }

        public static bool Register(UserAccount user)
        {
            var users = GetUsers();
            lock (_lock)
            {
                if (users.ContainsKey(user.Email))
                    return false; // Email already exists

                users[user.Email] = user;
                return true;
            }
        }

        public static UserAccount Validate(string email, string password)
        {
            var users = GetUsers();
            if (users.TryGetValue(email, out var user))
            {
                if (user.Password == password)
                {
                    return user;
                }
            }
            return null;
        }

        public static void SaveOrUpdate(UserAccount user)
        {
            var users = GetUsers();
            lock (_lock)
            {
                users[user.Email] = user;
            }
        }
    }
}