using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace P_AMACO
{
    public partial class AMACO : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Username"] != null)
            {
                acc1.Text = Session["Username"].ToString() + " Account";
                navbarSignupDropdown.Visible = false;
                lbLogin.Visible = false;
                lbLogout.Visible = true;
            }
            else if(Session["shopname"] != null)
            {
                acc1.Text = Session["shopname"].ToString() + " Account";
                navbarSignupDropdown.Visible = false;
                lbLogin.Visible = false;
                lbLogout.Visible = true;
            }
            else
            {
                acc1.Text = "My Account";
            }
        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Session["shopname"] = null;
            Session.Clear();
            Response.Redirect("index.aspx");
            navbarSignupDropdown.Visible = true;
            lbLogin.Visible = true;
            lbLogout.Visible = false;
        }
    }
}