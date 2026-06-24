using HRMS_Team4.User;
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
    public partial class Termination1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployees();
                LoadTerminations();
            }
        }

        private void LoadEmployees()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT UserId, FirstName + ' ' + LastName AS EmployeeName FROM [User]",
                    con);

                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlEmployee.DataSource = dt;
                ddlEmployee.DataTextField = "EmployeeName";
                ddlEmployee.DataValueField = "UserId";
                ddlEmployee.DataBind();

                ddlEmployee.Items.Insert(0, new ListItem("Select Employee", ""));

                ddlEditEmployee.DataSource = dt;
                ddlEditEmployee.DataTextField = "EmployeeName";
                ddlEditEmployee.DataValueField = "UserId";
                ddlEditEmployee.DataBind();

                ddlEditEmployee.Items.Insert(0, new ListItem("Select Employee", ""));
            }
        }

        private void LoadTerminations()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter(@"
                SELECT
                    t.TerminationId,
                    u.FirstName + ' ' + u.LastName AS EmployeeName,
                    t.TerminationType,
                    t.NoticeDate,
                    t.ResignDate,
                    t.Reason
                FROM Termination t
                INNER JOIN [User] u
                    ON t.UserID = u.UserId
                ORDER BY t.TerminationId DESC", con);

                DataTable dt = new DataTable();
                da.Fill(dt);

                gvTermination.DataSource = dt;
                gvTermination.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SP_Termination_Create", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserID", ddlEmployee.SelectedValue);
                cmd.Parameters.AddWithValue("@TerminationType", txtTerminationType.Text);
                cmd.Parameters.AddWithValue("@NoticeDate", Convert.ToDateTime(txtNoticeDate.Text));
                cmd.Parameters.AddWithValue("@ResignDate", Convert.ToDateTime(txtResignDate.Text));
                cmd.Parameters.AddWithValue("@Reason", txtReason.Text);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadTerminations();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Your existing edit code
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Your existing update code
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            int id = Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SP_Termination_Delete", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@TerminationId", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadTerminations();
        }
    }
}

