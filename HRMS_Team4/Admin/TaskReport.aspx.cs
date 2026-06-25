using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class TaskReport : System.Web.UI.Page
    {
        string cs = ConfigurationManager
                    .ConnectionStrings["Pulse360_FinalDb"]
                    .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCards();
                LoadTaskList();
            }
        }

        private void LoadCards()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd =
                    new SqlCommand("sp_TaskReport_Cards", con))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;

                    con.Open();

                    SqlDataReader dr =
                        cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        // Card Values

                        lblTotalTasks.Text =
                            dr["TotalTasks"].ToString();

                        lblCompletedTasks.Text =
                            dr["CompletedTasks"].ToString();

                        lblPendingTasks.Text =
                            dr["PendingTasks"].ToString();

                        lblInProgressTasks.Text =
                            dr["InProgressTasks"].ToString();

                        lblOnHoldTasks.Text =
                            dr["OnHoldTasks"].ToString();

                        // Chart Values (Raw Counts)

                        hfCompleted.Value =
                            dr["CompletedTasks"].ToString();

                        hfPending.Value =
                            dr["PendingTasks"].ToString();

                        hfInProgress.Value =
                            dr["InProgressTasks"].ToString();

                        hfOnHold.Value =
                            dr["OnHoldTasks"].ToString();
                    }
                }
            }
        }

        private void LoadTaskList()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd =
                    new SqlCommand("sp_TaskReport_List", con))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;

                    SqlDataAdapter da =
                        new SqlDataAdapter(cmd);

                    DataTable dt =
                        new DataTable();

                    da.Fill(dt);

                    gvTaskReport.DataSource = dt;
                    gvTaskReport.DataBind();
                }
            }
        }
    }
}