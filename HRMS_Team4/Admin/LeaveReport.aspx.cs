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
    public partial class LeaveReport : System.Web.UI.Page
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
                LoadLeaveList();
            }
        }

        private void LoadCards()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "sp_LeaveReport_Cards",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                con.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblTotalLeaves.Text =
                        dr["TotalLeaves"].ToString();

                    lblApprovedLeaves.Text =
                        dr["ApprovedLeaves"].ToString();

                    lblPendingRequests.Text =
                        dr["PendingRequests"].ToString();

                    lblRejectedLeaves.Text =
                        dr["RejectedLeaves"].ToString();
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
                        "sp_LeaveReport_Chart",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue(
                    "@Year",
                    2025);

                con.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                int annual = 0;
                int casual = 0;
                int medical = 0;
                int others = 0;

                while (dr.Read())
                {
                    annual +=
                        Convert.ToInt32(
                        dr["Annual"]);

                    casual +=
                        Convert.ToInt32(
                        dr["Casual"]);

                    medical +=
                        Convert.ToInt32(
                        dr["Medical"]);

                    others +=
                        Convert.ToInt32(
                        dr["Others"]);
                }

                hfAnnual.Value =
                    annual.ToString();

                hfCasual.Value =
                    casual.ToString();

                hfMedical.Value =
                    medical.ToString();

                hfOthers.Value =
                    others.ToString();
            }
        }

        private void LoadLeaveList()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "sp_LeaveReport_List",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                gvLeaveReport.DataSource = dt;
                gvLeaveReport.DataBind();
            }
        }
    }
}