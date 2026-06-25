using Google.Apis.Auth;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Accounts
{
    public partial class GoogleCallback : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();
            conn = new SqlConnection(cs);
            conn.Open();


            RegisterAsyncTask(new PageAsyncTask(GoogleLoginAsync));
        }
        private async Task GoogleLoginAsync()
        {
            string code = Request.QueryString["code"];

            if (string.IsNullOrEmpty(code))
            {
                Response.Redirect("~/Account/Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            string idToken = await GetGoogleIdToken(code);

            GoogleJsonWebSignature.Payload payload =
                await GoogleJsonWebSignature.ValidateAsync(idToken);

            string email = payload.Email;

            LoginUserByEmail(email);
        }


        private async Task<string> GetGoogleIdToken(string code)
        {
            string clientId = ConfigurationManager.AppSettings["GoogleClientId"];
            string clientSecret = ConfigurationManager.AppSettings["GoogleClientSecret"];
            string redirectUri = ConfigurationManager.AppSettings["GoogleRedirectUri"];

            using (HttpClient client = new HttpClient())
            {
                var data = new FormUrlEncodedContent(new[]
                {
                    new KeyValuePair<string, string>("code", code),
                    new KeyValuePair<string, string>("client_id", clientId),
                    new KeyValuePair<string, string>("client_secret", clientSecret),
                    new KeyValuePair<string, string>("redirect_uri", redirectUri),
                    new KeyValuePair<string, string>("grant_type", "authorization_code")
                });

                var response = await client.PostAsync("https://oauth2.googleapis.com/token", data);
                string result = await response.Content.ReadAsStringAsync();

                JObject json = JObject.Parse(result);

                return json["id_token"].ToString();
            }

        }




        private void LoginUserByEmail(string email)
        {
            int userId = 0;
            int roleId = 0;
            string firstName = "";
            string lastName = "";
            string userEmail = "";


            SqlCommand cmd = new SqlCommand("SP_User_LoginByGoogle", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email", email);


            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                userId = Convert.ToInt32(dr["UserId"]);
                roleId = Convert.ToInt32(dr["RoleId"]);
                firstName = dr["FirstName"].ToString();
                lastName = dr["LastName"].ToString();
                userEmail = dr["Email"].ToString();
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            dr.Close();


            Session["UserId"] = userId.ToString();
            Session["RoleId"] = roleId.ToString();
            Session["UserName"] = firstName + " " + lastName;
            Session["Email"] = userEmail;

            if (roleId == 3)
            {
                Response.Redirect("~/Admin/Dashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }
            else if (roleId == 8)
            {
                Response.Redirect("~/Manager/Dashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }
            else
            {
                Response.Redirect("~/User/Dashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }
        }
    }
}