using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

namespace P_AMACO
{
    public partial class Payment : System.Web.UI.Page
    {
        private static readonly string connString =
        System.Configuration.ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if(!IsPostBack)
                {
                    BindPriceData();
                    BindOrderProducts();
                }
            }
            else
                Response.Redirect("Login.aspx");
        }

        private void BindPriceData()  //bind cart price data to page
        {
            string UserIDD = Session["USERID"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("SP_BindPriceData", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("UserID", UserIDD);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        string Total = dt.Compute("Sum(SubSAmount)", "").ToString();
                        string CartTotal = dt.Compute("Sum(SubPAmount)", "").ToString();
                        string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                        int Total1 = Convert.ToInt32(dt.Compute("Sum(SubSAmount)", ""));
                        int CartTotal1 = Convert.ToInt32(dt.Compute("Sum(SubPAmount)", ""));
                        spanTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(Total)) + ".00";
                        Session["myCartAmount"] = string.Format("{0:####}", double.Parse(Total));
                        spanCartTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(CartTotal)) + ".00";
                        spanDiscount.InnerText = "- Rs. " + (CartTotal1 - Total1).ToString();
                        Session["TotalAmount"] = spanTotal.InnerText;
                        hdCartAmount.Value = CartTotal.ToString();
                        hdCartDiscount.Value = (CartTotal1 - Total1).ToString() + ".00";
                        hdTotalPayed.Value = Total.ToString();
                    }
                    else
                    {
                        Response.Redirect("Products.aspx");
                    }
                }
            }
        }

        private void BindOrderProducts()  //bind cart data to aspx page
        {
            string UserIDD = Session["USERID"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection con0 = new SqlConnection(connString))
            {
                SqlCommand cmd0 = new SqlCommand("SP_BindCartProducts", con0)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd0.Parameters.AddWithValue("@UID", UserIDD);
                using (SqlDataAdapter sda0 = new SqlDataAdapter(cmd0))
                {
                    sda0.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataColumn PID in dt.Columns)
                        {
                            using (SqlConnection con = new SqlConnection(connString))
                            {
                                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tblCart C WHERE C.PID=" + PID + " AND UID ='" + UserIDD + "'", con))
                                {
                                    cmd.CommandType = CommandType.Text;
                                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                    {
                                        DataTable dtProducts = new DataTable();
                                        sda.Fill(dtProducts);
                                        gvProducts.DataSource = dtProducts;
                                        gvProducts.DataBind();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void btnPaypal_Click(object sender, EventArgs e)
        {
            if(Session["Username"] != null)
            {
                if(checkdetails() == false)
                {
                    Session["Address"] = txtAddress.Text;
                    Session["Mobile"] = txtMobileNumber.Text;
                    //Session["OrderNumber"] = OrderNumber.ToString();
                    Session["PayMethod"] = "paypal";
                    string USERID = Session["USERID"].ToString();
                    string PaymentType = "Paypal";
                    string PaymentStatus = "Paid";
                    string OrderStatus = "Pending";
                    using (SqlConnection con = new SqlConnection(connString))
                    {
                        SqlCommand cmd = new SqlCommand("SP_InsertOrder", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@UserID", USERID);
                        //cmd.Parameters.AddWithValue("@Email", EMAILID);
                        cmd.Parameters.AddWithValue("@CartAmount", hdCartAmount.Value);
                        cmd.Parameters.AddWithValue("@CartDiscount", hdCartDiscount.Value);
                        cmd.Parameters.AddWithValue("@TotalPaid", hdTotalPayed.Value);
                        cmd.Parameters.AddWithValue("@PaymentType", PaymentType);
                        cmd.Parameters.AddWithValue("@PaymentStatus", PaymentStatus);
                        cmd.Parameters.AddWithValue("@DateOfPurchase", DateTime.Now);
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@MobileNumber", txtMobileNumber.Text);
                        cmd.Parameters.AddWithValue("@OrderStatus", OrderStatus);
                        // cmd.Parameters.AddWithValue("@OrderNumber", OrderNumber.ToString());
                        if (con.State == ConnectionState.Closed) { con.Open(); }
                        Int64 OrderID = Convert.ToInt64(cmd.ExecuteScalar());
                        con.Close();
                        InsertOrderProducts(OrderID);
                    }
                }
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }

        protected void btncod_Click(object sender, EventArgs e)  
        {
            if (Session["Username"] != null)
            {
                if(checkdetails() == false)
                {
                    Session["Address"] = txtAddress.Text;
                    Session["Mobile"] = txtMobileNumber.Text;
                    //Session["OrderNumber"] = OrderNumber.ToString();
                    Session["PayMethod"] = "cod";
                    Session["payment"] = Convert.ToDouble(hdTotalPayed.Value);

                    string USERID = Session["USERID"].ToString();
                    string PaymentType = "Cash on delivery";
                    string PaymentStatus = "NotPaid";
                    string OrderStatus = "Pending";
                    using (SqlConnection con = new SqlConnection(connString))
                    {
                        SqlCommand cmd = new SqlCommand("SP_InsertOrder", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@UserID", USERID);
                        //cmd.Parameters.AddWithValue("@Email", EMAILID);
                        cmd.Parameters.AddWithValue("@CartAmount", hdCartAmount.Value);
                        cmd.Parameters.AddWithValue("@CartDiscount", hdCartDiscount.Value);
                        cmd.Parameters.AddWithValue("@TotalPaid", hdTotalPayed.Value);
                        cmd.Parameters.AddWithValue("@PaymentType", PaymentType);
                        cmd.Parameters.AddWithValue("@PaymentStatus", PaymentStatus);
                        cmd.Parameters.AddWithValue("@DateOfPurchase", DateTime.Now.ToString("yyyy-MM-dd"));
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@MobileNumber", txtMobileNumber.Text);
                        cmd.Parameters.AddWithValue("@OrderStatus", OrderStatus);
                        // cmd.Parameters.AddWithValue("@OrderNumber", OrderNumber.ToString());
                        if (con.State == ConnectionState.Closed) { con.Open(); }
                        Int64 OrderID = Convert.ToInt64(cmd.ExecuteScalar());
                        con.Close();
                        InsertOrderProducts(OrderID);
                    }
                }
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }

        private void InsertOrderProducts(Int64 orderid)  //insert all producsts of order in table for shop owners to dispatch those products
        {
            string USERID = Session["USERID"].ToString();
            using (SqlConnection con1 = new SqlConnection(connString))
            {
                foreach (GridViewRow gvr in gvProducts.Rows)
                {
                        updateqty(Convert.ToInt32(gvr.Cells[0].Text), Convert.ToInt32( gvr.Cells[2].Text));
                        SqlCommand myCmd = new SqlCommand("SP_InsertOrderProducts", con1)
                        {
                            CommandType = CommandType.StoredProcedure
                        };
                        myCmd.Parameters.AddWithValue("@OrderID", orderid);
                        myCmd.Parameters.AddWithValue("@UserID", USERID);
                        myCmd.Parameters.AddWithValue("@PID", gvr.Cells[0].Text);
                        myCmd.Parameters.AddWithValue("@Products", gvr.Cells[1].Text);
                        myCmd.Parameters.AddWithValue("@Quantity", gvr.Cells[2].Text);
                        myCmd.Parameters.AddWithValue("@OrderDate", DateTime.Now.ToString("yyyy-MM-dd"));
                        myCmd.Parameters.AddWithValue("@Status", "Pending");
                        if (con1.State == ConnectionState.Closed) { con1.Open(); }
                        Int64 OrderProID = Convert.ToInt64(myCmd.ExecuteScalar());
                        con1.Close();
                }
                EmptyCart();
                if(Session["PayMethod"].ToString() == "cod")
                    Response.Redirect("Success.aspx");
                else
                {
                    double totalamount = Convert.ToDouble(Session["payment"].ToString());
                    Response.Redirect("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&bussiness=sb-ehzaq6602528@business.example.com&amaount=" + totalamount / 150 + "");
                }

            }
        }

        private void updateqty(Int32 pid , Int32 qty) //decrease quantity of the product 
        {
            using(SqlConnection con0 = new SqlConnection(connString))
            {
                SqlCommand cmd0 = new SqlCommand("sp_updateproduct", con0)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd0.Parameters.AddWithValue("@pid", pid);
                cmd0.Parameters.AddWithValue("@quantity", qty);
                if (con0.State == ConnectionState.Closed) { con0.Open(); }
                cmd0.ExecuteNonQuery();
                con0.Close();
            }
        }

        private void EmptyCart()  //empty user cart 
        {
            Int32 CartUIDD = Convert.ToInt32(Session["USERID"].ToString());
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmdU = new SqlCommand("SP_EmptyCart", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmdU.Parameters.AddWithValue("@UserID", CartUIDD);
                if (con.State == ConnectionState.Closed) { con.Open(); }
                cmdU.ExecuteNonQuery();
                con.Close();

            }
        }

        protected bool checkdetails()  //valudates text boxes
        {
            bool flag = false;

            if (txtName.Text == "")
            {
                P1.InnerText = Convert.ToString("Name Required!");
                flag = true;
            }
            else
                P1.InnerText = Convert.ToString("");

            if (txtAddress.Text == "")
            {
                P2.InnerText = Convert.ToString("Address Required!");
                flag = true;
            }
            else
                P2.InnerText = Convert.ToString("");

            if (txtMobileNumber.Text == "")
            {
                P3.InnerText = Convert.ToString("Number Required!");
                flag = true;
            }
            else
                P3.InnerText = Convert.ToString("");
            return flag;
        }


    }
}