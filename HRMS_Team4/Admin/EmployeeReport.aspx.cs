using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace HRMS_Team4.Admin

{
    public partial class EmployeeReport : System.Web.UI.Page
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
                LoadEmployeeList();
                LoadDepartments();
            }
        }

        private void LoadCards()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "sp_Employee_ReportCards",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                con.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblTotalEmployees.Text =
                        dr["TotalEmployee"].ToString();

                    lblTotalNewJoiners.Text =
                        dr["NewJoiners"].ToString();

                    lblActiveEmployees.Text =
                        dr["ActiveEmployee"].ToString();

                    lblTotalInActiveEmployee.Text =
                        dr["InActiveEmployee"].ToString();
                }
            }
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadChart();
        }
        private void LoadChart()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand("sp_EmployeeReport_Chart", con);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue(
    "@Year",
    Convert.ToInt32(ddlYear.SelectedValue));

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                string months = "";
                string active = "";
                string inactive = "";

                while (dr.Read())
                {
                    Response.Write(hfMonths.Value + "<br>");
                    Response.Write(hfActive.Value + "<br>");
                    Response.Write(hfInactive.Value + "<br>");

                    months += "'" + dr["MonthName"].ToString().Substring(0, 3) + "',";

                    active += dr["ActiveEmployees"].ToString() + ",";

                    inactive += dr["InactiveEmployees"].ToString() + ",";
                }

                hfMonths.Value = months.TrimEnd(',');

                hfActive.Value = active.TrimEnd(',');

                hfInactive.Value = inactive.TrimEnd(',');

                dr.Close();
            }
        }

        private void LoadEmployeeList()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "sp_Employee_ReportList",
                        con);
                cmd.Parameters.AddWithValue(
    "@PageSize",
    Convert.ToInt32(
        ddlPageSize.SelectedValue));

                cmd.CommandType =
                    CommandType.StoredProcedure;

                if (!string.IsNullOrEmpty(hfFromDate.Value))
                {
                    cmd.Parameters.AddWithValue(
                        "@FromDate",
                        hfFromDate.Value);

                    cmd.Parameters.AddWithValue(
                        "@ToDate",
                        hfToDate.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue(
                        "@FromDate",
                        DBNull.Value);

                    cmd.Parameters.AddWithValue(
                        "@ToDate",
                        DBNull.Value);
                }

                if (!string.IsNullOrEmpty(
                    ddlDepartment.SelectedValue))
                {
                    cmd.Parameters.AddWithValue(
                        "@DepartmentId",
                        ddlDepartment.SelectedValue);
                }
                else
                {
                    cmd.Parameters.AddWithValue(
                        "@DepartmentId",
                        DBNull.Value);
                }

                if (!string.IsNullOrEmpty(
                    ddlStatus.SelectedValue))
                {
                    cmd.Parameters.AddWithValue(
                        "@Status",
                        ddlStatus.SelectedValue);
                }
                else
                {
                    cmd.Parameters.AddWithValue(
                        "@Status",
                        DBNull.Value);
                }

                if (!string.IsNullOrEmpty(
                    txtSearch.Text))
                {
                    cmd.Parameters.AddWithValue(
                        "@Search",
                        txtSearch.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue(
                        "@Search",
                        DBNull.Value);
                }

                if (!string.IsNullOrEmpty(
                    ddlSortBy.SelectedValue))
                {
                    cmd.Parameters.AddWithValue(
                        "@SortBy",
                        ddlSortBy.SelectedValue);
                }
                else
                {
                    cmd.Parameters.AddWithValue(
                        "@SortBy",
                        DBNull.Value);
                }

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                gvEmployeeReport.DataSource = dt;
                gvEmployeeReport.DataBind();
            }
        }
        protected void FilterChanged(
    object sender,
    EventArgs e)
        {

            LoadEmployeeList();
        }

        private void LoadDepartments()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "sp_EmployeeReport_DepartmentDropdown",
                    con);

                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();

                ddlDepartment.DataSource = cmd.ExecuteReader();
                ddlDepartment.DataTextField = "DepartmentName";
                ddlDepartment.DataValueField = "DepartmentId";
                ddlDepartment.DataBind();
            }
        }

        protected void ddlPageSize_SelectedIndexChanged(
    object sender,
    EventArgs e)
        {
            LoadEmployeeList();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
        }

        private DataTable GetEmployeeData()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand("sp_Employee_ReportList", con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                // Status
                if (!string.IsNullOrEmpty(ddlStatus.SelectedValue))
                    cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                else
                    cmd.Parameters.AddWithValue("@Status", DBNull.Value);

                // Department
                if (!string.IsNullOrEmpty(ddlDepartment.SelectedValue))
                    cmd.Parameters.AddWithValue("@DepartmentId", ddlDepartment.SelectedValue);
                else
                    cmd.Parameters.AddWithValue("@DepartmentId", DBNull.Value);

                // Search
                if (!string.IsNullOrEmpty(txtSearch.Text))
                    cmd.Parameters.AddWithValue("@Search", txtSearch.Text);
                else
                    cmd.Parameters.AddWithValue("@Search", DBNull.Value);

                // Date
                if (!string.IsNullOrEmpty(hfFromDate.Value))
                {
                    cmd.Parameters.AddWithValue("@FromDate", hfFromDate.Value);
                    cmd.Parameters.AddWithValue("@ToDate", hfToDate.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@FromDate", DBNull.Value);
                    cmd.Parameters.AddWithValue("@ToDate", DBNull.Value);
                }

                // Sort
                if (!string.IsNullOrEmpty(ddlSortBy.SelectedValue))
                    cmd.Parameters.AddWithValue("@SortBy", ddlSortBy.SelectedValue);
                else
                    cmd.Parameters.AddWithValue("@SortBy", DBNull.Value);

                // Show all records while exporting
                cmd.Parameters.AddWithValue("@PageSize", 999999);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                return dt;
            }
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            DataTable dt = GetEmployeeData();

            Response.Clear();
            Response.Buffer = true;

            Response.AddHeader(
                "content-disposition",
                "attachment;filename=EmployeeReport.xls");

            Response.ContentType = "application/ms-excel";

            foreach (DataColumn col in dt.Columns)
            {
                Response.Write(col.ColumnName + "\t");
            }

            Response.Write("\n");

            foreach (DataRow row in dt.Rows)
            {
                foreach (object item in row.ItemArray)
                {
                    Response.Write(item.ToString() + "\t");
                }

                Response.Write("\n");
            }

            Response.End();
        }


        protected void btnExportPdf_Click(object sender, EventArgs e)
        {
            DataTable dt = GetEmployeeData();

            Document document =
                new Document(PageSize.A4);

            Response.ContentType = "application/pdf";

            Response.AddHeader(
                "content-disposition",
                "attachment;filename=EmployeeReport.pdf");

            PdfWriter.GetInstance(document,
                Response.OutputStream);

            document.Open();

            PdfPTable table =
                new PdfPTable(dt.Columns.Count);

            foreach (DataColumn col in dt.Columns)
            {
                table.AddCell(col.ColumnName);
            }

            foreach (DataRow row in dt.Rows)
            {
                foreach (object item in row.ItemArray)
                {
                    table.AddCell(item.ToString());
                }
            }

            document.Add(table);

            document.Close();

            Response.End();
        }


    }
}