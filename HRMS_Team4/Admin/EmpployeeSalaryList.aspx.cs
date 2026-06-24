using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using HRMS_Team4.User;

namespace HRMS_Team4.Admin
{
    public partial class EmpployeeSalaryList : System.Web.UI.Page
    {
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString);
            con.Open();

            if (!IsPostBack)
            {
                gvEmployeeSalary.DataSource = LoadEmployeeSalaryList();
                gvEmployeeSalary.DataBind();
            }
        }

        private DataTable LoadEmployeeSalaryList()
        {
            SqlDataAdapter da = new SqlDataAdapter(@"
        SELECT 
            p.PayslipId,
            p.UserId,
            p.Month,
            p.Year,
            p.PayslipPath,
            p.GeneratedOn,

            u.FirstName,
            u.LastName,
            u.Email,
            u.PhoneNumber,
            u.DateOfJoining,
            u.ProfilePicture,

            es.TotalSalary,
            es.NetSalary

        FROM Payslips p
        INNER JOIN [User] u 
            ON p.UserId = u.UserId

        LEFT JOIN EmployeeSalaries es 
            ON es.UserId = p.UserId

        ORDER BY p.PayslipId DESC
    ", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            DataTable dt = LoadEmployeeSalaryList();

            DataView dv = dt.DefaultView;

            string sortOption = ddlSort.SelectedValue;

            // SORT OPTIONS
            if (sortOption == "Ascending")
                dv.Sort = "FirstName ASC";

            else if (sortOption == "Descending")
                dv.Sort = "FirstName DESC";

            else if (sortOption == "Recently Added")
                dv.Sort = "UserId DESC";

            // FILTER BY DATE RANGE (optional)
            if (!string.IsNullOrEmpty(txtDateRange.Text) &&
                txtDateRange.Text.Contains("-"))
            {
                string[] dates = txtDateRange.Text.Split('-');

                DateTime fromDate, toDate;

                if (DateTime.TryParse(dates[0].Trim(), out fromDate) &&
                    DateTime.TryParse(dates[1].Trim(), out toDate))
                {
                    dv.RowFilter =
                        $"DateOfJoining >= #{fromDate:MM/dd/yyyy}# AND DateOfJoining <= #{toDate:MM/dd/yyyy}#";
                }
            }

            gvEmployeeSalary.DataSource = dv;
            gvEmployeeSalary.DataBind();
        }

        protected void btnGeneratePayslips_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvEmployeeSalary.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl("chkSelect");

                if (chk.Checked)
                {
                    int UserId = Convert.ToInt32(gvEmployeeSalary.DataKeys[row.RowIndex].Value);

                    Response.Redirect("~/Admin/Payslips.aspx?UserId=" + UserId);
                    return;
                }
            }

            Response.Write("<script>alert('Please select an employee');</script>");
        }

        protected void gvEmployeeSalary_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRecord")
            {
                int salaryId = Convert.ToInt32(e.CommandArgument);
                DeleteRecord(salaryId);
            }
            else if (e.CommandName == "GeneratePDF")
            {
                int UserId = Convert.ToInt32(e.CommandArgument);

                Response.Redirect("~/Admin/Payslips.aspx?UserId=" + UserId);
            }
        }

        protected void gvEmployeeSalary_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        private void DeleteRecord(int PayslipId)
        {
            SqlCommand cmd = new SqlCommand(@"
        DELETE FROM Payslips 
        WHERE PayslipId = @PayslipId", con);

            cmd.Parameters.AddWithValue("@PayslipId", PayslipId);

            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Deleted successfully')</script>");

            gvEmployeeSalary.DataSource = LoadEmployeeSalaryList();
            gvEmployeeSalary.DataBind();
        }


    }
}