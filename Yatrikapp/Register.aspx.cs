using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YourWebFormsProject
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Ensures built-in validators execute cleanly without requiring external jQuery bundle
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                pnlAlert.Visible = false;
            }
        }

        // Server-side validation for Terms checkbox
        protected void cvTerms_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = chkTerms.Checked;
        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            // 1. Run validation
            Page.Validate("RegisterGroup");

            if (!Page.IsValid)
            {
                return;
            }

            // 2. Collect user details
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string password = txtPassword.Text;

            var newUser = new UserAccount
            {
                FullName = fullName,
                Email = email,
                Mobile = mobile,
                Password = password
            };

            // 3. Register user into UserStore
            bool isSuccess = UserStore.Register(newUser);

            if (isSuccess)
            {
                // 4. Redirect straight to Login page with their email pre-filled
                Response.Redirect("Login.aspx?email=" + Server.UrlEncode(email) + "&registered=true");
            }
            else
            {
                // If email already exists
                pnlAlert.Visible = true;
                litAlertMessage.Text = "<div class='yt-alert yt-alert-danger'>An account with this email already exists. Please sign in instead.</div>";
            }
        }

    }
}