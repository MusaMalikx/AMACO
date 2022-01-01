using System;
using System.Data;
using P_AMACO.DAL;
using System.ComponentModel.DataAnnotations;
namespace P_AMACO
{
    public partial class SignUpCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void clr()
        {
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox5.Text = string.Empty;
            TextBox6.Text = string.Empty;
        }
        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            string name = TextBox2.Text;
            string email = TextBox3.Text;
            string phone = TextBox4.Text;
            string addr = TextBox5.Text;
            string pass = TextBox6.Text;

            bool flag = false;

            if (TextBox2.Text == "")
            {
                P2.InnerText = Convert.ToString("Enter Name!");
                flag = true;
            }
            else
            {
                P2.InnerText = Convert.ToString("");
            }

            if (TextBox3.Text == "")
            {
                P3.InnerText = Convert.ToString("Enter Email!");
                flag = true;
            }
            else if (TextBox3.Text != "")  //checks for valid email
            {
                var EmailCheck = new EmailAddressAttribute();
                if (EmailCheck.IsValid(TextBox3.Text) == false)
                {
                    flag = true;
                    P3.InnerText = Convert.ToString("Invalid Email!");
                }
                else
                    P3.InnerText = Convert.ToString("");
            }

            if (TextBox4.Text == "")
            {
                P4.InnerText = Convert.ToString("Enter Phonenumber!");
                flag = true;
            }
            else
            {
                P4.InnerText = Convert.ToString("");
            }

            if (TextBox5.Text == "")
            {
                P5.InnerText = Convert.ToString("Enter Address!");
                flag = true;
            }
            else
            {
                P5.InnerText = Convert.ToString("");
            }

            if (TextBox6.Text == "")
            {
                P6.InnerText = Convert.ToString("Enter Password!");
                flag = true;
            }
            else
            {
                P6.InnerText = Convert.ToString("");
            }

            if(!flag)
            {

                DataTable DT = new DataTable();

                myDAL objMyDal = new myDAL();

                if (objMyDal.insertinfouser(name, email, pass, addr, phone, ref DT) == 1)
                {
                    //pop up to indicate a new user is inserted in table
                    Response.Write("<script>alert('Customer Account Created Successfully!!')</script>");
                    //Server.Transfer("index.aspx");
                    clr();
                }
            }

        }
    }
}