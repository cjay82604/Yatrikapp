using System;
using System.Web.UI;

namespace YourWebFormsProject
{
    public partial class BookingConfirmation : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                litBookingId.Text = Session["LastBookingId"] as string ?? "YT-7470";
                litEmail.Text = Session["ConfirmedEmail"] as string ?? "j@gmail.com";
                litHotelName.Text = Session["ConfirmedHotel"] as string ?? "Rann Desert Camp";
                litCheckIn.Text = Session["ConfirmedCheckIn"] as string ?? DateTime.Today.ToString("yyyy-MM-dd");
                litCheckOut.Text = Session["ConfirmedCheckOut"] as string ?? DateTime.Today.AddDays(1).ToString("yyyy-MM-dd");
                litAmountDue.Text = Session["ConfirmedTotal"] as string ?? "13,440";
            }
        }
    }
}