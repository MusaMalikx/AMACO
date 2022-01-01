using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace P_AMACO.DAL
{
    public class myDAL
    {

        private static readonly string connString =
       System.Configuration.ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        //inserts info into user table
        public int insertinfouser(string name, string email, string pass, string addr, string phone, ref DataTable DT)
        {
            int done = 0;
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand(@"INSERT INTO [dbo].[Customer]
           ([Customer Email]
           ,[Password]
           ,[Name]
           ,[Phone Number]
           ,[Address])
     VALUES
           ('" + email + "' , '" + pass + "' , '" + name + "' , '" + phone + "', '" + addr + "' )", con);

     //           cmd = new SqlCommand(@"INSERT INTO [dbo].[User]
     //      ([Name]
     //      ,[Email Address]
     //      ,[Phone Number]
     //      ,[Address]
     //      ,[Password])
     //VALUES
     //      ( '" + name + "' , '" + email + "' , '" + phone + "' , '" + addr + "' , '" + pass + "')", con);   //sql querey to insert details of user

                if (cmd.ExecuteNonQuery() > 0)
                    done = 1;
                con.Close();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
            if (done == 1)   //to indicate info was inserted successfully
                return 1;
            else
                return 0;
        }

        public int insertinfoshop(string ownername, string email, string pass, string addr, string phone,string cnic , string shopname , ref DataTable DT)
        {
            int done = 0;
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand(@"INSERT INTO [dbo].[Shop]
           ([ShopOwner Email]
           ,[Password]
           ,[Owner Name]
           ,[Phone Number]
           ,[Address]
           ,[shop name]
           ,[cnic])
     VALUES
           ('" + email + "' , '" + pass + "' , '" + ownername + "' , '" + phone + "', '" + addr + "' , '"+shopname+"' , '"+cnic+"')", con);

                if (cmd.ExecuteNonQuery() > 0)
                    done = 1;
                con.Close();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
            if (done == 1)   //to indicate info was inserted successfully
                return 1;
            else
                return 0;
        }

    }
}