using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Yatrikapp
{
    [Serializable]
    public class AdminUserItem
    {
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string City { get; set; }
        public string JoinedDate { get; set; }
        public int BookingsCount { get; set; }
        public string Status { get; set; } // "Active" or "Inactive"

        public string Initials
        {
            get
            {
                if (string.IsNullOrEmpty(FullName)) return "U";
                var parts = FullName.Trim().Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                if (parts.Length == 1) return parts[0].Substring(0, Math.Min(2, parts[0].Length)).ToUpper();
                return $"{parts[0][0]}{parts[1][0]}".ToUpper();
            }
        }
    }

    public partial class AdminUsers : Page
    {
        private string CurrentFilter
        {
            get => (ViewState["CurrentFilter"] as string) ?? "All";
            set => ViewState["CurrentFilter"] = value;
        }

        private static List<AdminUserItem> GetUsersList()
        {
            if (HttpContext.Current.Application["AdminUsersList"] == null)
            {
                var list = new List<AdminUserItem>
                {
                    new AdminUserItem { FullName = "Priya Sharma", Email = "priya.s@gmail.com", Phone = "+91 98200 11222", City = "Mumbai", JoinedDate = "2026-03-12", BookingsCount = 3, Status = "Active" },
                    new AdminUserItem { FullName = "Rahul Mehta", Email = "rahul.m@gmail.com", Phone = "+91 99300 22333", City = "Ahmedabad", JoinedDate = "2026-04-20", BookingsCount = 1, Status = "Active" },
                    new AdminUserItem { FullName = "Anjali Nair", Email = "anjali.n@gmail.com", Phone = "+91 97100 33444", City = "Kochi", JoinedDate = "2026-05-05", BookingsCount = 2, Status = "Active" },
                    new AdminUserItem { FullName = "Vikram Patel", Email = "vikram.p@gmail.com", Phone = "+91 98400 44555", City = "Surat", JoinedDate = "2026-06-15", BookingsCount = 1, Status = "Active" },
                    new AdminUserItem { FullName = "Sneha Iyer", Email = "sneha.i@gmail.com", Phone = "+91 96200 55666", City = "Chennai", JoinedDate = "2026-07-01", BookingsCount = 0, Status = "Inactive" },
                    new AdminUserItem { FullName = "Rohan Kapoor", Email = "rohan.k@gmail.com", Phone = "+91 95100 66777", City = "Delhi", JoinedDate = "2026-07-18", BookingsCount = 4, Status = "Active" }
                };
                HttpContext.Current.Application["AdminUsersList"] = list;
            }
            return (List<AdminUserItem>)HttpContext.Current.Application["AdminUsersList"];
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUsers();
            }
        }

        private void BindUsers()
        {
            var list = GetUsersList();

            // Dynamic KPI counts
            int total = list.Count;
            int active = list.Count(u => u.Status.Equals("Active", StringComparison.OrdinalIgnoreCase));
            int totalBookings = list.Sum(u => u.BookingsCount);

            litTotalUsers.Text = total.ToString();
            litActiveUsers.Text = active.ToString();
            litTotalBookings.Text = totalBookings.ToString();
            litSubCount.Text = $"{total} registered users";

            // Filter button active classes
            btnFilterAll.CssClass = "yt-filter-btn" + (CurrentFilter == "All" ? " active" : "");
            btnFilterActive.CssClass = "yt-filter-btn" + (CurrentFilter == "Active" ? " active" : "");
            btnFilterInactive.CssClass = "yt-filter-btn" + (CurrentFilter == "Inactive" ? " active" : "");

            // Apply filter
            var query = list.AsEnumerable();
            if (CurrentFilter != "All")
            {
                query = query.Where(u => u.Status.Equals(CurrentFilter, StringComparison.OrdinalIgnoreCase));
            }

            // Apply search
            string search = txtSearch.Text.Trim().ToLower();
            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(u =>
                    (u.FullName != null && u.FullName.ToLower().Contains(search)) ||
                    (u.Email != null && u.Email.ToLower().Contains(search)) ||
                    (u.City != null && u.City.ToLower().Contains(search))
                );
            }

            rptUsers.DataSource = query.ToList();
            rptUsers.DataBind();
        }

        protected void Filter_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            CurrentFilter = btn.CommandArgument;
            BindUsers();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindUsers();
        }

        protected void rptUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string email = e.CommandArgument.ToString();
            var list = GetUsersList();
            var user = list.FirstOrDefault(u => u.Email.Equals(email, StringComparison.OrdinalIgnoreCase));

            if (user != null)
            {
                if (e.CommandName == "ToggleStatus")
                {
                    user.Status = (user.Status == "Active") ? "Inactive" : "Active";
                }
                else if (e.CommandName == "DeleteUser")
                {
                    list.Remove(user);
                }
                BindUsers();
            }
        }
    }
}