using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Yatrikapp
{
    public partial class Hotels : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["q"]))
                {
                    txtDestination.Text = Request.QueryString["q"];
                }
                if (!string.IsNullOrEmpty(Request.QueryString["category"]))
                {
                    ViewState["SelectedCategory"] = Request.QueryString["category"];
                }

                BindHotels();
            }
        }

        private void BindHotels()
        {
            var list = HotelStore.GetHotels().AsEnumerable();

            // Destination Filter
            string q = txtDestination.Text.Trim();
            if (!string.IsNullOrEmpty(q))
            {
                list = list.Where(h => h.Name.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0 ||
                                       h.Location.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0);
            }

            // Category Filter
            string category = ViewState["SelectedCategory"] as string ?? "All";
            if (!string.IsNullOrEmpty(category) && category != "All")
            {
                list = list.Where(h => h.Category.Equals(category, StringComparison.OrdinalIgnoreCase));
            }

            // Sorting
            if (ddlSort.SelectedValue == "PriceLowHigh")
            {
                list = list.OrderBy(h => h.Price);
            }
            else if (ddlSort.SelectedValue == "PriceHighLow")
            {
                list = list.OrderByDescending(h => h.Price);
            }
            else
            {
                list = list.OrderByDescending(h => h.Rating);
            }

            var result = list.ToList();
            litPropertyCount.Text = $"{result.Count} properties found";
            rptHotels.DataSource = result;
            rptHotels.DataBind();
        }

        protected void FilterChanged(object sender, EventArgs e)
        {
            BindHotels();
        }

        protected void CategoryTag_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            ViewState["SelectedCategory"] = btn.CommandArgument;

            catAll.CssClass = "yt-filter-tag" + (btn.CommandArgument == "All" ? " active" : "");
            catHeritage.CssClass = "yt-filter-tag" + (btn.CommandArgument == "Heritage" ? " active" : "");
            catResort.CssClass = "yt-filter-tag" + (btn.CommandArgument == "Resort" ? " active" : "");
            catBeach.CssClass = "yt-filter-tag" + (btn.CommandArgument == "Beach Resort" ? " active" : "");
            catMountain.CssClass = "yt-filter-tag" + (btn.CommandArgument == "Mountain Lodge" ? " active" : "");
            catCity.CssClass = "yt-filter-tag" + (btn.CommandArgument == "City Hotel" ? " active" : "");

            BindHotels();
        }

        protected void rptHotels_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ToggleSave")
            {
                int hotelId = Convert.ToInt32(e.CommandArgument);
                HotelStore.ToggleSaveHotel(hotelId);
                BindHotels();
            }
        }
    }
}