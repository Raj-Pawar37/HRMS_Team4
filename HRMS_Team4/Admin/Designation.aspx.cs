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
    public partial class Designation : System.Web.UI.Page
    {

        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                Designation_ReadAll();
                Department_ReadAll();
            }
        }


        //Events Handlement 
        protected void btnAddDesignation_Click(object sender, EventArgs e)
        {


            DesignationDTO obj = new DesignationDTO()
            {
                Name = txtDesignationName.Text,
                DepartmentId = int.Parse(ddlDepartment.SelectedValue),
                Status = ddlStatus.SelectedValue
            };

            if (hfDesignationId.Value == "")
            {
                Designation_Create(obj);
                ShowToast("Designation created successfully", "success");
            }
            else
            {
                obj.DesignationId = int.Parse(hfDesignationId.Value);
                Designation_Update(obj);
                ShowToast("Designation updated successfully", "success");
            }

            RefreshForm();
            Designation_ReadAll();


        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument);

            DesignationDTO d = Designation_ReadById(id);

            hfDesignationId.Value = d.DesignationId.ToString();
            txtDesignationName.Text = d.Name;
            ddlStatus.SelectedValue = d.Status;
            ddlDepartment.SelectedValue = d.DepartmentId.ToString();

            btnAddDesignation.Text = "Update Designation";
            modelHeader.Text = "Update Designation";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal",
            "var myModal = new bootstrap.Modal(document.getElementById('DesignationModal')); myModal.show();", true);

        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            Designation_Delete(id);

            ShowToast("Designation deleted successfully", "success");
            Designation_ReadAll();
        }




        //Cleanup Function
        public void RefreshForm()
        {
            hfDesignationId.Value = "";
            txtDesignationName.Text = "";
            ddlStatus.SelectedIndex = 0;
            ddlDepartment.SelectedIndex = 0;

            btnAddDesignation.Text = "Add Designation";
            modelHeader.Text = "Add Designation";
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
            Designation_ReadAll();
        }











        //Database Functions 

        public void Designation_Create(DesignationDTO d)
        {
            string q = "SP_Designations_Create";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Name", d.Name);
            cmd.Parameters.AddWithValue("@DepartmentId", d.DepartmentId);
            cmd.Parameters.AddWithValue("@Status", d.Status);

            cmd.ExecuteNonQuery();
            Designation_ReadAll();
        }

        public void Designation_Update(DesignationDTO d)
        {
            string q = "SP_Designations_Update";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DesignationId", d.DesignationId);
            cmd.Parameters.AddWithValue("@Name", d.Name);
            cmd.Parameters.AddWithValue("@DepartmentId", d.DepartmentId);
            cmd.Parameters.AddWithValue("@Status", d.Status);

            cmd.ExecuteNonQuery();
            Designation_ReadAll();
        }

        public void Designation_Delete(int id)
        {
            string q = "SP_Designations_Delete";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DesignationId", id);
            cmd.ExecuteNonQuery();

            Designation_ReadAll();
        }

        public void Designation_ReadAll()
        {
            string status = (string.IsNullOrEmpty(DropDownList1.SelectedValue) || DropDownList1.SelectedValue == "select")
                ? null
                : DropDownList1.SelectedValue;


            SqlCommand cmd = new SqlCommand("SP_Designations_ReadAllPaginated", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Status", (object)status ?? DBNull.Value);

            SqlDataAdapter ada = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            ada.Fill(ds);

            rptDesignations.DataSource = ds.Tables[0];
            rptDesignations.DataBind();
        }


        public DesignationDTO Designation_ReadById(int id)
        {
            string q = "SP_Designations_ReadById";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DesignationId", id);

            SqlDataReader rdr = cmd.ExecuteReader();

            DesignationDTO d = new DesignationDTO();

            if (rdr.Read())
            {
                d.DesignationId = Convert.ToInt32(rdr["DesignationId"]);
                d.Name = rdr["Name"].ToString();
                d.Status = rdr["Status"].ToString();
                d.DepartmentId = int.Parse(rdr["DepartmentId"].ToString());
            }

            rdr.Close();

            return d;
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


    }
}