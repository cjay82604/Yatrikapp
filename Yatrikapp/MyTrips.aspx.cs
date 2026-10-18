using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YourWebFormsProject
{
    public partial class MyTrips : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("Login.aspx?returnUrl=MyTrips.aspx");
                return;
            }

            if (!IsPostBack)
            {
                ViewState["SelectedTab"] = "Upcoming";
                BindTrips();
            }
        }

        private void BindTrips()
        {
            // Fetch all user trips from TripStore
            var allTrips = TripStore.GetTrips();

            // Calculate dynamic counts
            int upCount = allTrips.Count(t => t.Status.Equals("Upcoming", StringComparison.OrdinalIgnoreCase));
            int pastCount = allTrips.Count(t => t.Status.Equals("Past", StringComparison.OrdinalIgnoreCase));
            int cancCount = allTrips.Count(t => t.Status.Equals("Cancelled", StringComparison.OrdinalIgnoreCase));

            // Set button text dynamically with exact counts
            tabUpcoming.Text = "Upcoming (" + upCount + ")";
            tabPast.Text = "Past (" + pastCount + ")";
            tabCancelled.Text = "Cancelled (" + cancCount + ")";

            // Active Tab State
            string currentTab = ViewState["SelectedTab"] as string ?? "Upcoming";

            tabUpcoming.CssClass = "yt-tab-pill" + (currentTab == "Upcoming" ? " active" : "");
            tabPast.CssClass = "yt-tab-pill" + (currentTab == "Past" ? " active" : "");
            tabCancelled.CssClass = "yt-tab-pill" + (currentTab == "Cancelled" ? " active" : "");

            // Filter trips by active tab
            var filtered = allTrips.Where(t => t.Status.Equals(currentTab, StringComparison.OrdinalIgnoreCase)).ToList();

            if (filtered.Count > 0)
            {
                rptTrips.Visible = true;
                pnlNoTrips.Visible = false;
                rptTrips.DataSource = filtered;
                rptTrips.DataBind();
            }
            else
            {
                rptTrips.Visible = false;
                pnlNoTrips.Visible = true;
            }
        }

        protected void Tab_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            ViewState["SelectedTab"] = btn.CommandArgument;
            BindTrips();
        }

        public string GetBadgeClass(string status)
        {
            if (status.Equals("Upcoming", StringComparison.OrdinalIgnoreCase))
                return "yt-trip-badge confirmed";

            if (status.Equals("Past", StringComparison.OrdinalIgnoreCase))
                return "yt-trip-badge completed";

            return "yt-trip-badge cancelled";
        }
    }
}