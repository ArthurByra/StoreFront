using System;
using System.Security;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace StoreFront
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int returnValue = 0; //if spRegister adds a user (aka non-duplicate, returnValue will be 1, else will be 0)

                string conString = ConfigurationManager.ConnectionStrings["StoreFrontConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(conString))
                {
                    SqlCommand cmd = new SqlCommand("spRegister", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserName", tbUsername.Text);
                    //http://stackoverflow.com/questions/21286661/implicit-conversion-from-data-type-nvarchar-to-binary-is-not-allowed-use-the-co
                    cmd.Parameters.AddWithValue("@Password", Encoding.Default.GetBytes(tbPassword.Text));
                    cmd.Parameters.AddWithValue("@EmailAddress", tbEmail.Text);
                    conn.Open();
                    returnValue = (int)cmd.ExecuteScalar();
                    conn.Close();
                }

                if (returnValue > 0) //Adding user was successful
                {
                    StatusLabel.Text = "Registered successfully!";
                    StatusLabel.ForeColor = System.Drawing.Color.Green;
                }
                else //Adding user was not successful
                {
                    StatusLabel.Text = "Username already exists in database!";
                    StatusLabel.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}