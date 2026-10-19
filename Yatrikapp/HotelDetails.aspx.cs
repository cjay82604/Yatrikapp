using System;
using System.Web.UI;

namespace YourWebFormsProject
{
    public partial class HotelDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set default dates
                txtCheckIn.Text = DateTime.Today.ToString("yyyy-MM-dd");
                txtCheckOut.Text = DateTime.Today.AddDays(1).ToString("yyyy-MM-dd");

                // Check hotel ID from query string (defaults to 2: Rann Desert Camp or 1: Haveli by the Lake)
                int hotelId = 2;
                if (int.TryParse(Request.QueryString["id"], out int parsedId))
                {
                    hotelId = parsedId;
                }

                LoadHotelData(hotelId);
                CheckAuthenticationState();
            }
        }

        private void CheckAuthenticationState()
        {
            // Toggle between "Reserve now" and "Sign in to book" based on Session
            if (Session["CurrentUser"] != null)
            {
                phLoggedInAction.Visible = true;
                phAnonymousAction.Visible = false;
            }
            else
            {
                phLoggedInAction.Visible = false;
                phAnonymousAction.Visible = true;
            }
        }

        private void LoadHotelData(int id)
        {
            if (id == 1) // Haveli by the Lake (Screenshot 2)
            {
                litCategory.Text = "Heritage";
                litHotelName.Text = "Haveli by the Lake";
                litLocation.Text = "Udaipur, Rajasthan";
                litRating.Text = "4.9";
                litReviews.Text = "204";
                litPrice.Text = "8,500";

                imgMain.ImageUrl = "https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=1000&q=80";
                imgThumb1.ImageUrl = "https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=300&q=80";
                imgThumb2.ImageUrl = "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=300&q=80";
                imgThumb3.ImageUrl = "https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=300&q=80";

                litDescription.Text = "A stunning lakeside haveli blending royal Rajput architecture with contemporary luxury. Overlooking Lake Pichola with panoramic views of the city palace.";

                litCalcBaseRate.Text = "8,500";
                litCalcSubTotal.Text = "8,500";
                litCalcTax.Text = "1,020";
                litCalcTotal.Text = "9,520";
            }
            else // Rann Desert Camp (Screenshot 1)
            {
                litCategory.Text = "Heritage";
                litHotelName.Text = "Rann Desert Camp";
                litLocation.Text = "Bhuj, Gujarat";
                litRating.Text = "4.9";
                litReviews.Text = "112";
                litPrice.Text = "12,000";

                imgMain.ImageUrl = "https://images.unsplash.com/photo-1509316975850-ff9c5deb0cd9?auto=format&fit=crop&w=1000&q=80";
                imgThumb1.ImageUrl = "https://images.unsplash.com/photo-1509316975850-ff9c5deb0cd9?auto=format&fit=crop&w=300&q=80";
                imgThumb2.ImageUrl = "https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&w=300&q=80";
                imgThumb3.ImageUrl = "https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=300&q=80";

                litDescription.Text = "Luxury tents on the Great Rann of Kutch, the world's largest salt desert. Spend nights under a blanket of stars, attend the vibrant Rann Utsav festival, and explore the ancient crafts of Kutch with guided village tours.";

                litCalcBaseRate.Text = "12,000";
                litCalcSubTotal.Text = "12,000";
                litCalcTax.Text = "1,440";
                litCalcTotal.Text = "13,440";
            }
        }

        // When user is NOT logged in and clicks "Sign in to book"
        protected void btnSignInToBook_Click(object sender, EventArgs e)
        {
            string currentUrl = Request.RawUrl;
            Response.Redirect("Login.aspx?returnUrl=" + Server.UrlEncode(currentUrl));
        }

        // When user IS logged in and clicks "Reserve now"
        protected void btnReserveNow_Click(object sender, EventArgs e)
        {
            int hotelId = 2;
            if (int.TryParse(Request.QueryString["id"], out int parsedId))
            {
                hotelId = parsedId;
            }

            string checkIn = txtCheckIn.Text;
            string checkOut = txtCheckOut.Text;

            // Redirect to Booking page with selected hotel & dates
            Response.Redirect($"Booking.aspx?id={hotelId}&in={Server.UrlEncode(checkIn)}&out={Server.UrlEncode(checkOut)}");
        }
    }
}