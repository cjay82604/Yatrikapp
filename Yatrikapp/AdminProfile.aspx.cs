using System;
using System.Web.UI;

namespace Yatrikapp
{
    public partial class AdminProfile : Page
    {
        public string AlertPwdClass { get; set; } = "yt-alert-success";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfileData();
            }
        }

        private void LoadProfileData()
        {
            string name = Session["AdminName"] as string ?? "Admin User";
            string email = Session["AdminEmail"] as string ?? "j@gmail.com";
            string phone = Session["AdminPhone"] as string ?? "+91 98000 00001";
            string loc = Session["AdminLocation"] as string ?? "Mumbai, Maharashtra";

            litHeadName.Text = name;
            litFullName.Text = name;
            litEmail.Text = email;
            litPhone.Text = phone;
            litLocation.Text = loc;

            txtFullName.Text = name;
            txtEmail.Text = email;
            txtPhone.Text = phone;
            txtLocation.Text = loc;
        }

        protected void btnEditToggle_Click(object sender, EventArgs e)
        {
            pnlViewMode.Visible = false;
            pnlEditMode.Visible = true;
            btnEditToggle.Visible = false;
            pnlAlertProfile.Visible = false;
        }

        protected void btnCancelProfile_Click(object sender, EventArgs e)
        {
            pnlViewMode.Visible = true;
            pnlEditMode.Visible = false;
            btnEditToggle.Visible = true;
            LoadProfileData();
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            Session["AdminName"] = txtFullName.Text.Trim();
            Session["AdminEmail"] = txtEmail.Text.Trim();
            Session["AdminPhone"] = txtPhone.Text.Trim();
            Session["AdminLocation"] = txtLocation.Text.Trim();

            LoadProfileData();

            pnlViewMode.Visible = true;
            pnlEditMode.Visible = false;
            btnEditToggle.Visible = true;

            litAlertProfile.Text = "Profile details updated successfully!";
            pnlAlertProfile.Visible = true;
        }

        protected void btnUpdatePwd_Click(object sender, EventArgs e)
        {
            string curr = txtCurrPwd.Text.Trim();
            string next = txtNewPwd.Text.Trim();
            string conf = txtConfirmPwd.Text.Trim();

            if (string.IsNullOrEmpty(curr) || string.IsNullOrEmpty(next) || string.IsNullOrEmpty(conf))
            {
                AlertPwdClass = "yt-alert-danger";
                litAlertPwd.Text = "Please fill in all password fields.";
                pnlAlertPwd.Visible = true;
                return;
            }

            if (next != conf)
            {
                AlertPwdClass = "yt-alert-danger";
                litAlertPwd.Text = "New password and Confirm password do not match.";
                pnlAlertPwd.Visible = true;
                return;
            }

            txtCurrPwd.Text = "";
            txtNewPwd.Text = "";
            txtConfirmPwd.Text = "";

            AlertPwdClass = "yt-alert-success";
            litAlertPwd.Text = "Password updated successfully!";
            pnlAlertPwd.Visible = true;
        }
    }
}