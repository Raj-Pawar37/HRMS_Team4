using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class fetchempdoc : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDocumentList();
            }
        }

        // Fetch data from SQL and bind it to our Repeater
        private void BindDocumentList()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_AdminDocuments_Get", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        rptDocs.DataSource = dt;
                        rptDocs.DataBind();
                    }
                }
            }
        }

        // Handle the Delete Button Click
        protected void rptDocs_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteDoc")
            {
                int docId = Convert.ToInt32(e.CommandArgument);
                DeleteDocument(docId);

                // Refresh the list immediately after deleting
                BindDocumentList();
            }
        }

        private void DeleteDocument(int docId)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_AdminDocuments_Delete", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminDocId", docId);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();

                        lblMessage.Text = "Document record deleted successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error deleting document: " + ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}