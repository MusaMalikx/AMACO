using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

namespace P_AMACO
{
    public partial class cart : System.Web.UI.Page
    {
        private static readonly string connString =
        System.Configuration.ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["Username"] != null)
                {
                    BindCartNumber();
                    BindProductCart();
                }
                else
                    Response.Redirect("Login.aspx");

            }
        }

        private void BindProductCart()  //binds the data of table cart to aspx page
        {
            string UserIDD = Session["USERID"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("SP_BindUserCart", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@UserID", UserIDD);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    RptrCartProducts.DataSource = dt;
                    RptrCartProducts.DataBind();
                    if (dt.Rows.Count > 0)
                    {
                        string Total = dt.Compute("Sum(SubSAmount)", "").ToString();
                        string CartTotal = dt.Compute("Sum(SubPAmount)", "").ToString();
                        string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                        h4NoItems.InnerText = "";
                        int Total1 = Convert.ToInt32(dt.Compute("Sum(SubSAmount)", ""));
                        int CartTotal1 = Convert.ToInt32(dt.Compute("Sum(SubPAmount)", ""));
                        spanTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(Total)) + ".00";
                        spanCartTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(CartTotal)) + ".00";
                        spanDiscount.InnerText = "- Rs. " + (CartTotal1 - Total1).ToString() + ".00";
                    }
                    else
                    {
                        h4NoItems.InnerText = "Your Shopping Cart is Empty.";
                        divAmountSect.Visible = false;

                    }
                }

            }
        }

        protected void RptrCartProducts_ItemCommand(object source, RepeaterCommandEventArgs e)  //removes an item from cart table and page
        {
            Int32 UserID = Convert.ToInt32(Session["USERID"].ToString());
            if (e.CommandName == "RemoveThisCart")
            {
                int CartPID = Convert.ToInt32(e.CommandArgument.ToString().Trim());
                using (SqlConnection con = new SqlConnection(connString))
                {
                    SqlCommand myCmd = new SqlCommand("SP_DeleteThisCartItem", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    myCmd.Parameters.AddWithValue("@CartID", CartPID);
                    con.Open();
                    myCmd.ExecuteNonQuery();
                    con.Close();
                    BindProductCart();
                    BindCartNumber();
                }
            }
        }

        protected void btnCart2_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        public void BindCartNumber()  //display total items in cart
        {
            if (Session["USERID"] != null)
            {
                string UserIDD = Session["USERID"].ToString();
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(connString))
                {
                    SqlCommand cmd = new SqlCommand("SP_BindCartNumberz", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@UserID", UserIDD);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                            CartBadge.InnerText = CartQuantity;

                        }
                        else
                        { 
                            CartBadge.InnerText = "0";
                        }
                    }
                }
            }
        }

        protected void btncheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
    }
}