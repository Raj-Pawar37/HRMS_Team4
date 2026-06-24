using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class AddLeave : System.Web.UI.Page
    {
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
             con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString);
            con.Open();
            if (!IsPostBack)
            {
                BindDepartment();
                BindLeaveType();
            }
        }

        private void BindDepartment()
        {
            

            SqlDataAdapter da = new SqlDataAdapter(
    "SELECT DepartmentId, Name FROM Departments ", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataValueField = "DepartmentId";
            DropDownList1.DataBind();

            DropDownList1.Items.Insert(0, new ListItem("Select Department", "0"));
        }

        private void BindLeaveType()
        {
        
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT LeaveTypeId, LeaveType FROM MasterLeaveTypes", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            DropDownList2.DataSource = dt;
            DropDownList2.DataTextField = "LeaveType";
            DropDownList2.DataValueField = "LeaveTypeId";
            DropDownList2.DataBind();

            DropDownList2.Items.Insert(0, new ListItem("Select Leave Type", "0"));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int departmentId = int.Parse(DropDownList1.SelectedValue);
                int leaveTypeId = int.Parse(DropDownList2.SelectedValue);
                int leavesCount = int.Parse(TextBox1.Text);

                SqlCommand cmd = new SqlCommand(
                    "EXEC sp_DepartmentLeaves_Insert " +
                    departmentId + "," +
                    leaveTypeId + "," +
                    leavesCount + ",'Active'", con);               
                    cmd.ExecuteNonQuery();


                    DropDownList1.SelectedIndex = 0;
                    DropDownList2.SelectedIndex = 0;
                    TextBox1.Text = "";

                    Response.Write("<script>alert('Leave allocated successfully');</script>");
            }
            catch (Exception ex)
            {
                
                Response.Write("<script>alert('" + ex.Message.Replace("'", "") + "');</script>");
            }
        }

    }
}