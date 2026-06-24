
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
    public partial class MasterPayroll : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {


            con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
            con.Open();
            if (!IsPostBack)
            {

                LoadGrid();
            }
        }

        private void LoadGrid()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("sp_GetEarningType", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvEarningType.DataSource = dt;
                gvEarningType.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(
                    "EXEC sp_InsertEarningType '" + txtEarningName.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();

                LoadGrid();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void gvEarningType_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditRow")
            {
                LoadSingleRecord(id);
            }
            else if (e.CommandName == "DeleteRow")
            {
                DeleteRecord(id);
            }
        }

        private void LoadSingleRecord(int id)
        {
            SqlCommand cmd = new SqlCommand(
                "EXEC sp_GetEarningTypeById " + id, con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                hdnId.Value = dt.Rows[0]["EarnTypeId"].ToString();
                txtEditEarningName.Text = dt.Rows[0]["EarningName"].ToString();

                ScriptManager.RegisterStartupScript(this, this.GetType(),
     "Popup",
     "document.getElementById('editearningtype').classList.add('show'); document.getElementById('editearningtype').style.display='block';",
     true);
            }
        }

        private void DeleteRecord(int id)
        {
            SqlCommand cmd = new SqlCommand(
                "EXEC sp_DeleteEarningType " + id, con);


            cmd.ExecuteNonQuery();


            LoadGrid();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand(
                "EXEC sp_UpdateEarningType " +
                hdnId.Value + ", '" +
                txtEditEarningName.Text.Trim() + "'", con);

            cmd.ExecuteNonQuery();


            LoadGrid();
        }
    }
}