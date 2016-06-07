using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StoreFront
{
    public partial class CustomerAdminDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Opens the connection to the database to read from stored procedure.
        //The dataSource also obtains the parameters from CustomerAdmin @UserID.
        //After reading the procedure, it executes it, and then closes the connection.
        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["StoreFrontConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand("spGetUser", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Request.QueryString["UserID"]);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                conn.Close();
            }
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["StoreFrontConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand("spGetUser", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Request.QueryString["UserID"]);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                conn.Close();
            }
        }

        protected void DetailsView1_ItemDeleted(object sender, EventArgs e)
        {
            GridView1.DataBind();
            GridView1.SelectRow(-1);
            DetailsView1.Visible = false;
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomersAdmin.aspx");
        }
    }
}