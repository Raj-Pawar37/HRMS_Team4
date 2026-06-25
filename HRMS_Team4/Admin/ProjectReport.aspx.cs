using iTextSharp.text;
using iTextSharp.text.pdf;
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
    public partial class ProjectReport : System.Web.UI.Page
    {
        string cs = ConfigurationManager
                    .ConnectionStrings["Pulse360_FinalDb"]
                    .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvProjectReport.PageSize =
                    Convert.ToInt32(ddlPageSize.SelectedValue);

                LoadCards();
                LoadGraph();
                LoadProjectList();
            }
        }
        protected void FilterChanged(
    object sender,
    EventArgs e)
        {
            LoadProjectList();
        }

        #region Cards



        private void LoadCards()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand("sp_ProjectReport_Cards", con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                con.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                if (dr.Read())
                {
                    int total =
                        Convert.ToInt32(dr["TotalProjects"]);

                    int completed =
                        Convert.ToInt32(dr["CompletedProjects"]);

                    int onHold =
                        Convert.ToInt32(dr["OnHoldProjects"]);

                    int overdue =
                        Convert.ToInt32(dr["OverDueProjects"]);

                    lblTotalProjects.Text = total.ToString();
                    lblCompletedProjects.Text = completed.ToString();
                    lblOnHoldProjects.Text = onHold.ToString();
                    lblOverDueProjects.Text = overdue.ToString();

                    double completedPer =
                        total > 0
                        ? (completed * 100.0 / total)
                        : 0;

                    double onHoldPer =
                        total > 0
                        ? (onHold * 100.0 / total)
                        : 0;

                    double overduePer =
                        total > 0
                        ? (overdue * 100.0 / total)
                        : 0;

                    divTotalProjectsBar.Style["width"] = "100%";
                    divCompletedProjectsBar.Style["width"] =
                        completedPer.ToString("0") + "%";

                    divOnHoldProjectsBar.Style["width"] =
                        onHoldPer.ToString("0") + "%";

                    divOverDueProjectsBar.Style["width"] =
                        overduePer.ToString("0") + "%";

                    lblCompletedGrowth.Text =
                        completedPer.ToString("0.00") + "%";

                    lblOnHoldGrowth.Text =
                        onHoldPer.ToString("0.00") + "%";

                    lblOverDueGrowth.Text =
                        overduePer.ToString("0.00") + "%";
                }
            }
        }

        #endregion

        #region Graph


        private void LoadGraph()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand("sp_Project_ReportGraph", con);

                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                int active = 0;
                int inactive = 0;
                int inProgress = 0;
                int completed = 0;

                while (dr.Read())
                {
                    string label = dr["Label"].ToString();

                    int total = Convert.ToInt32(dr["Total"]);

                    decimal percentage =
                        Convert.ToDecimal(dr["Percentage"]);

                    if (label == "Active Project")
                    {
                        active = total;

                        // Show Percentage
                        lblActivePercent.Text =
                            percentage.ToString("0.##") + "%";
                    }
                    else if (label == "Inactive Project")
                    {
                        inactive = total;

                        // Show Percentage
                        lblOnHoldPercent.Text =
                            percentage.ToString("0.##") + "%";
                    }
                    else if (label == "InProgress Task")
                    {
                        inProgress = total;

                        // Show Percentage
                        lblPendingPercent.Text =
                            percentage.ToString("0.##") + "%";
                    }
                    else if (label == "Completed Task")
                    {
                        completed = total;

                        // Show Percentage
                        lblCompletedPercent.Text =
                            percentage.ToString("0.##") + "%";
                    }
                }

                // Hidden fields store TOTAL values for Apex Pie Chart
                hfPending.Value = active.ToString();
                hfOnHold.Value = inactive.ToString();
                hfInProgress.Value = inProgress.ToString();
                hfCompleted.Value = completed.ToString();
            }
        }

        #endregion

        #region List

        private void LoadProjectList()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {

                SqlCommand cmd =
                    new SqlCommand(
                        "sp_Project_ReportList",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(
    "@PageNumber",
    1);

                int pageSize =
                    Convert.ToInt32(
                        ddlPageSize.SelectedValue);

                if (pageSize == 0)
                {
                    pageSize = 999999;
                }

                cmd.Parameters.AddWithValue(
                    "@PageSize",
                    pageSize);

                // Priority

                if (!string.IsNullOrEmpty(
                    ddlPriority.SelectedValue))
                {
                    cmd.Parameters.AddWithValue(
                        "@Priority",
                        ddlPriority.SelectedValue);
                }
                else
                {
                    cmd.Parameters.AddWithValue(
                        "@Priority",
                        DBNull.Value);
                }

                // Status

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

                // Search

                if (!string.IsNullOrEmpty(
                    txtSearch.Text.Trim()))
                {
                    cmd.Parameters.AddWithValue(
                        "@Search",
                        txtSearch.Text.Trim());
                }
                else
                {
                    cmd.Parameters.AddWithValue(
                        "@Search",
                        DBNull.Value);
                }

                // Sort

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

                // Date Range
                cmd.Parameters.AddWithValue(
                    "@FromDate",
                    DBNull.Value);

                cmd.Parameters.AddWithValue(
                    "@ToDate",
                    DBNull.Value);

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                gvProjectReport.DataSource = dt;

                gvProjectReport.DataBind();
            }
        }

        protected void ddlPageSize_SelectedIndexChanged(
    object sender,
    EventArgs e)
        {
            int pageSize =
    Convert.ToInt32(ddlPageSize.SelectedValue);

            if (pageSize == 0)
            {
                pageSize = 999999;
            }

            LoadProjectList();
        }

        protected void gvProjectReport_PageIndexChanging(
    object sender,
    GridViewPageEventArgs e)
        {
            gvProjectReport.PageIndex = e.NewPageIndex;

            LoadProjectList();
        }





        public override void VerifyRenderingInServerForm(Control control)
        {
        }




        protected void btnExportExcel_Click(
    object sender,
    EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;

            Response.AddHeader(
                "content-disposition",
                "attachment;filename=ProjectReport.xls");

            Response.Charset = "";

            Response.ContentType =
                "application/vnd.ms-excel";

            StringWriter sw =
                new StringWriter();

            HtmlTextWriter hw =
                new HtmlTextWriter(sw);

            gvProjectReport.AllowPaging = false;

            LoadProjectList();

            gvProjectReport.RenderControl(hw);

            Response.Output.Write(sw.ToString());

            Response.Flush();

            Response.End();
        }



        protected void btnExportPdf_Click(
    object sender,
    EventArgs e)
        {
            DataTable dt = GetProjectData();

            Document document =
                new Document(PageSize.A4);

            Response.ContentType =
                "application/pdf";

            Response.AddHeader(
                "content-disposition",
                "attachment;filename=ProjectReport.pdf");

            PdfWriter.GetInstance(
                document,
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



        private DataTable GetProjectData()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "sp_Project_ReportList",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                return dt;
            }
        }


        #endregion
    }
}