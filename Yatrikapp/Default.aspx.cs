using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YourWebFormsProject
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string query = txtSearch.Text.Trim();
            if (!string.IsNullOrEmpty(query))
            {
                Response.Redirect("Hotels.aspx?q=" + Server.UrlEncode(query));
            }
        }

        protected void FilterCategory_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string category = btn.CommandArgument;
            Response.Redirect("Hotels.aspx?category=" + Server.UrlEncode(category));
        }
    }
}