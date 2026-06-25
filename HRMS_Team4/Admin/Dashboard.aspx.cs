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
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;
            conn = new SqlConnection(cs);

            if (!IsPostBack)
            {
                ddlEmployeeStatusFilter.SelectedValue = "2";
                Dashboard_EmployeeStatus();

                ddlAttendanceFilter.SelectedValue = "2";
                Dashboard_AttendanceOverview();


                BindClockDepartments();
                ddlClockFilter.SelectedValue = "1";
                ddlClockDepartment.SelectedValue = "0";
                Dashboard_ClockInOut();



                Dashboard_Projects();

                Dashboard_EmployeesByDepartment();

            }
        }


        //EmployeeDetails Status 

        public void Dashboard_EmployeeStatus()
        {
           
            SqlCommand cmd = new SqlCommand("SP_Dashboard_EmployeeStatus", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Filter", Convert.ToInt32(ddlEmployeeStatusFilter.SelectedValue));

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                lblTotalEmployee.Text = dt.Rows[0]["TotalEmployee"].ToString();
            }
            else
            {
                lblTotalEmployee.Text = "0";
            }

            rptEmployeeStatus.DataSource = dt;
            rptEmployeeStatus.DataBind();

            rptEmployeeStatusProgress.DataSource = dt;
            rptEmployeeStatusProgress.DataBind();
        }

        protected void ddlEmployeeStatusFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            Dashboard_EmployeeStatus();
        }

        public string GetEmployeeStatusBgColor(string name)
        {
            if (name == "Production Hours")
                return "bg-warning";

            if (name == "Working Hours")
                return "bg-secondary";

            if (name == "Break Hours")
                return "bg-danger";

            if (name == "Overtime Hours")
                return "bg-pink";

            return "bg-primary";
        }

        public string GetEmployeeStatusTextColor(string name)
        {
            if (name == "Production Hours")
                return "text-warning";

            if (name == "Working Hours")
                return "text-secondary";

            if (name == "Break Hours")
                return "text-danger";

            if (name == "Overtime Hours")
                return "text-pink";

            return "text-primary";
        }

        public string GetEmployeeStatusBoxClass(int index)
        {
            string css = "";

            if (index == 0 || index == 2)
                css += "border-end ";

            if (index == 0 || index == 1)
                css += "border-bottom ";

            if (index == 1 || index == 3)
                css += "text-end ";

            return css;
        }

        public string GetProgressWidth(object value)
        {
            decimal percentage = 0;

            if (value != null && value != DBNull.Value)
                percentage = Convert.ToDecimal(value);

            return percentage.ToString("0.##", System.Globalization.CultureInfo.InvariantCulture);
        }






        //Attendance Overview -----------------------------------------------------------------------------
        //-------------------------------------------------------------------------------------------------
        //-------------------------------------------------------------------------------------------------

        public void Dashboard_AttendanceOverview()
        {
            SqlCommand cmd = new SqlCommand("SP_Dashboard_AttendanceOverview", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FilterType", Convert.ToInt32(ddlAttendanceFilter.SelectedValue));

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
                lblTotalAttendance.Text = dt.Rows[0]["TotalAttendance"].ToString();

            rptAttendanceOverview.DataSource = dt;
            rptAttendanceOverview.DataBind();

            hfPresentPercentage.Value = "0";
            hfHalfDayPercentage.Value = "0";
            hfAbsentPercentage.Value = "0";
            lblAbsentCount.Text = "0";

            foreach (DataRow row in dt.Rows)
            {
                string name = row["Name"].ToString();
                string percentage = Convert.ToDecimal(row["Percentage"]).ToString("0.##", System.Globalization.CultureInfo.InvariantCulture);

                if (name == "Present")
                    hfPresentPercentage.Value = percentage;

                if (name == "Half Day")
                    hfHalfDayPercentage.Value = percentage;

                if (name == "Absent")
                {
                    hfAbsentPercentage.Value = percentage;
                    lblAbsentCount.Text = row["TotalCount"].ToString();
                }
            }

            ScriptManager.RegisterStartupScript(
                updAttendanceOverview,
                updAttendanceOverview.GetType(),
                "attendanceChartScript",
                "loadAttendanceChart();",
                true
            );
        }

        protected void ddlAttendanceFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            Dashboard_AttendanceOverview();
        }

        public string GetAttendanceColor(string name)
        {
            if (name == "Present")
                return "text-success";

            if (name == "Half Day")
                return "text-secondary";

            if (name == "Absent")
                return "text-danger";

            return "text-primary";
        }







        //Clock in CLock Out -----------------------------------------------------------------------------
        //-------------------------------------------------------------------------------------------------
        //-------------------------------------------------------------------------------------------------


        public void BindClockDepartments()
        {
            SqlCommand cmd = new SqlCommand("SP_Departments_ReadAll", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlClockDepartment.DataSource = dt;
            ddlClockDepartment.DataTextField = "Name";
            ddlClockDepartment.DataValueField = "DepartmentId";
            ddlClockDepartment.DataBind();

            ddlClockDepartment.Items.Insert(0, new ListItem("All Departments", "0"));
        }

        public void Dashboard_ClockInOut()
        {
            int filterType = Convert.ToInt32(ddlClockFilter.SelectedValue);
            int departmentId = Convert.ToInt32(ddlClockDepartment.SelectedValue);

            SqlCommand cmd = new SqlCommand("SP_Dashboard_ClockInOut", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FilterType", filterType);
            cmd.Parameters.AddWithValue("@DepartmentId", departmentId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptClockInOut.DataSource = dt;
            rptClockInOut.DataBind();

            SqlCommand cmdLate = new SqlCommand("SP_Dashboard_LateEmployees", conn);
            cmdLate.CommandType = CommandType.StoredProcedure;
            cmdLate.Parameters.AddWithValue("@FilterType", filterType);
            cmdLate.Parameters.AddWithValue("@DepartmentId", departmentId);

            SqlDataAdapter daLate = new SqlDataAdapter(cmdLate);
            DataTable dtLate = new DataTable();
            daLate.Fill(dtLate);

            rptLateEmployees.DataSource = dtLate;
            rptLateEmployees.DataBind();
        }

        protected void ddlClockFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            Dashboard_ClockInOut();
        }

        public string FormatTime(object value)
        {
            if (value == null || value == DBNull.Value)
                return "--:--";

            return Convert.ToDateTime(value).ToString("hh:mm");
        }










        //Project List -----------------------------------------------------------------------------
        //-------------------------------------------------------------------------------------------------
        //-------------------------------------------------------------------------------------------------


        public void Dashboard_Projects()
        {
            SqlCommand cmd = new SqlCommand("SP_Dashboard_Projects", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptDashboardProjects.DataSource = dt;
            rptDashboardProjects.DataBind();
        }

        public string GetPriorityBadge(string priority)
        {
            if (priority == "High")
                return "badge badge-danger-transparent";

            if (priority == "Medium")
                return "badge badge-warning-transparent";

            if (priority == "Low")
                return "badge badge-success-transparent";

            return "badge badge-secondary-transparent";
        }

        public string GetTeamImages(object value)
        {
            if (value == null || value == DBNull.Value)
                return "";

            string images = value.ToString();

            if (string.IsNullOrWhiteSpace(images))
                return "";

            string html = "";

            foreach (string img in images.Split(','))
            {
                if (!string.IsNullOrWhiteSpace(img))
                {
                    string path = img.Trim();

                    if (!path.StartsWith("/"))
                        path = "/" + path;

                    html += "<span class='avatar border-0'>";
                    html += "<img src='" + ResolveUrl("~" + path) + "' alt='Profile Picture' width='40' height='40' style='border-radius:50%;' />";
                    html += "</span>";
                }
            }

            return html;
        }





        //Project List -----------------------------------------------------------------------------
        //-------------------------------------------------------------------------------------------------
        //-------------------------------------------------------------------------------------------------

        public void Dashboard_EmployeesByDepartment()
        {
            SqlCommand cmd = new SqlCommand("SP_Dashboard_EmployeesByDepartment", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            List<string> deptNames = new List<string>();
            List<string> deptCounts = new List<string>();

            foreach (DataRow row in dt.Rows)
            {
                deptNames.Add(row["DepartmentName"].ToString());
                deptCounts.Add(row["TotalEmployees"].ToString());
            }

            hfDeptNames.Value = string.Join(",", deptNames);
            hfDeptCounts.Value = string.Join(",", deptCounts);
        }






































    }
}