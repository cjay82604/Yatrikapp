using System;
using System.Web.UI;

namespace YourWebFormsProject
{
    public partial class TripDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string bookingId = Request.QueryString["id"] ?? "YT-6530";
                LoadTrip(bookingId);
            }
        }

        private void LoadTrip(string bookingId)
        {
            var trip = TripStore.GetTripById(bookingId);

            // Default fallback if ID not found
            if (trip == null)
            {
                trip = TripStore.GetTrips()[0];
            }

            // Bind Banner and Information
            imgBanner.ImageUrl = trip.ImageUrl;
            litHotelName.Text = trip.HotelName;
            litLocation.Text = trip.Location ?? "Udaipur, Rajasthan";

            litBookingId.Text = trip.BookingId;
            litNights.Text = trip.Nights.ToString();
            litGuests.Text = trip.Guests.ToString();
            litRooms.Text = trip.Rooms.ToString();

            litCheckIn.Text = trip.CheckIn;
            litCheckOut.Text = trip.CheckOut;

            litBaseRate.Text = string.Format("{0:N0}", trip.BaseRate);
            litCalcFormula.Text = $"{trip.Nights}N &times; {trip.Rooms} room";
            litSubTotal.Text = string.Format("{0:N0}", trip.SubTotal);
            litTax.Text = string.Format("{0:N0}", trip.GST);
            litTotal.Text = trip.TotalPrice;

            // RENDER SPECIFIC STATE (Upcoming, Past, or Cancelled)
            if (trip.Status == "Upcoming")
            {
                // Screenshot 1: Upcoming
                badgeStatus.Attributes["class"] = "yt-td-badge confirmed";
                litBadgeText.Text = "Confirmed";

                phPaymentMethodRow.Visible = true;
                litPaymentMethod.Text = trip.PaymentMethod ?? "Pay at hotel";
                litTotalLabel.Text = "Amount due at hotel";

                phUpcomingActions.Visible = true;
                phPastActions.Visible = false;
                phCancelledActions.Visible = false;
            }
            else if (trip.Status == "Past")
            {
                // Screenshot 2: Past
                badgeStatus.Attributes["class"] = "yt-td-badge confirmed";
                litBadgeText.Text = "Confirmed";

                phPaymentMethodRow.Visible = false;
                litTotalLabel.Text = "Total paid";

                phUpcomingActions.Visible = false;
                phPastActions.Visible = true;
                phCancelledActions.Visible = false;
            }
            else // Cancelled
            {
                // Screenshot 3: Cancelled
                badgeStatus.Attributes["class"] = "yt-td-badge cancelled";
                litBadgeText.Text = "Cancelled";

                phPaymentMethodRow.Visible = false;
                litTotalLabel.Text = "Total paid";

                phUpcomingActions.Visible = false;
                phPastActions.Visible = false;
                phCancelledActions.Visible = true;
            }
        }

        // Action when user clicks "Cancel booking"
        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {
            string bookingId = litBookingId.Text;
            TripStore.CancelTrip(bookingId);

            // Re-render the page now in the Cancelled state (Screenshot 3)
            LoadTrip(bookingId);
        }
    }
}