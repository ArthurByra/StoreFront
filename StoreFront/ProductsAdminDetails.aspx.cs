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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);

                if (fileExtension.ToLower() != ".jpg" && fileExtension.ToLower() != ".bmp"
                  && fileExtension.ToLower() != ".gif" && fileExtension.ToLower() != ".png" 
                  && fileExtension.ToLower() != ".jpeg")
                {
                    lblMessage.Text = "Only .jpg, .bmp, .gif, or .png files are accepted.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    int fileSize = FileUpload1.PostedFile.ContentLength;
                    if (fileSize > 2097152)
                    {
                        lblMessage.Text = "Maximum file size of 2MB exceeded.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Images/" + FileUpload1.FileName));
                        lblMessage.Text = "File successfully uploaded";
                        lblMessage.ForeColor = System.Drawing.Color.Green;

                        string conString = ConfigurationManager.ConnectionStrings["StoreFrontConnectionString"].ConnectionString;

                        using (SqlConnection conn = new SqlConnection(conString))
                        {
                            SqlCommand cmd = new SqlCommand();
                            cmd.CommandText = "UPDATE Product SET ImageFile = @fileName WHERE ProductID = @prodID";
                            cmd.CommandType = CommandType.Text;
                            cmd.Parameters.AddWithValue("fileName", FileUpload1.FileName);
                            cmd.Parameters.AddWithValue("prodID", Request.QueryString["ProductID"]);
                            cmd.Connection = conn;
                            conn.Open();
                            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                            DetailsView1.DataBind();
                        }
                    }
                }
            }
            else
            {
                lblMessage.Text = "Please select a file to upload";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}