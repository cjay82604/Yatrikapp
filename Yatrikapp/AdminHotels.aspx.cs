using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Yatrikapp
{
    public partial class AdminHotels : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindHotels();
            }
        }

        private void BindHotels()
        {
            var hotels = HotelStore.GetHotels();
            litCount.Text = $"{hotels.Count} properties";
            rptHotels.DataSource = hotels;
            rptHotels.DataBind();
        }

        protected void btnToggleAdd_Click(object sender, EventArgs e)
        {
            pnlAddHotelForm.Visible = true;
            litFormTitle.Text = "Add Hotel";
            hfEditId.Value = "";
            ClearForm();
        }

        protected void btnSaveHotel_Click(object sender, EventArgs e)
        {
            string name = txtHotelName.Text.Trim();
            string city = txtCity.Text.Trim();
            string state = txtState.Text.Trim();
            string category = ddlCategory.SelectedValue;
            bool available = chkAvailable.Checked;

            decimal price = 8500;
            string cleanPrice = txtPrice.Text.Replace("₹", "").Replace(",", "").Trim();
            decimal.TryParse(cleanPrice, out price);

            if (string.IsNullOrEmpty(name))
            {
                return;
            }

            if (!string.IsNullOrEmpty(hfEditId.Value) && int.TryParse(hfEditId.Value, out int editId))
            {
                HotelStore.UpdateHotel(editId, name, category, city, state, price, available);
            }
            else
            {
                HotelStore.AddHotel(name, category, city, state, price, available);
            }

            ClearForm();
            BindHotels();
        }

        protected void btnCancelHotel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            hfEditId.Value = "";
            txtHotelName.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtPrice.Text = "";
            ddlCategory.SelectedIndex = 0;
            chkAvailable.Checked = true;
            litFormTitle.Text = "Add Hotel";
        }

        protected void rptHotels_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int hotelId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "DeleteHotel")
            {
                HotelStore.DeleteHotel(hotelId);
                BindHotels();
            }
            else if (e.CommandName == "EditHotel")
            {
                var hotel = HotelStore.GetHotels().FirstOrDefault(h => h.Id == hotelId);
                if (hotel != null)
                {
                    pnlAddHotelForm.Visible = true;
                    litFormTitle.Text = "Edit Hotel";
                    hfEditId.Value = hotel.Id.ToString();
                    txtHotelName.Text = hotel.Name;

                    if (!string.IsNullOrEmpty(hotel.Location))
                    {
                        var parts = hotel.Location.Split(',');
                        txtCity.Text = parts.Length > 0 ? parts[0].Trim() : "";
                        txtState.Text = parts.Length > 1 ? parts[1].Trim() : "";
                    }

                    txtPrice.Text = hotel.Price.ToString("0");
                    if (ddlCategory.Items.FindByValue(hotel.Category) != null)
                    {
                        ddlCategory.SelectedValue = hotel.Category;
                    }
                    chkAvailable.Checked = !hotel.IsFullyBooked;
                }
            }
        }
    }
}