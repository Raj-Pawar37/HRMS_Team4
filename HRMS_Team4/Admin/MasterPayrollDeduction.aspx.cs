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
    public partial class MasterPayrollDeduction : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                BindDeductionType();
                BindDepartment();
                BindDesignation();
                Deduction_ReadAll();
                RefreshForm();
            }
        }

        protected void btnAddDeduction_Click(object sender, EventArgs e)
        {

            DeductionDTO obj = new DeductionDTO()
            {
                DeductionTypeId = Convert.ToInt32(ddlDeductionType.SelectedValue),
                DeductionPercentage = Convert.ToDecimal(txtDeductionPercentage.Text.Trim()),
                DepartmentId = Convert.ToInt32(ddlDepartment.SelectedValue),
                DesignationId = Convert.ToInt32(ddlDesignation.SelectedValue)
            };

            if (string.IsNullOrEmpty(hfDeductionId.Value))
            {
                obj.CreatedBy = "admin@gmail.com";
                Deduction_Create(obj);
                ShowToast("Deduction created successfully", "success");
            }
            else
            {
                obj.DeductionId = Convert.ToInt32(hfDeductionId.Value);
                obj.ModifiedBy = "admin@gmail.com";
                Deduction_Update(obj);
                ShowToast("Deduction updated successfully", "success");
            }

            RefreshForm();
            Deduction_ReadAll();

            
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            DeductionDTO d = Deduction_ReadById(id);

            if (d != null)
            {
                hfDeductionId.Value = d.DeductionId.ToString();
                ddlDeductionType.SelectedValue = d.DeductionTypeId.ToString();
                txtDeductionPercentage.Text = d.DeductionPercentage.ToString();
                ddlDepartment.SelectedValue = d.DepartmentId.ToString();
                ddlDesignation.SelectedValue = d.DesignationId.ToString();

                btnAddDeduction.Text = "Update Deduction";
                Label1.Text = "Update Deduction";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal",
                    "var myModal = new bootstrap.Modal(document.getElementById('deductionModal')); myModal.show();", true);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            Deduction_Delete(id);

            ShowToast("Deduction deleted successfully", "success");
            Deduction_ReadAll();
        }

        public void RefreshForm()
        {
            hfDeductionId.Value = "";
            ddlDeductionType.SelectedValue = "0";
            ddlDepartment.SelectedValue = "0";
            ddlDesignation.SelectedValue = "0";
            txtDeductionPercentage.Text = "";

            btnAddDeduction.Text = "Add Deduction";
            Label1.Text = "Add Deduction";
        }

        public void ShowToast(string message, string type)
        {
            string script = $@"
                setTimeout(function() {{
                    toastr.{type}('{message}');
                }}, 300);
            ";

            ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), script, true);
        }



        //Dropdown Binding FUcntions
        public void BindDeductionType()
        {
            SqlCommand cmd = new SqlCommand("SP_DeductionType_ReadAll", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ada.Fill(dt);

            ddlDeductionType.DataSource = dt;
            ddlDeductionType.DataTextField = "DeductionsName";
            ddlDeductionType.DataValueField = "DeductionTypeId";
            ddlDeductionType.DataBind();

            ddlDeductionType.Items.Insert(0, new ListItem("Select Deduction Type", "0"));
        }

        public void BindDepartment()
        {
            SqlCommand cmd = new SqlCommand("SP_Departments_ReadAll", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ada.Fill(dt);

            ddlDepartment.DataSource = dt;
            ddlDepartment.DataTextField = "Name";
            ddlDepartment.DataValueField = "DepartmentId";
            ddlDepartment.DataBind();

            ddlDepartment.Items.Insert(0, new ListItem("Select Department", "0"));
        }

        public void BindDesignation()
        {
            SqlCommand cmd = new SqlCommand("SP_Designations_ReadAll", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ada.Fill(dt);

            ddlDesignation.DataSource = dt;
            ddlDesignation.DataTextField = "DesignationName";
            ddlDesignation.DataValueField = "DesignationId";
            ddlDesignation.DataBind();

            ddlDesignation.Items.Insert(0, new ListItem("Select Designation", "0"));
        }



        //DataBase FUcntions

        public void Deduction_Create(DeductionDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_Deduction_Create", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DeductionTypeId", d.DeductionTypeId);
            cmd.Parameters.AddWithValue("@DepartmentId", d.DepartmentId);
            cmd.Parameters.AddWithValue("@DesignationId", d.DesignationId);
            cmd.Parameters.AddWithValue("@DeductionPercentage", d.DeductionPercentage);
            cmd.Parameters.AddWithValue("@CreatedBy", d.CreatedBy);

            cmd.ExecuteNonQuery();
        }

        public void Deduction_Update(DeductionDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_Deduction_Update", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DeductionId", d.DeductionId);
            cmd.Parameters.AddWithValue("@DeductionTypeId", d.DeductionTypeId);
            cmd.Parameters.AddWithValue("@DepartmentId", d.DepartmentId);
            cmd.Parameters.AddWithValue("@DesignationId", d.DesignationId);
            cmd.Parameters.AddWithValue("@DeductionPercentage", d.DeductionPercentage);
            cmd.Parameters.AddWithValue("@ModifiedBy", d.ModifiedBy);

            cmd.ExecuteNonQuery();
        }

        public void Deduction_Delete(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_Deduction_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DeductionId", id);

            cmd.ExecuteNonQuery();
        }

        public void Deduction_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_Deduction_ReadAll", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            rptDeduction.DataSource = ds.Tables[0];
            rptDeduction.DataBind();
        }

        public DeductionDTO Deduction_ReadById(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_Deduction_ReadById", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DeductionId", id);

            SqlDataReader rdr = cmd.ExecuteReader();

            DeductionDTO d = null;

            if (rdr.Read())
            {
                d = new DeductionDTO()
                {
                    DeductionId = Convert.ToInt32(rdr["DeductionId"]),
                    DeductionTypeId = Convert.ToInt32(rdr["DeductionTypeId"]),
                    DepartmentId = Convert.ToInt32(rdr["DepartmentId"]),
                    DesignationId = Convert.ToInt32(rdr["DesignationId"]),
                    DeductionPercentage = Convert.ToDecimal(rdr["DeductionPercentage"])
                };
            }

            rdr.Close();
            return d;
        }
    }
}