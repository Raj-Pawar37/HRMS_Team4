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
    public partial class DailyReport : System.Web.UI.Page
    {
        string cs =
            ConfigurationManager
            .ConnectionStrings["Pulse360_FinalDb"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCards();
                LoadChart();
                LoadAttendanceList();
            }
        }

        private void LoadCards()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "sp_DailyReport_Cards",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                con.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblTotalPresent.Text =
                        dr["TotalPresent"].ToString();

                    lblTotalAbsent.Text =
                        dr["TotalAbsent"].ToString();

                    lblCompletedTasks.Text =
                        dr["CompletedTasks"].ToString();

                    lblPendingTasks.Text =
                        dr["PendingTasks"].ToString();
                }
            }
        }

        private void LoadChart()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand("sp_DailyReport_Chart", con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue(
                    "@Year",
                    DateTime.Now.Year);

                con.Open();

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                // chart binding code here
            }
        }

        private void LoadAttendanceList()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "sp_DailyReport_List",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                gvDailyReport.DataSource = dt;
                gvDailyReport.DataBind();
            }
        }
    }
}