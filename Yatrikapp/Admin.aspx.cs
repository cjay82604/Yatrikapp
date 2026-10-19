using System;
using System.Web.UI;

namespace Yatrikapp
{
    public partial class Admin : Page


    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // If already signed in as admin, go straight to Dashboard
                if (Session["IsAdmin"] != null && (bool)Session["IsAdmin"])
                {
                    Response.Redirect("~/AdminDashboard.aspx");
                    return;
                }

                lblError.Visible = false;
                if (string.IsNullOrEmpty(txtEmail.Text))
                {
                    txtEmail.Text = "admin@yatrik.in";
                }
            }
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            lblError.Visible = false;

            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                lblError.Text = "Please enter your admin email.";
                lblError.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(password) || password.Length < 4)
            {
                lblError.Text = "Password must be at least 4 characters.";
                lblError.Visible = true;
                return;
            }

            // Set Admin session flags
            Session["IsAdmin"] = true;
            Session["AdminEmail"] = email;

            // Redirect to Admin Dashboard
            Response.Redirect("~/AdminDashboard.aspx");
        }
    }
}