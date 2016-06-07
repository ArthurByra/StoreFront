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
    public partial class ProductsAdminDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        //Opens the connection to the database to read from stored procedure.
        //The dataSource also obtains the parameters from ProductsAdmin @ProductID.
        //After reading the procedure, it executes it, and then closes the connection.
        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["StoreFrontConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand("spGetProduct", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductID", Request.QueryString["ProductID"]);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                conn.Close();
            }
        }
        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ProductsAdmin.aspx");
        }

        protected void DetailsView1_ItemDeleted(object sender, EventArgs e)
        {
            DetailsView1.Visible = false;
        }
    }
}