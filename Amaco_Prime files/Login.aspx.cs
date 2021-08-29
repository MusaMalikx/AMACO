using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace P_AMACO
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void clrtext()
        {
            txtuser.Text = string.Empty;
            txtpass.Text = string.Empty;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string constr = WebConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            try
            {
                if (RdBtnCus.Checked == true)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select * from [Customer] where [Customer Email] = @em and [Password] = @pwd", con);
                    cmd.Parameters.AddWithValue("@em", txtuser.Text);
                    cmd.Parameters.AddWithValue("@pwd", txtpass.Text);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        string sname = dt.Rows[0]["Name"].ToString();
                        int uid = Convert.ToInt32(dt.Rows[0]["CustomerID"].ToString());
                        Session["Username"] = sname;
                        Session["USERID"] = uid;
                        //Response.Write("<script> alert ('Successful in Shopkeeper Login')</script");
                        //Server.Transfer("index.aspx");
                        Response.Redirect("~/Account.aspx");
                        clrtext();
                    }
                    else
                    {
                        //Response.Write("<script> alert ('UnSuccessful in Customer Login')</script");
                        unsuccess_c.Visible = true;
                        unsuccess_s.Visible = false;
                        unsuccess_l.Visible = false;
                        success1.InnerText = "";
                    }
                    con.Close();
                }
                else if (RdBtnShop.Checked == true)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select * from [Shop] where [ShopOwner Email] = @em and Password = @pwd", con);
                    cmd.Parameters.AddWithValue("@em", txtuser.Text);
                    cmd.Parameters.AddWithValue("@pwd", txtpass.Text);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        string sname = dt.Rows[0]["shop name"].ToString();
                        int sid = -1;
                        sid = Convert.ToInt32(dt.Rows[0]["ShopID"].ToString());
                        Session["shopname"] = sname;
                        Session["shopid"] = sid;
                        //Response.Write("<script> alert ('Successful in Shopkeeper Login')</script");
                        //Server.Transfer("index.aspx");
                        Response.Redirect("~/Account.aspx");
                        clrtext();
                    }
                    else
                    {
                        //Response.Write("<script> alert ('UnSuccessful in Shopkeeper Login')</script");
                        unsuccess_s.Visible = true;
                        unsuccess_c.Visible = false;
                        unsuccess_l.Visible = false;
                        success1.InnerText = "";
                    }
                }
                else if (RdBtnShop.Checked == false && RdBtnCus.Checked == false)
                {
                    unsuccess_l.Visible = true;
                    unsuccess_s.Visible = false;
                    unsuccess_c.Visible = false;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}