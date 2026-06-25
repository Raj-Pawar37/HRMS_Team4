using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Security.AccessControl;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.User
{
    public partial class Attendance : System.Web.UI.Page
    {
        SqlConnection conn;

        //int SessionUserId = int.Parse(Session["UserId"])
        int SessionUserId = 88;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                Attendance_LeftCard();
                Attendance_ReadAll();
                Attendance_Summary();
                Attendance_TodayProgress();
            }
        }


        public void Attendance_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_Attendance_ReadByUserId", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", SessionUserId);

            cmd.Parameters.AddWithValue("@StartDate",
                string.IsNullOrEmpty(txtStartDate.Text) ? (object)DBNull.Value : txtStartDate.Text);

            cmd.Parameters.AddWithValue("@EndDate",
                string.IsNullOrEmpty(txtEndDate.Text) ? (object)DBNull.Value : txtEndDate.Text);

            cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);

            cmd.Parameters.AddWithValue("@Filter",
                ddlFilter.SelectedValue == "All" ? (object)DBNull.Value : ddlFilter.SelectedValue);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptAttendance.DataSource = dt;
            rptAttendance.DataBind();
        }

        protected void Filter_Changed(object sender, EventArgs e)
        {
            Attendance_ReadAll();
            upAttendance.Update();
        }

        public string GetStatusBadge(string status)
        {
            if (status == "Present")
                return "badge badge-success d-inline-flex align-items-center badge-xs";

            if (status == "Half Day")
                return "badge badge-warning d-inline-flex align-items-center badge-xs";

            return "badge badge-danger d-inline-flex align-items-center badge-xs";
        }







        //Attendance Right Side Card


        public void Attendance_Summary()
        {
            SqlCommand cmd = new SqlCommand("SP_Attendance_Summary_ByUserId", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", SessionUserId);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblTotalHoursToday.Text = FormatHours(dr["TotalHoursToday"]);
                lblTotalHoursWeek.Text = FormatHours(dr["TotalHoursWeek"]);
                lblTotalHoursMonth.Text = FormatHours(dr["TotalHoursMonth"]);
                lblOvertimeThisMonth.Text = FormatHours(dr["OvertimeThisMonth"]);

                lblTodayWorkingHours.Text = FormatHours(dr["TodayWorkingHours"]);
                lblTodayProductionHours.Text = FormatHours(dr["TodayProductionHours"]);
                lblTodayBreakHours.Text = FormatHours(dr["TodayBreakHours"]);
                lblTodayOvertimeHours.Text = FormatHours(dr["TodayOvertimeHours"]);
            }

            dr.Close();
        }


        public string FormatHours(object value)
        {
            decimal hours = Convert.ToDecimal(value);

            int h = (int)Math.Floor(hours);
            int m = (int)((hours - h) * 60);

            return h + "h " + m + "m";
        }



        //Right Side Below chart 


        public void Attendance_TodayProgress()
        {
            SqlCommand cmd = new SqlCommand("SP_Attendance_TodayProgress_ByUserId", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", SessionUserId);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {

                if (dr["CheckIn"] == DBNull.Value || dr["CheckOut"] == DBNull.Value ||
                    dr["LunchIn"] == DBNull.Value || dr["LunchOut"] == DBNull.Value)
                {
                    ltTodayProgress.Text = "";
                    dr.Close();
                    return;
                }

                DateTime checkIn = DateTime.Today.Add(Convert.ToDateTime(dr["CheckIn"]).TimeOfDay);
                DateTime lunchIn = DateTime.Today.Add(Convert.ToDateTime(dr["LunchIn"]).TimeOfDay);
                DateTime lunchOut = DateTime.Today.Add(Convert.ToDateTime(dr["LunchOut"]).TimeOfDay);
                DateTime checkOut = DateTime.Today.Add(Convert.ToDateTime(dr["CheckOut"]).TimeOfDay);

                DateTime chartStart = DateTime.Today.AddHours(6);   // 06:00 AM
                DateTime officeEnd = DateTime.Today.AddHours(17);   // 05:00 PM
                DateTime chartEnd = DateTime.Today.AddHours(23);    // 11:00 PM

                string html = "";

                html += ProgressSegment(chartStart, checkIn, chartStart, chartEnd, "bg-white");
                html += ProgressSegment(checkIn, lunchIn, chartStart, chartEnd, "bg-success");
                html += ProgressSegment(lunchIn, lunchOut, chartStart, chartEnd, "bg-warning");
                html += ProgressSegment(lunchOut, officeEnd, chartStart, chartEnd, "bg-success");

                if (checkOut > officeEnd)
                {
                    html += ProgressSegment(officeEnd, checkOut, chartStart, chartEnd, "bg-danger");
                    html += ProgressSegment(checkOut, chartEnd, chartStart, chartEnd, "bg-white");
                }
                else
                {
                    html += ProgressSegment(officeEnd, chartEnd, chartStart, chartEnd, "bg-white");
                }

                ltTodayProgress.Text = html;
            }
            else
            {
                ltTodayProgress.Text = "";
            }

            dr.Close();
        }


        public string ProgressSegment(DateTime from, DateTime to, DateTime chartStart, DateTime chartEnd, string cssClass)
        {
            if (to <= from)
                return "";

            double totalMinutes = (chartEnd - chartStart).TotalMinutes;
            double segmentMinutes = (to - from).TotalMinutes;
            double width = (segmentMinutes / totalMinutes) * 100;

            string widthText = width.ToString("0.00", CultureInfo.InvariantCulture);

            string title = from.ToString("hh:mm tt") + " - " + to.ToString("hh:mm tt");

            return $@"
                <div class='progress-bar {cssClass}' 
                     role='progressbar'
                     title='{title}'
                     data-bs-toggle='tooltip'
                     style='width:{widthText}%; margin-right:4px;'>
                </div>";
        }





        //Check IN OUT 

        protected void btnAttendance_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SP_Attendance_Mark_CheckIn_CheckOut", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", SessionUserId);

            SqlParameter msg = new SqlParameter("@Message", SqlDbType.VarChar, 100);
            msg.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(msg);

            cmd.ExecuteNonQuery();

            Attendance_LeftCard();
            Attendance_ReadAll();
            Attendance_Summary();
            Attendance_TodayProgress();


            ScriptManager.RegisterStartupScript(this, GetType(), "msg",
                $"alert('{msg.Value.ToString()}');", true);
        }



        public void Attendance_LeftCard()
        {

            SqlCommand cmd = new SqlCommand("SP_Attendance_LeftCard_ByUserId", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", SessionUserId);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Conditions(dr);
                lblLeftProduction.Text = FormatHours(dr["ProductionHours"]);

                if (dr["CheckIn"] == DBNull.Value)
                {
                    lblPunchInTime.Text = "Not Checked In";
                    btnAttendance.Text = "Check-In";
                }
                else
                {
                    lblPunchInTime.Text = Convert.ToDateTime(dr["CheckIn"]).ToString("hh:mm tt");

                    if (dr["CheckOut"] == DBNull.Value)
                        btnAttendance.Text = "Check-Out";
                    else
                    {
                        btnAttendance.Text = "Attendance Marked";
                        btnAttendance.Enabled = false;
                    }
                }
            }
            else
            {
                lblLeftProduction.Text = "0h 0m";
                lblPunchInTime.Text = "Not Checked In";

                btnAttendance.Text = "Check-In";
                btnAttendance.Enabled = true;

                btnLunch.Text = "Lunch-In";
                btnLunch.Enabled = false;
            }

            dr.Close();
        }


        public void Conditions(SqlDataReader dr)
        {

            string profile = Convert.ToString(dr["ProfilePicture"]);

            if (string.IsNullOrWhiteSpace(profile))
            {
                imgProfile.ImageUrl = "~/uploads/user/man1.jpg";
            }
            else
            {
                string physicalPath = Server.MapPath("~/" + profile);

                if (System.IO.File.Exists(physicalPath))
                {
                    imgProfile.ImageUrl = "~/" + profile;
                }
                else
                {
                    imgProfile.ImageUrl = "~/uploads/user/man1.jpg";
                }
            }



            if (dr["CheckIn"] == DBNull.Value)
            {
                btnLunch.Text = "Lunch-In";
                btnLunch.Enabled = false;
            }
            else if (dr["CheckOut"] != DBNull.Value)
            {
                btnLunch.Text = "Lunch Done";
                btnLunch.Enabled = false;
            }
            else if (dr["LunchIn"] == DBNull.Value)
            {
                btnLunch.Text = "Lunch-In";
                btnLunch.Enabled = true;
            }
            else if (dr["LunchOut"] == DBNull.Value)
            {
                btnLunch.Text = "Lunch-Out";
                btnLunch.Enabled = true;
            }
            else
            {
                btnLunch.Text = "Lunch Done";
                btnLunch.Enabled = false;
            }
        }




        protected void btnLunch_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SP_Attendance_Mark_LunchIn_LunchOut", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", SessionUserId);

            SqlParameter msg = new SqlParameter("@Message", SqlDbType.VarChar, 100);
            msg.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(msg);

            cmd.ExecuteNonQuery();

            Attendance_LeftCard();
            Attendance_ReadAll();
            Attendance_Summary();
            Attendance_TodayProgress();

            ScriptManager.RegisterStartupScript(this, GetType(), "msg",
                $"alert('{msg.Value.ToString()}');", true);
        }





    }
}