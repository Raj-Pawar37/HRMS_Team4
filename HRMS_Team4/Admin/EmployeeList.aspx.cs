using HRMS_Team4.Models;
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
    public partial class EmployeeList : System.Web.UI.Page
    {
        private readonly string DefaultProfileImage = "uploads/user/man1.jpg";
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                RefreshForm();
                Employee_ReadAll();
                Role_ReadAll();
                Department_ReadAll();
                Designation_ReadAll();
                Manager_ReadAll();
            }
        }


        //Events Handlement 
        protected void btnAddEmployee_Click(object sender, EventArgs e)
        {


            EmployeeDTO obj = new EmployeeDTO()
            {
                FirstName = txtFirstName.Text,
                LastName = txtLastName.Text,
                Email = txtEmail.Text,
                PasswordHash = txtPassword.Text,
                PhoneNumber = txtPhoneNumber.Text,
                RoleId = int.Parse(ddlRole.SelectedValue),
                DepartmentId = string.IsNullOrEmpty(ddlDepartment.SelectedValue) ? (int?)null : int.Parse(ddlDepartment.SelectedValue),
                DesignationId = int.Parse(ddlDesignation.SelectedValue),
                ReportingManager = string.IsNullOrEmpty(ddlManager.SelectedValue) ? (int?)null : int.Parse(ddlManager.SelectedValue),
                DateOfJoining = DateTime.Parse(txtDateOfJoining.Text),
                DateOfBirth = DateTime.Parse(txtDateOfBirth.Text),
                Gender = ddlGender.SelectedValue,
                Address = txtAddress.Text,
                AboutEmployee = txtAboutEmployee.Text,
                Status = ddlStatus.SelectedValue
            };

            if (fuProfilePicture.HasFile)
            {
                string fileName = DateTime.Now.Ticks + "_" + fuProfilePicture.FileName;
                string path = Server.MapPath("~/uploads/user/" + fileName);
                fuProfilePicture.SaveAs(path);

                obj.ProfilePicture = "uploads/user/" + fileName;
            }
            else
            {
                obj.ProfilePicture = hfProfilePicture.Value;
            }


            if (hfUserId.Value == "")
            {
                Employee_Create(obj);
                ShowToast("Employee created successfully", "success");
            }
            else
            {
                obj.UserId = int.Parse(hfUserId.Value);
                Employee_Update(obj);
                ShowToast("Employee updated successfully", "success");
            }


            RefreshForm();
            Employee_ReadAll();


        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument);

            EmployeeDTO d = Employee_ReadById(id);

            hfUserId.Value = d.UserId.ToString();

            txtFirstName.Text = d.FirstName;
            txtLastName.Text = d.LastName;
            txtEmail.Text = d.Email;
            txtPassword.Text = d.PasswordHash;
            txtPhoneNumber.Text = d.PhoneNumber;

            ddlRole.SelectedValue = d.RoleId.ToString();

            if (d.DepartmentId.HasValue)
                ddlDepartment.SelectedValue = d.DepartmentId.Value.ToString();

            ddlDesignation.SelectedValue = d.DesignationId.ToString();

            if (d.ReportingManager.HasValue)
                ddlManager.SelectedValue = d.ReportingManager.Value.ToString();

            txtDateOfJoining.Text = d.DateOfJoining.ToString("yyyy-MM-dd");
            txtDateOfBirth.Text = d.DateOfBirth.ToString("yyyy-MM-dd");

            ddlGender.SelectedValue = d.Gender;
            ddlStatus.SelectedValue = d.Status;

            txtAddress.Text = d.Address;
            txtAboutEmployee.Text = d.AboutEmployee;

            btnAddEmployee.Text = "Update Employee";
            modelHeader.Text = "Update Employee";

            imgProfile.ImageUrl = "~/" + d.ProfilePicture;
            hfProfilePicture.Value = d.ProfilePicture;


            ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal",
            "var myModal = new bootstrap.Modal(document.getElementById('EmployeeModal')); myModal.show();", true);

        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            Employee_Delete(id);

            ShowToast("Employee deleted successfully", "success");
            Employee_ReadAll();
        }




        //Cleanup Function
        public void RefreshForm()
        {
            hfUserId.Value = "";

            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtPhoneNumber.Text = "";
            txtDateOfJoining.Text = "";
            txtDateOfBirth.Text = "";
            txtAddress.Text = "";
            txtAboutEmployee.Text = "";

            ddlRole.SelectedIndex = 0;
            ddlDepartment.SelectedIndex = 0;
            ddlManager.SelectedIndex = 0;
            ddlDesignation.SelectedIndex = 0;
            ddlGender.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;

            btnAddEmployee.Text = "Save";
            modelHeader.Text = "Add New Employee";

            hfProfilePicture.Value = DefaultProfileImage;
            imgProfile.ImageUrl = "~/" + DefaultProfileImage;
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Employee_ReadAll();
        }











        //Database Functions 

        public void Employee_Create(EmployeeDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_User_Create", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FirstName", d.FirstName);
            cmd.Parameters.AddWithValue("@LastName", d.LastName);
            cmd.Parameters.AddWithValue("@Email", d.Email);
            cmd.Parameters.AddWithValue("@PasswordHash", d.PasswordHash);
            cmd.Parameters.AddWithValue("@PhoneNumber", d.PhoneNumber);
            cmd.Parameters.AddWithValue("@RoleId", d.RoleId);
            cmd.Parameters.AddWithValue("@DepartmentId", (object)d.DepartmentId ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@DesignationtId", d.DesignationId);
            cmd.Parameters.AddWithValue("@DateOfJoining", d.DateOfJoining);
            cmd.Parameters.AddWithValue("@DateOfBirth", d.DateOfBirth);
            cmd.Parameters.AddWithValue("@Gender", d.Gender);
            cmd.Parameters.AddWithValue("@Address", d.Address);
            cmd.Parameters.AddWithValue("@AboutEmployee", d.AboutEmployee);
            cmd.Parameters.AddWithValue("@ProfilePicture", (object)d.ProfilePicture ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@ReportingManager", (object)d.ReportingManager ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@Status", d.Status);

            cmd.ExecuteNonQuery();
            Employee_ReadAll();
        }

        public void Employee_Update(EmployeeDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_User_Update", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", d.UserId);
            cmd.Parameters.AddWithValue("@FirstName", d.FirstName);
            cmd.Parameters.AddWithValue("@LastName", d.LastName);
            cmd.Parameters.AddWithValue("@Email", d.Email);
            cmd.Parameters.AddWithValue("@PasswordHash", d.PasswordHash);
            cmd.Parameters.AddWithValue("@PhoneNumber", d.PhoneNumber);
            cmd.Parameters.AddWithValue("@RoleId", d.RoleId);
            cmd.Parameters.AddWithValue("@DepartmentId", (object)d.DepartmentId ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@DesignationtId", d.DesignationId);
            cmd.Parameters.AddWithValue("@DateOfJoining", d.DateOfJoining);
            cmd.Parameters.AddWithValue("@DateOfBirth", d.DateOfBirth);
            cmd.Parameters.AddWithValue("@Gender", d.Gender);
            cmd.Parameters.AddWithValue("@Address", d.Address);
            cmd.Parameters.AddWithValue("@AboutEmployee", d.AboutEmployee);
            cmd.Parameters.AddWithValue("@ProfilePicture", (object)d.ProfilePicture ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@ReportingManager", (object)d.ReportingManager ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@Status", d.Status);

            cmd.ExecuteNonQuery();
            Employee_ReadAll();
        }

        public void Employee_Delete(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_User_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", id);

            cmd.ExecuteNonQuery();
            Employee_ReadAll();
        }

        public void Employee_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_User_ReadAllPaginated", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Status", DBNull.Value);

            SqlDataAdapter ada = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            ada.Fill(ds);

            rptEmployees.DataSource = ds.Tables[0];
            rptEmployees.DataBind();

            User_HeaderInfo();

        }


        public EmployeeDTO Employee_ReadById(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_User_ReadById", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", id);

            SqlDataReader rdr = cmd.ExecuteReader();

            EmployeeDTO d = new EmployeeDTO();

            if (rdr.Read())
            {
                d.UserId = Convert.ToInt32(rdr["UserId"]);
                d.FirstName = rdr["FirstName"].ToString();
                d.LastName = rdr["LastName"].ToString();
                d.Email = rdr["Email"].ToString();
                d.PasswordHash = rdr["PasswordHash"].ToString();
                d.PhoneNumber = rdr["PhoneNumber"].ToString();

                d.RoleId = Convert.ToInt32(rdr["RoleId"]);

                d.DepartmentId = rdr["DepartmentId"] == DBNull.Value ? (int?)null
                    : Convert.ToInt32(rdr["DepartmentId"]);

                d.DesignationId = Convert.ToInt32(rdr["DesignationtId"]);

                d.DateOfJoining = Convert.ToDateTime(rdr["DateOfJoining"]);
                d.DateOfBirth = Convert.ToDateTime(rdr["DateOfBirth"]);

                d.Gender = rdr["Gender"].ToString();
                d.Address = rdr["Address"].ToString();
                d.AboutEmployee = rdr["AboutEmployee"].ToString();
                d.ProfilePicture = rdr["ProfilePicture"].ToString();

                d.ReportingManager = rdr["ReportingManager"] == DBNull.Value ? (int?)null
                    : Convert.ToInt32(rdr["ReportingManager"]);

                d.Status = rdr["Status"].ToString();
            }

            rdr.Close();

            return d;
        }

        public void Role_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_Role_ReadAllPaginated", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Status", "Active");

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            ddlRole.DataSource = ds.Tables[0];
            ddlRole.DataValueField = "RoleId";
            ddlRole.DataTextField = "RoleName";
            ddlRole.DataBind();

            ddlRole.Items.Insert(0, new ListItem("-- Select Role --", ""));
        }

        public void Department_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_Departments_ReadAllPaginated", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Status", "Active");

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            ddlDepartment.DataSource = ds.Tables[0];
            ddlDepartment.DataValueField = "DepartmentId";
            ddlDepartment.DataTextField = "Name";
            ddlDepartment.DataBind();

            ddlDepartment.Items.Insert(0, new ListItem("-- Select Department --", ""));
        }

        public void Designation_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_Designations_ReadAllPaginated", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Status", "Active");

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            ddlDesignation.DataSource = ds.Tables[0];
            ddlDesignation.DataValueField = "DesignationId";
            ddlDesignation.DataTextField = "Name";
            ddlDesignation.DataBind();

            ddlDesignation.Items.Insert(0, new ListItem("-- Select Designation --", ""));
        }


        public void Manager_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_User_ManagerDropDown", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            ddlManager.DataSource = ds.Tables[0];
            ddlManager.DataValueField = "UserId";
            ddlManager.DataTextField = "FullName";
            ddlManager.DataBind();

            ddlManager.Items.Insert(0, new ListItem("-- Select Manager --", ""));
        }

        public void User_HeaderInfo ()
        {
            SqlCommand cmd = new SqlCommand("SP_User_HeaderInfo", conn);

            SqlDataReader rdr = cmd.ExecuteReader();

            if (rdr.Read())
            {
                LblTotalEmployee.Text = rdr["TotalEmployee"].ToString();
                LblActiveEmployee.Text = rdr["ActiveEmployee"].ToString();
                LblInActiveEmployee.Text = rdr["InActiveEmployee"].ToString();
                LblNewJoiners.Text = rdr["NewJoiners"].ToString();
            }
            rdr.Close();

            
        }


    }
}