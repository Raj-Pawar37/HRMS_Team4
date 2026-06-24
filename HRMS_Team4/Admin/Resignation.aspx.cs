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
    public partial class Resignation : System.Web.UI.Page
    {


        SqlConnection conn;
        string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                LoadResignations();
            }
        }

        private void LoadResignations()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand("SP_Resignation_ReadAll", con);

                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                gvResignation.DataSource = dt;
                gvResignation.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            bool isNew = string.IsNullOrEmpty(hfResignationId.Value);
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd;

                if (string.IsNullOrEmpty(hfResignationId.Value))
                {
                    cmd = new SqlCommand("SP_Resignation_Create", con);
                }
                else
                {
                    cmd = new SqlCommand("SP_Resignation_Update", con);
                    cmd.Parameters.AddWithValue( "@ResignationId",  Convert.ToInt32(hfResignationId.Value));
                }

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(txtUserID.Text));

                cmd.Parameters.AddWithValue("@DepartmentId", Convert.ToInt32(txtDepartmentID.Text));

                cmd.Parameters.AddWithValue( "@NoticeDate", Convert.ToDateTime(txtNoticeDate.Text));

                cmd.Parameters.AddWithValue( "@ResignDate", Convert.ToDateTime(txtResignDate.Text));

                cmd.Parameters.AddWithValue(  "@Reason", txtReason.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                hfResignationId.Value = "";

                txtUserID.Text = "";
                txtDepartmentID.Text = "";
                txtNoticeDate.Text = "";
                txtResignDate.Text = "";
                txtReason.Text = "";
            }

            LoadResignations();

            string msg = isNew
      ? "Resignation Added Successfully"
      : "Resignation Updated Successfully";

            ScriptManager.RegisterStartupScript(this,GetType(),  "msg", $"alert('{msg}');", true);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            int resignationId =
                Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand("SP_Resignation_Delete", con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue(
                    "@ResignationId",
                    resignationId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadResignations();
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            int resignationId =
                Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(  "SELECT * FROM Resignation WHERE ResignationId=@ResignationId",  con);

                cmd.Parameters.AddWithValue( "@ResignationId",  resignationId);

                DataTable dt =new DataTable();

                new SqlDataAdapter(cmd).Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    hfResignationId.Value = dt.Rows[0]["ResignationId"].ToString();

                    txtUserID.Text = dt.Rows[0]["UserID"].ToString();

                    txtDepartmentID.Text = dt.Rows[0]["DepartmentId"].ToString();

                    txtNoticeDate.Text =Convert.ToDateTime(dt.Rows[0]["NoticeDate"])  .ToString("yyyy-MM-dd");

                    txtResignDate.Text =  Convert.ToDateTime(dt.Rows[0]["ResignDate"])  .ToString("yyyy-MM-dd");

                    txtReason.Text = dt.Rows[0]["Reason"].ToString();

                    ScriptManager.RegisterStartupScript( this,  GetType(), "ShowModal", "new bootstrap.Modal(document.getElementById('resignationModal')).show();", true);
                }
            }
        }
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand("SP_Resignation_ReadAll", con);

                cmd.CommandType = CommandType.StoredProcedure;

                DataTable dt = new DataTable();

                new SqlDataAdapter(cmd).Fill(dt);

                dt.DefaultView.RowFilter =
                    $"EmployeeName LIKE '%{txtSearch.Text.Replace("'", "''")}%'";

                gvResignation.DataSource = dt.DefaultView;
                gvResignation.DataBind();
            }
        }
        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SP_Resignation_ReadAll", con);
                cmd.CommandType = CommandType.StoredProcedure;

                DataTable dt = new DataTable();
                new SqlDataAdapter(cmd).Fill(dt);

                string sortOrder = ddlSort.SelectedValue;

                if (sortOrder == "ASC")
                {
                    dt.DefaultView.Sort = "EmployeeName ASC";
                }
                else
                {
                    dt.DefaultView.Sort = "EmployeeName DESC";
                }

                gvResignation.DataSource = dt.DefaultView;
                gvResignation.DataBind();
            }
        }
    }
}
