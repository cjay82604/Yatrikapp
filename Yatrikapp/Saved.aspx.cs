using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Yatrikapp
{
    public partial class Saved : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("Login.aspx?returnUrl=Saved.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindWishlist();
            }
        }

        private void BindWishlist()
        {
            // Fetch dynamically from shared HotelStore
            var savedList = HotelStore.GetSavedHotels();

            litSavedCount.Text = $"{savedList.Count} saved";

            if (savedList.Count > 0)
            {
                rptSavedHotels.Visible = true;
                pnlEmpty.Visible = false;
                rptSavedHotels.DataSource = savedList;
                rptSavedHotels.DataBind();
            }
            else
            {
                rptSavedHotels.Visible = false;
                pnlEmpty.Visible = true;
            }
        }

        protected void rptSavedHotels_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Unsave")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                // Toggle off saved state in shared HotelStore
                HotelStore.ToggleSaveHotel(id);
                BindWishlist();
            }
        }
    }
}