using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class FetchAdminDocName : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDocumentList();
            }
        }

        private void BindDocumentList()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_addAdminDocNames_Get", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        rptAdminDocs.DataSource = dt;
                        rptAdminDocs.DataBind();
                    }
                }
            }
        }

        protected void rptAdminDocs_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteDoc")
            {
                int docId = Convert.ToInt32(e.CommandArgument);
                DeleteDocument(docId);
                BindDocumentList();
            }
        }

        private void DeleteDocument(int docId)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_addAdminDocNames_Delete", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", docId);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Admin Document Name deleted successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}