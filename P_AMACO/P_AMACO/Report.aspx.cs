using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace P_AMACO
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["shopname"] != null)
            {
                string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                string sql = "select PID as [Product ID], shopid as [Shop ID], PName as [Product Name],Pcategory as [Category],Psize as Size, PDescription as [Description], Pavailabilty as Availablity,Pquantity as Quantity from tblProducts where shopid =  " + Session["shopid"];
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ReportView.DataSource = reader;
                ReportView.DataBind();
                conn.Close();
            }
            else
                Response.Redirect("Login.aspx");
        }
    }
}