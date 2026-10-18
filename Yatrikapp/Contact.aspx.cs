using System;
using System.Web.UI;
using YourWebFormsProject;

namespace Yatrikapp
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblError.Visible = false;

                // Pre-fill user information if logged in
                if (Session["CurrentUser"] != null)
                {
                    var user = (UserAccount)Session["CurrentUser"];
                    if (user != null)
                    {
                        txtName.Text = user.FullName ?? "";
                        txtEmail.Text = user.Email ?? "";
                        if (!string.IsNullOrEmpty(user.Mobile))
                        {
                            txtPhone.Text = user.Mobile;
                        }
                    }
                }
            }
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            lblError.Visible = false;

            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            // Validation checks
            if (string.IsNullOrEmpty(name))
            {
                lblError.Text = "Please enter your full name.";
                lblError.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(email))
            {
                lblError.Text = "Please enter your email address.";
                lblError.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(message))
            {
                lblError.Text = "Please enter your message.";
                lblError.Visible = true;
                return;
            }

            // Set confirmation details for Success state (Screenshot 3)
            litSentName.Text = Server.HtmlEncode(name);
            litSentEmail.Text = Server.HtmlEncode(email);

            // Switch to Success panel
            pnlContactForm.Visible = false;
            pnlContactSuccess.Visible = true;
        }

        protected void btnSendAnother_Click(object sender, EventArgs e)
        {
            // Reset message field
            txtMessage.Text = "";
            lblError.Visible = false;

            // If user is guest, clear inputs
            if (Session["CurrentUser"] == null)
            {
                txtName.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                ddlSubject.SelectedIndex = 0;
            }

            // Switch back to Contact Form panel
            pnlContactSuccess.Visible = false;
            pnlContactForm.Visible = true;
        }
    }
}