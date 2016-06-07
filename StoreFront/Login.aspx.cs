using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StoreFront
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            int returnValue = 0; //if found in database, logs-in and set to 1, else not found in database and kept 0 (no login)

            string conString = ConfigurationManager.ConnectionStrings["StoreFrontConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand("spLogin", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", tbUsername.Text);
                cmd.Parameters.AddWithValue("@Password", Encoding.Default.GetBytes(tbPassword.Text));
                conn.Open();
                returnValue = (int)cmd.ExecuteScalar();
                conn.Close();
            }

            if (returnValue > 0) //Successfully found user in database, go ahead with login
            {
                StatusLabel.Text = "Successfully logged in! Redirecting...";
                StatusLabel.ForeColor = System.Drawing.Color.Green;
            }
            else //Didn't find user in database, cannot login
            {
                StatusLabel.Text = "Cannot find user with that username and password combination. Try again or register as new user.";
                StatusLabel.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}