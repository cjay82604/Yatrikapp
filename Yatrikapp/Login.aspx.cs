using System;
using System.Web.UI;

namespace YourWebFormsProject
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                // If redirected from Register page
                if (Request.QueryString["registered"] == "true")
                {
                    pnlAlert.Visible = true;
                    litAlertMessage.Text = "<div class='yt-alert yt-alert-success'>Account created successfully! Please enter your password to sign in.</div>";

                    if (!string.IsNullOrEmpty(Request.QueryString["email"]))
                    {
                        txtEmail.Text = Request.QueryString["email"];
                    }
                }
                else
                {
                    pnlAlert.Visible = false;
                }
            }
        }
        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            Page.Validate("LoginGroup");

            if (!Page.IsValid)
            {
                return;
            }

            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            // Validate against the registered users
            UserAccount user = UserStore.Validate(email, password);

            if (user != null)
            {
                // Store user session for Home page and upcoming Saved/My Trips pages
                Session["CurrentUser"] = user;
                Session["UserEmail"] = user.Email;
                Session["UserName"] = user.FullName;

                // Redirect to Home page
                Response.Redirect("Default.aspx");
            }
            else
            {
                pnlAlert.Visible = true;
                litAlertMessage.Text = "<div class='yt-alert yt-alert-danger'>Invalid email or password. Please try again.</div>";
            }
        }
    }
}