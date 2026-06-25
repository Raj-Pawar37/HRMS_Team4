using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class TransactionHistory : System.Web.UI.Page
    {
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString);
            con.Open();

            if (!IsPostBack)
            {
                BindMonth();
                BindYear();
                BindDepartment();
                BindDesignation();
                BindGrid();
            }
        }

        //-----------------------------------------
        // Bind GridView
        //-----------------------------------------
        private void BindGrid()
        {
            SqlCommand cmd = new SqlCommand("sp_TransactionHistory_List", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvTransactionHistory.DataSource = dt;
            gvTransactionHistory.DataBind();
        }

        //-----------------------------------------
        // Month Dropdown
        //-----------------------------------------
        private void BindMonth()
        {
            ddlMonth.Items.Clear();
            ddlMonth.Items.Add(new ListItem("All", ""));

            for (int i = 1; i <= 12; i++)
            {
                ddlMonth.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

        private void BindYear()
        {
            ddlYear.Items.Clear();
            ddlYear.Items.Add(new ListItem("All", ""));

            int currentYear = DateTime.Now.Year;

            for (int i = currentYear; i >= currentYear - 5; i--)
            {
                ddlYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

        private void BindDepartment()
        {
            SqlCommand cmd = new SqlCommand("SELECT DepartmentId, Name FROM Departments", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlDepartment.DataSource = dt;
            ddlDepartment.DataTextField = "Name";
            ddlDepartment.DataValueField = "DepartmentId";
            ddlDepartment.DataBind();

            ddlDepartment.Items.Insert(0, new ListItem("All", ""));
        }

        private void BindDesignation()
        {
            SqlCommand cmd = new SqlCommand("SELECT DesignationId, Name FROM Designations", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlDesignation.DataSource = dt;
            ddlDesignation.DataTextField = "Name";
            ddlDesignation.DataValueField = "DesignationId";
            ddlDesignation.DataBind();

            ddlDesignation.Items.Insert(0, new ListItem("All", ""));
        }
        protected void btnApplyFilter_Click(object sender, EventArgs e)
        {
            FilterData();
        }

        private void FilterData()
        {
            SqlCommand cmd = new SqlCommand("sp_Transaction_History_Filter", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Month
            if (string.IsNullOrEmpty(ddlMonth.SelectedValue))
                cmd.Parameters.AddWithValue("@Month", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@Month", Convert.ToInt32(ddlMonth.SelectedValue));

            // Year
            if (string.IsNullOrEmpty(ddlYear.SelectedValue))
                cmd.Parameters.AddWithValue("@Year", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@Year", Convert.ToInt32(ddlYear.SelectedValue));

            // Department
            if (string.IsNullOrEmpty(ddlDepartment.SelectedValue))
                cmd.Parameters.AddWithValue("@DepartmentId", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@DepartmentId", Convert.ToInt32(ddlDepartment.SelectedValue));

            // Designation
            if (string.IsNullOrEmpty(ddlDesignation.SelectedValue))
                cmd.Parameters.AddWithValue("@DesignationId", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@DesignationId", Convert.ToInt32(ddlDesignation.SelectedValue));

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvTransactionHistory.DataSource = dt;
            gvTransactionHistory.DataBind();
        }
        //-----------------------------------------
        // Export PDF
        //-----------------------------------------
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {

        }

        //-----------------------------------------
        // Export Excel
        //-----------------------------------------
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();

            using (SqlCommand cmd = new SqlCommand("sp_TransactionHistory_List", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=TransactionHistory.xls");
            Response.ContentType = "application/vnd.ms-excel";
            Response.Charset = "";
            Response.ContentEncoding = System.Text.Encoding.UTF8;

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            // Build HTML table manually
            hw.Write("<table border='1'>");

            // HEADER
            hw.Write("<tr>");
            foreach (DataColumn col in dt.Columns)
            {
                hw.Write("<th>");
                hw.Write(col.ColumnName);
                hw.Write("</th>");
            }
            hw.Write("</tr>");

            // DATA
            foreach (DataRow row in dt.Rows)
            {
                hw.Write("<tr>");
                foreach (var item in row.ItemArray)
                {
                    hw.Write("<td>");
                    hw.Write(item.ToString());
                    hw.Write("</td>");
                }
                hw.Write("</tr>");
            }

            hw.Write("</table>");

            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for Excel export
        }

        //public string GetMonthName(object month)
        //{
        //    if (month == null) return "";

        //    int m = Convert.ToInt32(month);
        //    return new DateTime(2020, m, 1).ToString("MMMM");
        //}

        //-----------------------------------------
        // GridView Commands
        //-----------------------------------------
        protected void gvTransactionHistory_RowCommand(object sender,
GridViewCommandEventArgs e)
        {

            int UserId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "ViewPayslip")
            {
                Response.Redirect("~/Admin/Payslips.aspx?UserId=" + UserId);
            }

            else if (e.CommandName == "DownloadPayslip")
            {
                Response.Redirect("~/Admin/Payslips.aspx?UserId=" + UserId);
            }

            else if (e.CommandName == "DeletePayslip")
            {
                int SalaryId = Convert.ToInt32(e.CommandArgument);

                SqlCommand cmd = new SqlCommand("DELETE FROM EmployeeSalaries WHERE SalaryId=@SalaryId", con);

                cmd.Parameters.AddWithValue("@SalaryId", SalaryId);


                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Delete successfully')</script>");
                BindGrid();
            }
        }

        //-----------------------------------------
        // Download
        //-----------------------------------------


        //-----------------------------------------
        // Delete
        //-----------------------------------------


        //-----------------------------------------
        // Paging
        //-----------------------------------------
        protected void gvTransactionHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTransactionHistory.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        //-----------------------------------------
        // Sorting
        //-----------------------------------------
        protected void gvEmployeeSalary_Sorting(
                object sender,
                GridViewSortEventArgs e)
        {

        }
    }

}








