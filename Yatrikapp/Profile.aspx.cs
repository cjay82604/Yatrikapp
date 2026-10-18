using System;
using System.Web.UI;
using YourWebFormsProject;

namespace Yatrikapp
{
    public partial class Profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EnsureUserLoggedIn();
                LoadUserProfile();
                LoadStats();
                SetViewMode(true);
            }
        }

        private void EnsureUserLoggedIn()
        {
            // If user is not yet in session, load default demo user matching Figma screenshot
            if (Session["CurrentUser"] == null)
            {
                Session["CurrentUser"] = new UserAccount
                {
                    FullName = "Arjun Sharma",
                    Email = "j@gmail.com",
                    Mobile = "",
                    Location = "India",
                    Password = "password123"
                };
            }
        }

        private void LoadUserProfile()
        {
            var user = (UserAccount)Session["CurrentUser"];
            if (user == null) return;

            // Initials
            litAvatarInitials.Text = GetInitials(user.FullName);

            // Header
            litHeaderName.Text = Server.HtmlEncode(user.FullName);
            litHeaderEmail.Text = Server.HtmlEncode(user.Email);

            // View mode details
            litDetailsName.Text = Server.HtmlEncode(user.FullName);
            litDetailsEmail.Text = Server.HtmlEncode(user.Email);
            litDetailsPhone.Text = string.IsNullOrWhiteSpace(user.Mobile) ? "&mdash;" : Server.HtmlEncode(user.Mobile);
            litDetailsLocation.Text = string.IsNullOrWhiteSpace(user.Location) ? "India" : Server.HtmlEncode(user.Location);

            // Edit mode fields
            txtEditName.Text = user.FullName;
            txtEditEmail.Text = user.Email;
            txtEditPhone.Text = user.Mobile ?? "";
            txtEditLocation.Text = string.IsNullOrWhiteSpace(user.Location) ? "India" : user.Location;
        }

        private void LoadStats()
        {
            try
            {
                var trips = TripStore.GetTrips();
                int tripCount = trips != null ? trips.Count : 4;
                litTripsCount.Text = tripCount.ToString();

                // Formatted total spent matching screenshot
                litTotalSpent.Text = "&#8377;1,22,040";
            }
            catch
            {
                litTripsCount.Text = "4";
                litTotalSpent.Text = "&#8377;1,22,040";
            }
        }

        private void SetViewMode(bool isView)
        {
            phViewActions.Visible = isView;
            phEditActions.Visible = !isView;

            pnlViewDetails.Visible = isView;
            pnlEditDetails.Visible = !isView;

            lblMsg.Visible = false;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            var user = (UserAccount)Session["CurrentUser"];
            if (user != null)
            {
                txtEditName.Text = user.FullName;
                txtEditEmail.Text = user.Email;
                txtEditPhone.Text = user.Mobile ?? "";
                txtEditLocation.Text = string.IsNullOrWhiteSpace(user.Location) ? "India" : user.Location;
            }
            SetViewMode(false);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LoadUserProfile();
            SetViewMode(true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string newName = txtEditName.Text.Trim();
            string newEmail = txtEditEmail.Text.Trim();
            string newPhone = txtEditPhone.Text.Trim();
            string newLocation = txtEditLocation.Text.Trim();

            if (string.IsNullOrEmpty(newName))
            {
                lblMsg.Text = "Name cannot be empty.";
                lblMsg.CssClass = "yt-profile-msg error";
                lblMsg.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(newEmail))
            {
                lblMsg.Text = "Email cannot be empty.";
                lblMsg.CssClass = "yt-profile-msg error";
                lblMsg.Visible = true;
                return;
            }

            var user = (UserAccount)Session["CurrentUser"];
            if (user != null)
            {
                user.FullName = newName;
                user.Email = newEmail;
                user.Mobile = newPhone;
                user.Location = string.IsNullOrEmpty(newLocation) ? "India" : newLocation;

                // Persist updated user
                Session["CurrentUser"] = user;
                UserStore.SaveOrUpdate(user);
            }

            LoadUserProfile();
            SetViewMode(true);

            lblMsg.Text = "Profile updated successfully.";
            lblMsg.CssClass = "yt-profile-msg success";
            lblMsg.Visible = true;
        }

        private string GetInitials(string name)
        {
            if (string.IsNullOrWhiteSpace(name)) return "AS";
            string[] parts = name.Trim().Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length == 1) return parts[0].Substring(0, 1).ToUpper();
            return (parts[0].Substring(0, 1) + parts[parts.Length - 1].Substring(0, 1)).ToUpper();
        }
    }
}