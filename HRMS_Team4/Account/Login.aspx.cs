using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Accounts
{
    public partial class Login : System.Web.UI.Page
    {

        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();
            conn = new SqlConnection(cs);
            conn.Open();


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand("SP_User_Login", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@PasswordHash", txtPassword.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["UserId"] = dr["UserId"].ToString();
                Session["RoleId"] = dr["RoleId"].ToString();
                Session["UserName"] = dr["FirstName"].ToString() + " " + dr["LastName"].ToString();
                Session["Email"] = dr["Email"].ToString();

                int roleId = Convert.ToInt32(dr["RoleId"]);

                if (roleId == 3) // Admin
                {
                    Response.Redirect("~/Admin/Dashboard.aspx");
                }
                else if (roleId == 8) // Manager
                {
                    Response.Redirect("~/Manager/Dashboard.aspx");
                }
                else
                {
                    Response.Redirect("~/User/Dashboard.aspx");
                }
            }
            else
            {
                lblMessage.Text = "Invalid email or password";
            }
        }

        protected void btnGoogleLogin_Click(object sender, EventArgs e)
        {
            string clientId = ConfigurationManager.AppSettings["GoogleClientId"];
            string redirectUri = ConfigurationManager.AppSettings["GoogleRedirectUri"];

            string url =
                "https://accounts.google.com/o/oauth2/v2/auth" +
                "?client_id=" + clientId +
                "&redirect_uri=" + Server.UrlEncode(redirectUri) +
                "&response_type=code" +
                "&scope=" + Server.UrlEncode("openid email profile");

            Response.Redirect(url);
        }



    }
}