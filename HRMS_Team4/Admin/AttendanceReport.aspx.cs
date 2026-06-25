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
    public partial class AttendanceReport : System.Web.UI.Page
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
                        "sp_AttendanceReport_Cards",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                con.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblTotalWorkingDays.Text =
                        dr["TotalWorkingDays"].ToString();

                    lblTotalLeaveTaken.Text =
                        dr["TotalLeaveTaken"].ToString();

                    lblTotalHolidays.Text =
                        dr["TotalHolidays"].ToString();

                    lblTotalHalfDays.Text =
                        dr["TotalHalfDays"].ToString();
                }
            }
        }

        private void LoadChart()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "sp_AttendanceReport_Chart",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue(
                    "@Year",
                    2025);

                con.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                int totalPresent = 0;
                int totalAbsent = 0;

                while (dr.Read())
                {
                    totalPresent +=
                        Convert.ToInt32(
                        dr["PresentCount"]);

                    totalAbsent +=
                        Convert.ToInt32(
                        dr["AbsentCount"]);
                }

                hfPresentCount.Value =
                    totalPresent.ToString();

                hfAbsentCount.Value =
                    totalAbsent.ToString();
            }
        }

        private void LoadAttendanceList()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "sp_AttendanceReport_List",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                gvAttendanceReport.DataSource = dt;
                gvAttendanceReport.DataBind();
            }
        }
    }
}