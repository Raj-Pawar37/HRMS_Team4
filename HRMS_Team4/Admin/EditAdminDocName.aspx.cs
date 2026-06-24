using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HRMS_Team4.Admin
{
    public partial class EditAdminDocName : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    LoadDocumentData(Request.QueryString["id"].ToString());
                }
                else
                {
                    Response.Redirect("FetchAdminDocName.aspx");
                }
            }
        }

        private void LoadDocumentData(string id)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_addAdminDocNames_GetById", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(id));

                    try
                    {
                        con.Open();
                        SqlDataReader sdr = cmd.ExecuteReader();

                        if (sdr.Read())
                        {
                            txtDocName.Text = sdr["DocName"].ToString();
                        }
                        else
                        {
                            lblMessage.Text = "Error: Document not found.";
                            lblMessage.CssClass = "d-block mb-3 text-danger fw-bold";
                            btnUpdate.Enabled = false;
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Database Error: " + ex.Message;
                        lblMessage.CssClass = "d-block mb-3 text-danger fw-bold";
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("usp_addAdminDocNames_Update", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@DocName", txtDocName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(Request.QueryString["id"]));

                        try
                        {
                            con.Open();
                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                Response.Redirect("FetchAdminDocName.aspx");
                            }
                            else
                            {
                                lblMessage.Text = "Failed to update record.";
                                lblMessage.CssClass = "d-block mb-3 text-warning fw-bold";
                            }
                        }
                        catch (Exception ex)
                        {
                            lblMessage.Text = "SQL Error: " + ex.Message;
                            lblMessage.CssClass = "d-block mb-3 text-danger fw-bold";
                        }
                    }
                }
            }
        }
    }
}