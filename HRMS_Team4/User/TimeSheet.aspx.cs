using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.User
{
    public partial class TimeSheet : System.Web.UI.Page
    {

        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString);
            con.Open();
            if (!IsPostBack)
            {
                BindProjects();
                BindGrid();
            }
        }


        void BindProjects()
        {

            SqlCommand cmd = new SqlCommand("SELECT ProjectId, ProjectName FROM AllProjects", con);
            //con.Open();

            ddlProject.DataSource = cmd.ExecuteReader();
            ddlProject.DataTextField = "ProjectName";
            ddlProject.DataValueField = "ProjectId";
            ddlProject.DataBind();

            ddlProject.Items.Insert(0, "--Select Project--");

        }


        void BindGrid()
        {

            string query = "sp_Timesheets_User_Select";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvTimesheet.DataSource = dt;
            gvTimesheet.DataBind();

            if (gvTimesheet.Rows.Count > 0)
            {
                gvTimesheet.UseAccessibleHeader = true;
                gvTimesheet.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Session["UserId"] = 37;
            //int userId = Convert.ToInt32(e.CommandArgument);

            SqlCommand cmd = new SqlCommand("sp_Timesheet_User_Insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
            cmd.Parameters.AddWithValue("@ProjectId", ddlProject.SelectedValue);
            cmd.Parameters.AddWithValue("@Date", txtDate.Text);
            cmd.Parameters.AddWithValue("@WorkHours", txtHours.Text);
            cmd.Parameters.AddWithValue("@CreatedBy", Session["UserId"]);

            //con.Open();
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Added successfully ')</script>");

            BindGrid();
        }


        protected void btnSendForApproval_Click(object sender, EventArgs e)
        {
            string ids = hiddenIds.Value;

            if (!string.IsNullOrEmpty(ids))
            {

                SqlCommand cmd = new SqlCommand("sp_Timesheet_SendForApproval", con);
                con.Open();
                cmd.ExecuteNonQuery();
                //ScriptManager.RegisterStartupScript(this, this.GetType(),
                //"alert",
                //"alert('Sent successfully');",
                //true);
                Response.Write("<script>alert('Send successfully ')</script>");
            }

            BindGrid();
        }

        protected string GetStatusClass(string status)
        {
            if (status == "Approved")
                return "badge bg-success";

            if (status == "Rejected")
                return "badge bg-danger";

            return "badge bg-warning text-dark";
        }


        protected void btnExportPdf_Click(object sender, EventArgs e)
        {
            // Use iTextSharp or similar
        }


        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            // Use GridView rendering to Excel
        }

        protected void gvTimesheet_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            // optional formatting
        }
    }
}