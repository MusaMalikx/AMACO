using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace P_AMACO
{
    public partial class TrackOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            string sql = "select OrderID, CartAmount, TotalPaid, PaymentStatus,PaymentType, DateOfPurchase, OrderStatus from tblOrders where UserID = " + Session["USERID"];
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            trackOrder.DataSource = reader;
            trackOrder.DataBind();
            conn.Close();
        }
    }
}