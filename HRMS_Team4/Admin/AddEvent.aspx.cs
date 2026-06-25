using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class AddEvent : Page
    {
        private static string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEventTypes();
                LoadEvents();
            }
        }

       
        private void LoadEventTypes()
        {
            var list = new List<object>();

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SP_EventTypes_ReadAll", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                foreach (DataRow row in dt.Rows)
                    list.Add(new
                    {
                        Id = row["Id"].ToString(),
                        Name = row["Name"].ToString()
                    });
            }

            hfEventTypes.Value = new JavaScriptSerializer().Serialize(list);
        }

      
        private void LoadEvents()
        {
            var list = new List<object>();

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SP_Events_ReadAll", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                foreach (DataRow row in dt.Rows)
                    list.Add(new
                    {
                        Title = row["Title"].ToString(),
                        Date = Convert.ToDateTime(row["Date"]).ToString("yyyy-MM-dd"),
                        Description = "",   // no description column in your SP, leave blank
                        Color = "#2eacb3"
                    });
            }

            hfEvents.Value = new JavaScriptSerializer().Serialize(list);
        }

        
        [WebMethod]
        [ScriptMethod]
        public static string SaveEvent(string title, string date, string eventTypeId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("SP_Events_Create", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Date", Convert.ToDateTime(date));
                    cmd.Parameters.AddWithValue("@EventTypeId", Convert.ToInt32(eventTypeId));
                    cmd.Parameters.AddWithValue("@Status", "Active");

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                return "OK";
            }
            catch (Exception ex)
            {
                return "ERROR: " + ex.Message;
            }
        }
    }
}