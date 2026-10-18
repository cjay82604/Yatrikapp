using System;
using System.Web.UI;

namespace YourWebFormsProject
{
    public partial class Booking : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Disable unobtrusive validation to prevent missing jQuery runtime issues
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                pnlAlert.Visible = false;

                // 1. Determine hotel ID from query string (defaults to 2: Rann Desert Camp)
                int hotelId = 2;
                if (int.TryParse(Request.QueryString["id"], out int id))
                {
                    hotelId = id;
                }

                lnkBack.NavigateUrl = "HotelDetails.aspx?id=" + hotelId;

                // 2. Set default check-in and check-out dates
                txtCheckIn.Text = Request.QueryString["in"] ?? DateTime.Today.ToString("yyyy-MM-dd");
                txtCheckOut.Text = Request.QueryString["out"] ?? DateTime.Today.AddDays(1).ToString("yyyy-MM-dd");

                // 3. Auto-fill logged-in user details if available
                if (Session["CurrentUser"] != null)
                {
                    UserAccount user = (UserAccount)Session["CurrentUser"];
                    string[] nameParts = (user.FullName ?? "").Split(new[] { ' ' }, 2, StringSplitOptions.RemoveEmptyEntries);
                    txtFirstName.Text = nameParts.Length > 0 ? nameParts[0] : "";
                    txtLastName.Text = nameParts.Length > 1 ? nameParts[1] : "";
                    txtEmail.Text = user.Email ?? "";
                    txtPhone.Text = user.Mobile ?? "";
                }

                // 4. Load right sidebar summary card
                LoadSummary(hotelId);
            }
        }

        private void LoadSummary(int id)
        {
            if (id == 1) // Haveli by the Lake
            {
                litCategory.Text = "Heritage";
                litHotelName.Text = "Haveli by the Lake";
                litLocation.Text = "Udaipur, Rajasthan";
                imgHotel.ImageUrl = "https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=600&q=80";

                litBaseRate.Text = "8,500";
                litSubTotal.Text = "8,500";
                litTax.Text = "1,020";
                litTotal.Text = "9,520";
                litPaymentDue.Text = "9,520";
            }
            else // Rann Desert Camp (Matching Screenshot)
            {
                litCategory.Text = "Heritage";
                litHotelName.Text = "Rann Desert Camp";
                litLocation.Text = "Bhuj, Gujarat";
                imgHotel.ImageUrl = "https://images.unsplash.com/photo-1509316975850-ff9c5deb0cd9?auto=format&fit=crop&w=600&q=80";

                litBaseRate.Text = "12,000";
                litSubTotal.Text = "12,000";
                litTax.Text = "1,440";
                litTotal.Text = "13,440";
                litPaymentDue.Text = "13,440";
            }
        }

        // Action when user clicks "Continue →" on Step 1
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            // Validate all Step 1 inputs
            Page.Validate("BookingGroup");

            if (!Page.IsValid)
            {
                return;
            }

            // Check that Check-out is strictly after Check-in
            DateTime checkInDate, checkOutDate;
            if (DateTime.TryParse(txtCheckIn.Text, out checkInDate) && DateTime.TryParse(txtCheckOut.Text, out checkOutDate))
            {
                if (checkOutDate <= checkInDate)
                {
                    pnlAlert.Visible = true;
                    litAlertMessage.Text = "<div class='yt-alert yt-alert-danger'>Check-out date must be after Check-in date.</div>";
                    return;
                }
            }

            pnlAlert.Visible = false;

            // Transition smoothly to Step 2 (Payment Option)
            pnlStep1.Visible = false;
            pnlStep2.Visible = true;
        }

        // Action when user clicks "← Back" on Step 2
        protected void btnBackToStep1_Click(object sender, EventArgs e)
        {
            pnlStep2.Visible = false;
            pnlStep1.Visible = true;
        }

        // Action when user clicks "Confirm booking" on Step 2
        protected void btnConfirmBooking_Click(object sender, EventArgs e)
        {
            // Generate booking ID (e.g., YT-7470)
            string bookingId = "YT-" + new Random().Next(7000, 7999).ToString();

            // 1. Store in Session for BookingConfirmation.aspx
            Session["LastBookingId"] = bookingId;
            Session["ConfirmedHotel"] = litHotelName.Text;
            Session["ConfirmedEmail"] = txtEmail.Text.Trim();
            Session["ConfirmedCheckIn"] = txtCheckIn.Text;
            Session["ConfirmedCheckOut"] = txtCheckOut.Text;
            Session["ConfirmedTotal"] = litTotal.Text;

            // 2. Add as an Upcoming trip into TripStore
            int guests = 2;
            int.TryParse(ddlGuests.SelectedValue, out guests);

            TripStore.AddTrip(new TripItem
            {
                BookingId = bookingId,
                HotelName = litHotelName.Text,
                Status = "Upcoming",
                DateRangeText = $"{txtCheckIn.Text} — {txtCheckOut.Text}",
                Guests = guests,
                TotalPrice = litTotal.Text,
                ImageUrl = imgHotel.ImageUrl,
                PaymentMethod = "Pay at hotel",
                Email = txtEmail.Text.Trim()
            });

            // 3. Add to AdminStore so it dynamically reflects in Admin Dashboard
            decimal totalNum = 0;
            string cleanTotal = litTotal.Text.Replace("₹", "").Replace(",", "").Trim();
            decimal.TryParse(cleanTotal, out totalNum);
            string guestName = (txtFirstName.Text.Trim() + " " + txtLastName.Text.Trim()).Trim();
            if (string.IsNullOrEmpty(guestName)) guestName = "Guest User";
            Yatrikapp.AdminStore.AddBooking(guestName, litHotelName.Text, txtCheckIn.Text, totalNum > 0 ? totalNum : 8500, "Confirmed");

            // 4. Redirect directly to the Booking Confirmation screen
            Response.Redirect("BookingConfirmation.aspx");
        }
    }
}