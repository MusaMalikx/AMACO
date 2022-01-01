using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using AjaxControlToolkit;
namespace P_AMACO
{
    public partial class ProductView : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        private static readonly string connString =
        System.Configuration.ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        readonly Int32 myQty = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["PID"] != null)
            {
                if (!IsPostBack)
                {
                    divSuccess.Visible = false;
                    diverror.Visible = false;
                    BindProductImage();
                    BindProductDetails();

                    //DataTable dt = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM tblrating");
                    //Rating1.CurrentRating = Convert.ToInt32(dt.Rows[0]["AverageRating"]);
                    //lbresult.Text = string.Format("{0} Users have rated. Average Rating {1}", dt.Rows[0]["RatingCount"], dt.Rows[0]["AverageRating"]);

                }

            }
            else
                Response.Redirect("~/Products.aspx");

        }
        //private DataTable GetData(string query)
        //{
        //    SqlConnection con = new SqlConnection(connString);
        //    SqlCommand cmd = new SqlCommand(query);
        //    SqlDataAdapter sda = new SqlDataAdapter();
        //    cmd.CommandType = CommandType.Text;
        //    cmd.Connection = con;
        //    sda.SelectCommand = cmd;
        //    sda.Fill(dt);
        //    return dt;
        //}
        private void BindProductDetails()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            using (SqlConnection con = new SqlConnection(connString ))
            {
                SqlCommand cmd = new SqlCommand("select * from tblProducts where PID = '"+ PID + "' ", con)
                {
                    CommandType = CommandType.Text
                }; 
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrProductDetails.DataSource = dt;
                    rptrProductDetails.DataBind();
                    Session["CartPID"] = Convert.ToInt32(dt.Rows[0]["PID"].ToString());
                    Session["myPName"] = dt.Rows[0]["PName"].ToString();
                    Session["myPPrice"] = dt.Rows[0]["PPrice"].ToString();
                    Session["Pquantity"] = dt.Rows[0]["Pquantity"].ToString();
                    //Session["myPSelPrice"] = dt.Rows[0]["PSelPrice"].ToString();
                }

            }
        }

        private void BindProductImage()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblProductImages where PID='" + PID + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrImage.DataSource = dt;
                        rptrImage.DataBind();
                    }
                }
            }
        }
        protected string GetActiveImgClass(int ItemIndex)
        {
            if (ItemIndex == 0)
            {
                return "active";
            }
            else
            {
                return "";

            }
        }

        protected void btnAddtoCart_Click(object sender, EventArgs e)
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            AddToCartProduction();
            // Response.Redirect("ProductView.aspx?PID=" + PID);

            // Response.Redirect("ProductView.aspx?PID=" + PID);
            //SqlConnection con = new SqlConnection(connString);
            //SqlCommand cmd = new SqlCommand("insert into tblrating values (@ratingvalue,@review)");
            //SqlDataAdapter sda = new SqlDataAdapter();
            //cmd.CommandType = CommandType.Text;
            ////cmd.Parameters.AddWithValue("@ratingvalue", Rating1.CurrentRating.ToString());
            //cmd.Connection = con;
            //con.Open();
            //cmd.ExecuteNonQuery();
            //con.Close();
        }

        private void AddToCartProduction()
        {
            if(Session["Username"] != null)
            {
                Int32 UserID = Convert.ToInt32(Session["USERID"].ToString());
                Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
                Int32 pquantity = Convert.ToInt32(Session["Pquantity"].ToString());
                if (pquantity > 0)
                {
                    using (SqlConnection con = new SqlConnection(connString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SP_IsProductExistInCart", con)
                        {
                            CommandType = CommandType.StoredProcedure
                        };
                        cmd.Parameters.AddWithValue("@UserID", UserID);
                        cmd.Parameters.AddWithValue("@PID", PID);

                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                Int32 updateQty = Convert.ToInt32(dt.Rows[0]["Qty"].ToString());
                                SqlCommand myCmd = new SqlCommand("SP_UpdateCart", con)
                                {
                                    CommandType = CommandType.StoredProcedure
                                };
                                myCmd.Parameters.AddWithValue("@Quantity", updateQty + 1);
                                myCmd.Parameters.AddWithValue("@CartPID", PID);
                                myCmd.Parameters.AddWithValue("@UserID", UserID);
                                Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                                con.Close();
                                divSuccess.Visible = true;
                            }
                            else
                            {
                                SqlCommand myCmd = new SqlCommand("SP_InsertCart", con)
                                {
                                    CommandType = CommandType.StoredProcedure
                                };
                                myCmd.Parameters.AddWithValue("@UID", UserID);
                                myCmd.Parameters.AddWithValue("@PID", Session["CartPID"].ToString());
                                myCmd.Parameters.AddWithValue("@PName", Session["myPName"].ToString());
                                myCmd.Parameters.AddWithValue("@PPrice", Session["myPPrice"].ToString());
                                myCmd.Parameters.AddWithValue("@PSelPrice", Session["myPPrice"].ToString());
                                myCmd.Parameters.AddWithValue("@Qty", myQty);
                                Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                                con.Close();
                                divSuccess.Visible = true;
                            }
                        }
                    }
                }
                else
                    diverror.Visible = true;
            }
            else
            { 
                Response.Redirect("Login.aspx");
            }
        }

        protected void Rating1_Click(object sender, RatingEventArgs e)
        {
            if (Session["USERID"] != null)
            {
                Int32 RankingGiven = Int32.Parse(e.Value.ToString());
                Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
                Int32 UserID = Convert.ToInt32(Session["USERID"].ToString());
                if (RankingGiven > 0)
                {
                    using (SqlConnection con = new SqlConnection(connString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("AddingRating", con)
                        {
                            CommandType = CommandType.StoredProcedure
                        };
                        cmd.Parameters.AddWithValue("@CID", UserID);
                        cmd.Parameters.AddWithValue("@PID", PID);
                        cmd.Parameters.AddWithValue("@Rate", RankingGiven);
                        Int64 CartID = Convert.ToInt64(cmd.ExecuteScalar());
                        con.Close();
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

    }
}