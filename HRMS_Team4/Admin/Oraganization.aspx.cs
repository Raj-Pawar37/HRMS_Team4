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
using HRMS_Team4.Models;

namespace HRMS_Team4.Admin
{
    public partial class Oraganization : System.Web.UI.Page
    {

        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                Organization_ReadAll();
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string logoPath = "";

            if (fuOrganizationLogo.HasFile)
            {
                string fileName = DateTime.Now.Ticks + "_" + fuOrganizationLogo.FileName;
                logoPath = "/Uploads/logos/" + fileName;

                fuOrganizationLogo.SaveAs(Server.MapPath("~/Uploads/logos/" + fileName));
            }
            else
            {
                logoPath = hfLogo.Value;
            }

            OrganizationDTO obj = new OrganizationDTO()
            {
                OrganizationName = txtOrganizationName.Text,
                OrganizationDescription = txtOrganizationDescription.Text,
                OrganizationAddress = txtOrganizationAddress.Text,
                OrganizationPhone = txtOrganizationPhone.Text,
                OrganizationEmail = txtOrganizationEmail.Text,
                OrganizationLogo = logoPath
            };

            if (hfOrganizationId.Value == "")
            {
                Organization_Create(obj);
                ShowToast("Organization created successfully", "success");
            }
            else
            {
                obj.OrganizationId = int.Parse(hfOrganizationId.Value);
                Organization_Update(obj);
                ShowToast("Organization updated successfully", "success");
            }

            RefreshForm();
            Organization_ReadAll();
            Response.Redirect(Request.RawUrl);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument);

            OrganizationDTO d = Organization_ReadById(id);

            hfOrganizationId.Value = d.OrganizationId.ToString();
            txtOrganizationName.Text = d.OrganizationName;
            txtOrganizationDescription.Text = d.OrganizationDescription;
            txtOrganizationAddress.Text = d.OrganizationAddress;
            txtOrganizationPhone.Text = d.OrganizationPhone;
            txtOrganizationEmail.Text = d.OrganizationEmail;
            hfLogo.Value = d.OrganizationLogo;

            btnSave.Text = "Update";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal",
                "var myModal = new bootstrap.Modal(document.getElementById('addOrganizationModal')); myModal.show();", true);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            Organization_Delete(id);
            ShowToast("Organization deleted successfully", "success");
            Organization_ReadAll();
        }

        public void RefreshForm()
        {
            hfOrganizationId.Value = "";
            hfLogo.Value = "";

            txtOrganizationName.Text = "";
            txtOrganizationDescription.Text = "";
            txtOrganizationAddress.Text = "";
            txtOrganizationPhone.Text = "";
            txtOrganizationEmail.Text = "";

            btnSave.Text = "Save";
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



























        //Database Function 
        public void Organization_Create(OrganizationDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_Organization_Create", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@OrganizationName", d.OrganizationName);
            cmd.Parameters.AddWithValue("@OrganizationDescription", d.OrganizationDescription);
            cmd.Parameters.AddWithValue("@OrganizationAddress", d.OrganizationAddress);
            cmd.Parameters.AddWithValue("@OrganizationPhone", d.OrganizationPhone);
            cmd.Parameters.AddWithValue("@OrganizationEmail", d.OrganizationEmail);
            cmd.Parameters.AddWithValue("@OrganizationLogo", d.OrganizationLogo);

            cmd.ExecuteNonQuery();
            Organization_ReadAll();
        }

        public void Organization_Update(OrganizationDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_Organization_Update", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@OrganizationId", d.OrganizationId);
            cmd.Parameters.AddWithValue("@OrganizationName", d.OrganizationName);
            cmd.Parameters.AddWithValue("@OrganizationDescription", d.OrganizationDescription);
            cmd.Parameters.AddWithValue("@OrganizationAddress", d.OrganizationAddress);
            cmd.Parameters.AddWithValue("@OrganizationPhone", d.OrganizationPhone);
            cmd.Parameters.AddWithValue("@OrganizationEmail", d.OrganizationEmail);
            cmd.Parameters.AddWithValue("@OrganizationLogo", d.OrganizationLogo);

            cmd.ExecuteNonQuery();
            Organization_ReadAll();
        }


        public void Organization_Delete(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_Organization_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@OrganizationId", id);

            cmd.ExecuteNonQuery();
            Organization_ReadAll();
            Response.Redirect(Request.RawUrl);
        }


        public void Organization_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_Organization_ReadAll", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter ada = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            ada.Fill(ds);

            rptOrganizations.DataSource = ds.Tables[0];
            rptOrganizations.DataBind();
        }


        public OrganizationDTO Organization_ReadById(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_Organization_ReadById", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@OrganizationId", id);

            SqlDataReader rdr = cmd.ExecuteReader();

            OrganizationDTO d = new OrganizationDTO();

            if (rdr.Read())
            {
                d.OrganizationId = Convert.ToInt32(rdr["OrganizationId"]);
                d.OrganizationName = rdr["OrganizationName"].ToString();
                d.OrganizationDescription = rdr["OrganizationDescription"].ToString();
                d.OrganizationAddress = rdr["OrganizationAddress"].ToString();
                d.OrganizationPhone = rdr["OrganizationPhone"].ToString();
                d.OrganizationEmail = rdr["OrganizationEmail"].ToString();
                d.OrganizationLogo = rdr["OrganizationLogo"].ToString();
            }

            rdr.Close();

            return d;
        }




    }
}