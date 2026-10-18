using System;
using System.Linq;
using System.Web.UI;

namespace Yatrikapp
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardMetrics();
                LoadRecentBookings();
                LoadTopHotels();
            }
        }

        private void LoadDashboardMetrics()
        {
            // 1. Total Revenue
            decimal revenue = AdminStore.GetTotalRevenue();
            litRevenue.Text = "₹" + revenue.ToString("N0");

            // 2. Total Bookings count
            litBookings.Text = AdminStore.GetTotalBookingsCount().ToString();

            // 3. Hotels Listed count
            var hotels = HotelStore.GetHotels();
            litHotelsCount.Text = (hotels != null ? hotels.Count : 12).ToString();

            // 4. Confirmed Stays count
            litConfirmedStays.Text = AdminStore.GetConfirmedCount().ToString();

            // 5. Pending review bookings
            int pending = AdminStore.GetPendingCount();
            litPendingCount.Text = pending.ToString();
        }

        private void LoadRecentBookings()
        {
            var bookings = AdminStore.GetBookings();
            rptRecentBookings.DataSource = bookings.Take(4).ToList();
            rptRecentBookings.DataBind();
        }

        private void LoadTopHotels()
        {
            var hotels = HotelStore.GetHotels();
            rptDashHotels.DataSource = hotels.Take(4).ToList();
            rptDashHotels.DataBind();
        }
    }
}