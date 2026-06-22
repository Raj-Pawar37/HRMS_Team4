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
    public partial class Role : System.Web.UI.Page
    {

        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                Role_ReadAll();
            }
        }


        //Events Handlement 
        protected void btnAddRole_Click(object sender, EventArgs e)
        {


            RoleDTO obj = new RoleDTO()
            {
                RoleName = txtRoleName.Text,
                Status = ddlStatus.SelectedValue
            };

            if (hfRoleId.Value == "")
            {
                Role_Create(obj);
                ShowToast("Role created successfully", "success");
            }
            else
            {
                obj.RoleId = int.Parse(hfRoleId.Value);
                Role_Update(obj);
                ShowToast("Role updated successfully", "success");
            }

            RefreshForm();
            Role_ReadAll();


        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument);

            RoleDTO d = Role_ReadById(id);

            hfRoleId.Value = d.RoleId.ToString();
            txtRoleName.Text = d.RoleName;
            ddlStatus.SelectedValue = d.Status;

            btnAddRole.Text = "Update Role";
            modelHeader.Text = "Update Role";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal",
            "var myModal = new bootstrap.Modal(document.getElementById('RoleModal')); myModal.show();", true);

        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            Role_Delete(id);

            ShowToast("Role deleted successfully", "success");
            Role_ReadAll();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Role_ReadAll();
        }


        //Cleanup Function
        public void RefreshForm()
        {
            hfRoleId.Value = "";
            txtRoleName.Text = "";
            ddlStatus.SelectedIndex = 0;

            btnAddRole.Text = "Add Role";
            modelHeader.Text = "Add Role";
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

        public void Role_Create(RoleDTO d)
        {
            string q = "SP_Role_Create";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RoleName", d.RoleName);
            cmd.Parameters.AddWithValue("@Status", d.Status);

            cmd.ExecuteNonQuery();
            Role_ReadAll();
        }

        public void Role_Update(RoleDTO d)
        {
            string q = "SP_Role_Update";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RoleId", d.RoleId);
            cmd.Parameters.AddWithValue("@RoleName", d.RoleName);
            cmd.Parameters.AddWithValue("@Status", d.Status);

            cmd.ExecuteNonQuery();
            Role_ReadAll();
        }

        public void Role_Delete(int id)
        {
            string q = "SP_Role_Delete";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RoleId", id);
            cmd.ExecuteNonQuery();

            Role_ReadAll();
        }

        public void Role_ReadAll()
        {
            string status = (string.IsNullOrEmpty(DropDownList1.SelectedValue) || DropDownList1.SelectedValue == "select")
                ? null
                : DropDownList1.SelectedValue;


            SqlCommand cmd = new SqlCommand("SP_Role_ReadAllPaginated", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Status", (object)status ?? DBNull.Value);

            SqlDataAdapter ada = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            ada.Fill(ds);

            rptRoles.DataSource = ds.Tables[0];
            rptRoles.DataBind();
        }


        public RoleDTO Role_ReadById(int id)
        {
            string q = "SP_Role_ReadById";

            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@RoleId", id);

            SqlDataReader rdr = cmd.ExecuteReader();

            RoleDTO d = new RoleDTO();

            if (rdr.Read())
            {
                d.RoleId = Convert.ToInt32(rdr["RoleId"]);
                d.RoleName = rdr["RoleName"].ToString();
                d.Status = rdr["Status"].ToString();
            }

            rdr.Close();

            return d;
        }




    }
}