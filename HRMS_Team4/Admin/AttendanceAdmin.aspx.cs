using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.NetworkInformation;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class Attendance : System.Web.UI.Page
    {
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString);
            con.Open();

            if (!IsPostBack)
            {
                Attendance_Admin_TodaySummary();
                BindDepartment();
                BindGrid();
                LoadCount();
            }
        }


        public void Attendance_Admin_TodaySummary()
        {
            SqlCommand cmd = new SqlCommand("SP_Attendance_Admin_TodaySummary", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblTotalEmployee.Text = dr["EmployeeCount"].ToString();
                lblPresent.Text = dr["Present"].ToString();
                lblLate.Text = dr["Late"].ToString();
                lblPermission.Text = dr["Permission"].ToString();
                lblAbsent.Text = dr["Absent"].ToString();
            }

            dr.Close();
        }


        protected void FilterChanged(object sender, EventArgs e)
        {
            BindGrid();
        }


        public void BindGrid()
        {
            SqlDataAdapter da = new SqlDataAdapter("sp_Attendance_Select", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            // Start Date
            if (string.IsNullOrWhiteSpace(txtStartDate.Text))
                da.SelectCommand.Parameters.AddWithValue("@StartDate", DBNull.Value);
            else
                da.SelectCommand.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(txtStartDate.Text));

            // End Date
            if (string.IsNullOrWhiteSpace(txtEndDate.Text))
                da.SelectCommand.Parameters.AddWithValue("@EndDate", DBNull.Value);
            else
                da.SelectCommand.Parameters.AddWithValue("@EndDate", Convert.ToDateTime(txtEndDate.Text));

            // Department
            if (ddlDepartment.SelectedValue == "0")
                da.SelectCommand.Parameters.AddWithValue("@DepartmentId", DBNull.Value);
            else
                da.SelectCommand.Parameters.AddWithValue("@DepartmentId", Convert.ToInt32(ddlDepartment.SelectedValue));

            // Status
            if (ddlStatus.SelectedValue == "All")
                da.SelectCommand.Parameters.AddWithValue("@Status", DBNull.Value);
            else
                da.SelectCommand.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);




            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();

            if (GridView1.Rows.Count > 0)
            {
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }



        public void BindDepartment()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "sp_Department_Select", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlDepartment.DataSource = dt;
            ddlDepartment.DataTextField = "Name";
            ddlDepartment.DataValueField = "DepartmentId";
            ddlDepartment.DataBind();

            //ddlDepartment.Items.Insert(0, "All Departments");
            ddlDepartment.Items.Insert(0, new ListItem("All Departments", "0"));
        }

        public void LoadCount()
        {

            string query = @"
                    SELECT 
                        COUNT(CASE WHEN Status = 'Present' THEN 1 END) AS PresentCount,
                        COUNT(CASE WHEN Late = 'Yes' OR Status = 'Late' THEN 1 END) AS LateCount,
                        COUNT(CASE WHEN Status = 'Permission' THEN 1 END) AS PermissionCount,
                        COUNT(CASE WHEN Status = 'Absent' THEN 1 END) AS AbsentCount
                    FROM Attendance
                    WHERE CAST(Date AS DATE) = CAST(GETDATE() AS DATE)";
            SqlCommand cmd = new SqlCommand( query, con);
            try
            {
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblPresent.Text = reader["PresentCount"].ToString();
                    lblLate.Text = reader["LateCount"].ToString();
                    lblPermission.Text = reader["PermissionCount"].ToString();
                    lblAbsent.Text = reader["AbsentCount"].ToString();
                }
            }
            catch (Exception ex)
            {
                // Fallback/log error
            }

        }

        public void Fetch()
        {

        }

        public void ExportExcel()
        {

        }

        public void ExportPdf()
        {

        }

       

        protected void lnkExcel_Click(object sender, EventArgs e)
        {

        }

        protected void lnkPdf_Click(object sender, EventArgs e)
        {

        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtStartDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtEndDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}