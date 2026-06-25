using HRMS_Team4.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class MasterPayrollDeductionType : System.Web.UI.Page

    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                DeductionType_ReadAll();
                RefreshForm();
            }
        }

        protected void btnAddDeductionType_Click(object sender, EventArgs e)
        {
            DeductionTypeDTO obj = new DeductionTypeDTO()
            {
                DeductionsName = TextBox1.Text.Trim()
            };

            if (string.IsNullOrEmpty(obj.DeductionsName))
            {
                ShowToast("Please enter deduction type name", "warning");
                return;
            }

            if (string.IsNullOrEmpty(hfDeductionTypeId.Value))
            {
                DeductionType_Create(obj);
                ShowToast("Deduction Type created successfully", "success");
            }
            else
            {
                obj.DeductionTypeId = Convert.ToInt32(hfDeductionTypeId.Value);
                DeductionType_Update(obj);
                ShowToast("Deduction Type updated successfully", "success");
            }

            RefreshForm();
            DeductionType_ReadAll();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "closeModal",
                "var modal = bootstrap.Modal.getInstance(document.getElementById('deductionTypeModal')); if(modal){ modal.hide(); }", true);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            DeductionTypeDTO d = DeductionType_ReadById(id);

            if (d != null)
            {
                hfDeductionTypeId.Value = d.DeductionTypeId.ToString();
                TextBox1.Text = d.DeductionsName;

                btnAddDeductionType.Text = "Update Deduction Type";
                Label1.Text = "Update Deduction Type";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal",
                    "var myModal = new bootstrap.Modal(document.getElementById('deductionTypeModal')); myModal.show();", true);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            DeductionType_Delete(id);

            ShowToast("Deduction Type deleted successfully", "success");
            DeductionType_ReadAll();
        }

        public void RefreshForm()
        {
            hfDeductionTypeId.Value = "";
            TextBox1.Text = "";

            btnAddDeductionType.Text = "Add Deduction Type";
            Label1.Text = "Add Deduction Type";
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

        // Database Functions

        public void DeductionType_Create(DeductionTypeDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_DeductionType_Create", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DeductionsName", d.DeductionsName);

            cmd.ExecuteNonQuery();
        }

        public void DeductionType_Update(DeductionTypeDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_DeductionType_Update", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DeductionTypeId", d.DeductionTypeId);
            cmd.Parameters.AddWithValue("@DeductionsName", d.DeductionsName);

            cmd.ExecuteNonQuery();
        }

        public void DeductionType_Delete(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_DeductionType_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DeductionTypeId", id);

            cmd.ExecuteNonQuery();
        }

        public void DeductionType_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_DeductionType_ReadAll", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            rptDeductionType.DataSource = ds.Tables[0];
            rptDeductionType.DataBind();
        }

        public DeductionTypeDTO DeductionType_ReadById(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_DeductionType_ReadById", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DeductionTypeId", id);

            SqlDataReader rdr = cmd.ExecuteReader();

            DeductionTypeDTO d = null;

            if (rdr.Read())
            {
                d = new DeductionTypeDTO()
                {
                    DeductionTypeId = Convert.ToInt32(rdr["DeductionTypeId"]),
                    DeductionsName = rdr["DeductionsName"].ToString()
                };
            }

            rdr.Close();
            return d;
        }
    }
}