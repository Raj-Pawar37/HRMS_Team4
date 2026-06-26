using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.User
{
    public partial class Leave : System.Web.UI.Page
    {
        int SessionUserId;
        string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            SessionUserId = Convert.ToInt32(Session["UserId"]);

            if (!IsPostBack)
            {
                BindLeaveRequests();
            }
        }

        private void BindLeaveRequests()
        {


            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_LeaveRequests_ByUser_Select", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserId", SessionUserId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvLeaveRequests.DataSource = dt;
                gvLeaveRequests.DataBind();

                if (gvLeaveRequests.Rows.Count > 0)
                {
                    gvLeaveRequests.UseAccessibleHeader = true;
                    gvLeaveRequests.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }

        public string GetStatusClass(string status)
        {
            if (status == "Approved")
                return "badge bg-success";

            if (status == "Rejected")
                return "badge bg-danger";

            return "badge bg-warning";
        }
    }
}