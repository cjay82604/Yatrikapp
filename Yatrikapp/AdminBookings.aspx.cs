using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Yatrikapp
{
    public partial class AdminBookings : Page
    {
        private string CurrentFilter
        {
            get => (ViewState["CurrentFilter"] as string) ?? "All";
            set => ViewState["CurrentFilter"] = value;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBookings();
            }
        }

        private void BindBookings()
        {
            var all = AdminStore.GetBookings();

            // Dynamic filter counts
            int total = all.Count;
            int confirmed = AdminStore.GetConfirmedCount();
            int pending = AdminStore.GetPendingCount();
            int cancelled = AdminStore.GetCancelledCount();

            btnFilterAll.Text = $"All ({total})";
            btnFilterConfirmed.Text = $"Confirmed ({confirmed})";
            btnFilterPending.Text = $"Pending ({pending})";
            btnFilterCancelled.Text = $"Cancelled ({cancelled})";
            litTotalSubtitle.Text = $"{total} total bookings";

            // Active button classes
            btnFilterAll.CssClass = "yt-filter-btn" + (CurrentFilter == "All" ? " active" : "");
            btnFilterConfirmed.CssClass = "yt-filter-btn" + (CurrentFilter == "Confirmed" ? " active" : "");
            btnFilterPending.CssClass = "yt-filter-btn" + (CurrentFilter == "Pending" ? " active" : "");
            btnFilterCancelled.CssClass = "yt-filter-btn" + (CurrentFilter == "Cancelled" ? " active" : "");

            // Apply filter dynamically
            var filtered = all;
            if (CurrentFilter != "All")
            {
                filtered = all.Where(b => b.Status.Equals(CurrentFilter, StringComparison.OrdinalIgnoreCase)).ToList();
            }

            rptBookings.DataSource = filtered;
            rptBookings.DataBind();
        }

        protected void Filter_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            CurrentFilter = btn.CommandArgument;
            BindBookings();
        }

        protected void rptBookings_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string bookingId = e.CommandArgument.ToString();

            if (e.CommandName == "Confirm")
            {
                AdminStore.ConfirmBooking(bookingId);
                BindBookings();
            }
            else if (e.CommandName == "Cancel")
            {
                AdminStore.CancelBooking(bookingId);
                BindBookings();
            }
        }
    }
}