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
    public partial class ApplyLeave : System.Web.UI.Page
    {
        //string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(
               ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString);
            con.Open();
            if (!IsPostBack)
            {
                LoadLeaveTypes();
            }
        }

        private void LoadLeaveTypes()
        {

            SqlCommand cmd = new SqlCommand(
                "SELECT LeaveTypeId, LeaveType FROM MasterLeaveTypes",
                con);

            //con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            ddlLeaveType.DataSource = dr;
            ddlLeaveType.DataTextField = "LeaveType";
            ddlLeaveType.DataValueField = "LeaveTypeId";
            ddlLeaveType.DataBind();

            ddlLeaveType.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select --", "0"));

        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            try
            {
                //if (Session["UserId"] == null)
                //{
                //    lblMsg.Text = "Session expired. Please login again.";
                //    return;
                //}
                int userId = 37;
                // int userId = Convert.ToInt32(Session["UserId"]);
                int leaveTypeId = Convert.ToInt32(ddlLeaveType.SelectedValue);

                DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
                DateTime endDate = Convert.ToDateTime(txtEndDate.Text);

                int numberOfDays = (endDate - startDate).Days + 1;

                if (numberOfDays <= 0)
                {
                    lblMsg.Text = "End Date must be greater than Start Date";
                    return;
                }


                SqlCommand cmd = new SqlCommand("sp_ApplyLeave", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@LeaveTypeId", leaveTypeId);
                cmd.Parameters.AddWithValue("@StartDate", startDate);
                cmd.Parameters.AddWithValue("@EndDate", endDate);
                cmd.Parameters.AddWithValue("@NumberOfDays", numberOfDays);
                cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
                cmd.Parameters.AddWithValue("@Status", "Pending");

                // con.Open();
                cmd.ExecuteNonQuery();


                lblMsg.CssClass = "text-success";
                lblMsg.Text = "Leave applied successfully!";

                ClearForm();
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }


        private void ClearForm()
        {
            ddlLeaveType.SelectedIndex = 0;
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            txtReason.Text = "";
        }
    }
}