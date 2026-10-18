using System;
using System.Web.UI;
using YourWebFormsProject;

namespace Yatrikapp
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 1. Reset all nav links
            lnkHome.CssClass = "yt-nav-item";
            lnkHotels.CssClass = "yt-nav-item";
            lnkReviews.CssClass = "yt-nav-item";
            lnkAbout.CssClass = "yt-nav-item";
            lnkContact.CssClass = "yt-nav-item";
            lnkSaved.CssClass = "yt-nav-saved";
            lnkMyTrips.CssClass = "yt-nav-item";

            // 2. Highlight active tab based on current URL
            string currentUrl = Request.AppRelativeCurrentExecutionFilePath.ToLower();

            if (currentUrl.Contains("hotels.aspx"))
            {
                lnkHotels.CssClass = "yt-nav-item active";
            }
            else if (currentUrl.Contains("reviews.aspx"))
            {
                lnkReviews.CssClass = "yt-nav-item active";
            }
            else if (currentUrl.Contains("about.aspx"))
            {
                lnkAbout.CssClass = "yt-nav-item active";
            }
            else if (currentUrl.Contains("contact.aspx"))
            {
                lnkContact.CssClass = "yt-nav-item active"; // Active Contact nav tab!
            }
            else if (currentUrl.Contains("saved.aspx"))
            {
                lnkSaved.CssClass = "yt-nav-saved active";
            }
            else if (currentUrl.Contains("mytrips.aspx"))
            {
                lnkMyTrips.CssClass = "yt-nav-item active";
            }
            else if (currentUrl.Contains("default.aspx") || currentUrl == "~/")
            {
                lnkHome.CssClass = "yt-nav-item active";
            }// 3. Check if user is logged in
            if (Session["CurrentUser"] != null)
            {
                UserAccount user = (UserAccount)Session["CurrentUser"];

                phAnonymous.Visible = false;
                phLoggedInNav.Visible = true;
                phLoggedInUser.Visible = true;

                litUserName.Text = Server.HtmlEncode(user.FullName);
                litUserEmail.Text = Server.HtmlEncode(user.Email);
                litUserInitials.Text = GetInitials(user.FullName);
            }
            else
            {
                phAnonymous.Visible = true;
                phLoggedInNav.Visible = false;
                phLoggedInUser.Visible = false;
            }
        }

        private string GetInitials(string fullName)
        {
            if (string.IsNullOrWhiteSpace(fullName)) return "U";
            string[] parts = fullName.Trim().Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length >= 2)
            {
                return (parts[0][0].ToString() + parts[parts.Length - 1][0].ToString()).ToUpper();
            }
            return parts[0][0].ToString().ToUpper();
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
}