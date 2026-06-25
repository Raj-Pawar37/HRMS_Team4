using HRMS_Team4.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class MasterPayrollEarning : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                BindEarningType();
                BindDepartment();
                BindDesignation();
                Earning_ReadAll();
                RefreshForm();
            }
        }




        //event Fucntion

        protected void btnAddEarning_Click(object sender, EventArgs e)
        {

            EarningDTO obj = new EarningDTO()
            {
                EarntypeId = Convert.ToInt32(ddlEarningType.SelectedValue),
                EarningsPercentage = Convert.ToDecimal(txtEarningsPercentage.Text.Trim()),
                DepartmentId = Convert.ToInt32(ddlDepartment.SelectedValue),
                DesignationId = Convert.ToInt32(ddlDesignation.SelectedValue)
            };

            if (string.IsNullOrEmpty(hfEarningsId.Value))
            {
                obj.CreatedBy = "admin@gmail.com";
                Earning_Create(obj);
                ShowToast("Earning created successfully", "success");
            }
            else
            {
                obj.EarningsId = Convert.ToInt32(hfEarningsId.Value);
                obj.ModifiedBy = "admin@gmail.com";
                Earning_Update(obj);
                ShowToast("Earning updated successfully", "success");
            }

            RefreshForm();
            Earning_ReadAll();

            
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            EarningDTO d = Earning_ReadById(id);

            if (d != null)
            {
                hfEarningsId.Value = d.EarningsId.ToString();
                ddlEarningType.SelectedValue = d.EarntypeId.ToString();
                txtEarningsPercentage.Text = d.EarningsPercentage.ToString();
                ddlDepartment.SelectedValue = d.DepartmentId.ToString();
                ddlDesignation.SelectedValue = d.DesignationId.ToString();

                btnAddEarning.Text = "Update Earning";
                Label1.Text = "Update Earning";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal",
                    "var myModal = new bootstrap.Modal(document.getElementById('earningModal')); myModal.show();", true);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            Earning_Delete(id);

            ShowToast("Earning deleted successfully", "success");
            Earning_ReadAll();
        }





        //Clean Up Function

        public void RefreshForm()
        {
            hfEarningsId.Value = "";
            ddlEarningType.SelectedValue = "0";
            ddlDepartment.SelectedValue = "0";
            ddlDesignation.SelectedValue = "0";
            txtEarningsPercentage.Text = "";

            btnAddEarning.Text = "Add Earning";
            Label1.Text = "Add Earning";
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

















        //Dropdown Fucntions 

        public void BindEarningType()
        {
            SqlCommand cmd = new SqlCommand("SP_EarningType_ReadAll", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ada.Fill(dt);

            ddlEarningType.DataSource = dt;
            ddlEarningType.DataTextField = "EarningName";
            ddlEarningType.DataValueField = "EarntypeId";
            ddlEarningType.DataBind();

            ddlEarningType.Items.Insert(0, new ListItem("Select Earning Type", "0"));
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











        // Database Functions

        public void Earning_Create(EarningDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_Earning_Create", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@EarntypeId", d.EarntypeId);
            cmd.Parameters.AddWithValue("@EarningsPercentage", d.EarningsPercentage);
            cmd.Parameters.AddWithValue("@DepartmentId", d.DepartmentId);
            cmd.Parameters.AddWithValue("@DesignationId", d.DesignationId);
            cmd.Parameters.AddWithValue("@CreatedBy", d.CreatedBy);

            cmd.ExecuteNonQuery();
        }

        public void Earning_Update(EarningDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_Earning_Update", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@EarningsId", d.EarningsId);
            cmd.Parameters.AddWithValue("@EarntypeId", d.EarntypeId);
            cmd.Parameters.AddWithValue("@EarningsPercentage", d.EarningsPercentage);
            cmd.Parameters.AddWithValue("@DepartmentId", d.DepartmentId);
            cmd.Parameters.AddWithValue("@DesignationId", d.DesignationId);
            cmd.Parameters.AddWithValue("@ModifiedBy", d.ModifiedBy);

            cmd.ExecuteNonQuery();
        }

        public void Earning_Delete(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_Earning_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@EarningsId", id);

            cmd.ExecuteNonQuery();
        }

        public void Earning_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_Earning_ReadAll", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            rptEarning.DataSource = ds.Tables[0];
            rptEarning.DataBind();
        }

        public EarningDTO Earning_ReadById(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_Earning_ReadById", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@EarningsId", id);

            SqlDataReader rdr = cmd.ExecuteReader();

            EarningDTO d = null;

            if (rdr.Read())
            {
                d = new EarningDTO()
                {
                    EarningsId = Convert.ToInt32(rdr["EarningsId"]),
                    EarntypeId = Convert.ToInt32(rdr["EarntypeId"]),
                    EarningsPercentage = Convert.ToDecimal(rdr["EarningsPercentage"]),
                    DepartmentId = Convert.ToInt32(rdr["DepartmentId"]),
                    DesignationId = Convert.ToInt32(rdr["DesignationId"])
                };
            }

            rdr.Close();
            return d;
        }
    }
}