using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Manager
{
    public partial class LeaveApproval : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(
               ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString);
            con.Open();
            if (!IsPostBack)
            {
                LoadLeaveRequests();
            }
        }

        private void LoadLeaveRequests()
        {
            string query = "sp_LeaveRequests_Select";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvLeaveApproval.DataSource = dt;
            gvLeaveApproval.DataBind();
            Fetch();
        }

        protected void gvLeaveApproval_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int leaveId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Approve")
            {
                UpdateStatus(leaveId, "Approved");
            }
            else if (e.CommandName == "Reject")
            {
                UpdateStatus(leaveId, "Rejected");
            }

            LoadLeaveRequests();
            
        }
       

        private void UpdateStatus(int id, string status)
        {
            string managerName = "Krish"; // static manager

            SqlCommand cmd = new SqlCommand("sp_LeaveRequest_Status", con);

            cmd.Parameters.AddWithValue("@Status", status);
            cmd.Parameters.AddWithValue("@ApprovedBy", managerName);
            cmd.Parameters.AddWithValue("@Id", id);

           

            cmd.ExecuteNonQuery();
           
        }


        public string GetStatusClass(string status)
        {
            switch (status)
            {
                case "Approved":
                    return "badge bg-success";

                case "Rejected":
                    return "badge bg-danger";

                default:
                    return "badge bg-warning";
            }
        }

        public void Fetch()
        {
            if (gvLeaveApproval.Rows.Count > 0)
            {
                gvLeaveApproval.UseAccessibleHeader = true;
                gvLeaveApproval.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}