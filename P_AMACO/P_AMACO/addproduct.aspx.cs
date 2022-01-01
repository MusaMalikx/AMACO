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
    public partial class addproduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected bool checkfields() //validates the textboxes
        {
            bool flag = false;
            if (txtProductName.Text == "")
            {
                l1.Text = "Enter Name!";
                flag = true;
            }
            else
                l1.Text = "";

            if (txtPrice.Text == "")
            {
                l2.Text = "Enter Price!";
                flag = true;
            }
            else
                l2.Text = "";

            if (txtPrice.Text == "")
            {
                l4.Text = "Enter Size/Dimensions";
                flag = true;
            }
            else
                l4.Text = "";

            if (txtcat.Text == "")
            {
                l6.Text = "Enter Quantity!";
                flag = true;
            }
            else
                l6.Text = "";

            if (flag == true)
            {
                l7.Text = "Unsuccesfull!";
                l7.CssClass = "text-danger";
            }

            return flag;
        }

        private void clr()
        {
            txtProductName.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtsize.Text = string.Empty;
            txtcat.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtquantity.Text = string.Empty;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string constr = WebConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            if (Session["shopname"] != null)
            {
                try
                {
                    con.Open();
                    using (con)
                    {
                        if (checkfields() == false)
                        {
                            int sid = Convert.ToInt32(Session["shopid"].ToString());
                            SqlCommand cmd = new SqlCommand("insertproducts", con);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@shopid", sid);
                            cmd.Parameters.AddWithValue("@PName", txtProductName.Text);
                            cmd.Parameters.AddWithValue("@PPrice", txtPrice.Text);
                            cmd.Parameters.AddWithValue("@Pcategory", txtcat.Text);
                            cmd.Parameters.AddWithValue("@Psize", txtsize.Text);
                            cmd.Parameters.AddWithValue("@PDescription", txtDescription.Text);
                            cmd.Parameters.AddWithValue("@Pquantity", txtquantity.Text);
                            if (chavail.Checked == true)
                            {
                                cmd.Parameters.AddWithValue("@Pavailabilty", 1.ToString());
                            }
                            else
                            {
                                if (Convert.ToInt32(txtquantity.Text) > 0)
                                    cmd.Parameters.AddWithValue("@Pavailabilty", 1.ToString());
                                else
                                    cmd.Parameters.AddWithValue("@Pavailabilty", 0.ToString());
                            }
                            Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());

                            if (fuImg01.HasFile)
                            {
                                string SavePath = Server.MapPath("Images/productimages/") + PID;
                                if (!Directory.Exists(SavePath))
                                {
                                    Directory.CreateDirectory(SavePath);

                                }
                                string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                                fuImg01.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "01" + Extention);
                                SqlCommand cmd3 = new SqlCommand("insert into tblProductImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                                cmd3.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                                cmd3.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "01");
                                cmd3.Parameters.AddWithValue("@Extention", Extention);
                                cmd3.ExecuteNonQuery();
                            }
                            if (fuImg02.HasFile)
                            {
                                string SavePath = Server.MapPath("Images/productimages/") + PID;
                                if (!Directory.Exists(SavePath))
                                {
                                    Directory.CreateDirectory(SavePath);

                                }
                                string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                                fuImg02.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "02" + Extention);

                                //SqlCommand cmd4 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "02" + "','" + Extention + "')", con);
                                SqlCommand cmd4 = new SqlCommand("insert into tblProductImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                                cmd4.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                                cmd4.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "02");
                                cmd4.Parameters.AddWithValue("@Extention", Extention);
                                cmd4.ExecuteNonQuery();
                            }
                            //3rd file upload 
                            if (fuImg03.HasFile)
                            {
                                string SavePath = Server.MapPath("Images/productimages/") + PID;
                                if (!Directory.Exists(SavePath))
                                {
                                    Directory.CreateDirectory(SavePath);

                                }
                                string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
                                fuImg03.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "03" + Extention);

                                //SqlCommand cmd5 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "03" + "','" + Extention + "')", con);
                                SqlCommand cmd5 = new SqlCommand("insert into tblProductImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                                cmd5.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                                cmd5.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "03");
                                cmd5.Parameters.AddWithValue("@Extention", Extention);
                                cmd5.ExecuteNonQuery();
                            }

                            l7.Text = "Product Added Succesfully!";
                            l7.CssClass = "text-success";
                            clr();
                        }

                    }
                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            else
            {
                l7.Text = "Unsuccesful , Only Shop owner can Enter Products";
                l7.CssClass = "text-danger";
                clr();
            }

        }
    }
}