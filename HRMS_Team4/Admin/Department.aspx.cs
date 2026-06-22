using HRMS_Team4.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace HRMS_Team4.Admin
{
    public partial class Department : System.Web.UI.Page
    {

        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                Department_ReadAll();
            }
        }


        //Events Handlement 
        protected void btnAddDepartment_Click(object sender, EventArgs e)
        {


            DepartmentDTO obj = new DepartmentDTO()
            {
                Name = txtDepartmentName.Text,
                Status = ddlStatus.SelectedValue
            };

            if (hfDepartmentId.Value == "")
            {
                Department_Create(obj);
                ShowToast("Department created successfully", "success");
            }
            else
            {
                obj.DepartmentId = int.Parse(hfDepartmentId.Value);
                Department_Update(obj);
                ShowToast("Department updated successfully", "success");
            }

            RefreshForm();
            Department_ReadAll();


        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument);

            DepartmentDTO d = Department_ReadById(id);

            hfDepartmentId.Value = d.DepartmentId.ToString();
            txtDepartmentName.Text = d.Name;
            ddlStatus.SelectedValue = d.Status;

            btnAddDepartment.Text = "Update Department";
            modelHeader.Text = "Update Department";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal",
            "var myModal = new bootstrap.Modal(document.getElementById('departmentModal')); myModal.show();", true);

        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            Department_Delete(id);

            ShowToast("Department deleted successfully", "success");
            Department_ReadAll();
        }




        //Cleanup Function
        public void RefreshForm()
        {
            hfDepartmentId.Value = "";
            txtDepartmentName.Text = "";
            ddlStatus.SelectedIndex = 0;

            btnAddDepartment.Text = "Add Department";
            modelHeader.Text = "Add Department";
        }

        public void ShowToast(string message, string type)
        {
            string script = $@"
                setTimeout(function() {{
                    toastr.{type}('{message}');
                }}, 300);
            ";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "toast", script, true);
        }











        //Database Functions 

        public void Department_Create(DepartmentDTO d)
        {
            string q = "SP_Departments_Create";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Name", d.Name);
            cmd.Parameters.AddWithValue("@Status", d.Status);

            cmd.ExecuteNonQuery();
            Department_ReadAll();
        }

        public void Department_Update(DepartmentDTO d)
        {
            string q = "SP_Departments_Update";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DepartmentId", d.DepartmentId);
            cmd.Parameters.AddWithValue("@Name", d.Name);
            cmd.Parameters.AddWithValue("@Status", d.Status);

            cmd.ExecuteNonQuery();
            Department_ReadAll();
        }

        public void Department_Delete(int id)
        {
            string q = "SP_Departments_Delete";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DepartmentId", id);
            cmd.ExecuteNonQuery();

            Department_ReadAll();
        }

        public void Department_ReadAll()
        {
            string status = (string.IsNullOrEmpty(DropDownList1.SelectedValue) || DropDownList1.SelectedValue == "select")
                ? null
                : DropDownList1.SelectedValue;


            SqlCommand cmd = new SqlCommand("SP_Departments_ReadAllPaginated", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Status", (object)status ?? DBNull.Value);

            SqlDataAdapter ada = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            ada.Fill(ds);

            rptDepartments.DataSource = ds.Tables[0];
            rptDepartments.DataBind();
        }


        public DepartmentDTO Department_ReadById(int id)
        {
            string q = "SP_Departments_ReadById";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DepartmentId", id);

            SqlDataReader rdr = cmd.ExecuteReader();

            DepartmentDTO d = new DepartmentDTO();

            if (rdr.Read())
            {
                d.DepartmentId = Convert.ToInt32(rdr["DepartmentId"]);
                d.Name = rdr["Name"].ToString();
                d.Status = rdr["Status"].ToString();
            }

            rdr.Close();

            return d;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Department_ReadAll();
        }


    }
}