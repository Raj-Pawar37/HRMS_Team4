using HRMS_Team4.Models;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class MasterPayrollEarningType : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                EarningType_ReadAll();
                RefreshForm();
            }
        }

        protected void btnAddEarningType_Click(object sender, EventArgs e)
        {
            EarningTypeDTO obj = new EarningTypeDTO()
            {
                EarningName = TextBox1.Text.Trim()
            };

            if (string.IsNullOrEmpty(obj.EarningName))
            {
                ShowToast("Please enter earning type name", "warning");
                return;
            }

            if (string.IsNullOrEmpty(hfEarntypeId.Value))
            {
                EarningType_Create(obj);
                ShowToast("Earning Type created successfully", "success");
            }
            else
            {
                obj.EarntypeId = Convert.ToInt32(hfEarntypeId.Value);
                EarningType_Update(obj);
                ShowToast("Earning Type updated successfully", "success");
            }

            RefreshForm();
            EarningType_ReadAll();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "closeModal",
                "var modal = bootstrap.Modal.getInstance(document.getElementById('earningTypeModal')); if(modal){ modal.hide(); }", true);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            EarningTypeDTO d = EarningType_ReadById(id);

            if (d != null)
            {
                hfEarntypeId.Value = d.EarntypeId.ToString();
                TextBox1.Text = d.EarningName;

                btnAddEarningType.Text = "Update Earning Type";
                Label1.Text = "Update Earning Type";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal",
                    "var myModal = new bootstrap.Modal(document.getElementById('earningTypeModal')); myModal.show();", true);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            EarningType_Delete(id);

            ShowToast("Earning Type deleted successfully", "success");
            EarningType_ReadAll();
        }

        public void RefreshForm()
        {
            hfEarntypeId.Value = "";
            TextBox1.Text = "";

            btnAddEarningType.Text = "Add Earning Type";
            Label1.Text = "Add Earning Type";
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






        //Database Functions
        public void EarningType_Create(EarningTypeDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_EarningType_Create", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@EarningName", d.EarningName);

            cmd.ExecuteNonQuery();
        }

        public void EarningType_Update(EarningTypeDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_EarningType_Update", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@EarntypeId", d.EarntypeId);
            cmd.Parameters.AddWithValue("@EarningName", d.EarningName);

            cmd.ExecuteNonQuery();
        }

        public void EarningType_Delete(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_EarningType_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@EarntypeId", id);

            cmd.ExecuteNonQuery();
        }

        public void EarningType_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_EarningType_ReadAll", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            rptEarningType.DataSource = ds.Tables[0];
            rptEarningType.DataBind();
        }

        public EarningTypeDTO EarningType_ReadById(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_EarningType_ReadById", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@EarntypeId", id);

            SqlDataReader rdr = cmd.ExecuteReader();

            EarningTypeDTO d = null;

            if (rdr.Read())
            {
                d = new EarningTypeDTO()
                {
                    EarntypeId = Convert.ToInt32(rdr["EarntypeId"]),
                    EarningName = rdr["EarningName"].ToString()
                };
            }

            rdr.Close();
            return d;
        }
    }
}