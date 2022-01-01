using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace P_AMACO
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                usercheck.Text = "Login successful, Welcome " + Session["Username"].ToString();
                usercheck.CssClass = "text-success";
                success_s.Visible = false;
                success_c.Visible = true;
                btntrackorder.Visible = true;
                btnaddproduct.Visible = false;
                btnproducts_view.Visible = false;
            }
            else if (Session["shopname"] != null)
            {
                usercheck.Text = "Login successful, Welcome " + Session["shopname"].ToString();
                usercheck.CssClass = "text-success";
                success_s.Visible = true;
                success_c.Visible = false;
                btnaddproduct.Visible = true;
                btnproducts_view.Visible = true;
                btntrackorder.Visible = false;
            }
            else
            {
                usercheck.Text = "No User Found! , Login Again";
                usercheck.CssClass = "text-danger";
                success_s.Visible = false;
                success_c.Visible = false;
                btnaddproduct.Visible = false;
                btnproducts_view.Visible = false;
                btntrackorder.Visible = false;
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)  //logout btn
        {
            Session["Username"] = null;
            Session["shopname"] = null;
            Session.Clear();
            Response.Redirect("index.aspx");
        }

        protected void btnaddproduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/addproduct.aspx");
        }
    }
}