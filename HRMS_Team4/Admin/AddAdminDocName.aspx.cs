using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HRMS_Team4.Admin
{
    public partial class AddAdminDocName : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    // Calls your Admin Document Insert proc
                    using (SqlCommand cmd = new SqlCommand("usp_addAdminDocNames_Insert", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Matches the DocName column in your table
                        cmd.Parameters.AddWithValue("@DocName", txtDocName.Text.Trim());

                        try
                        {
                            con.Open();
                            cmd.ExecuteNonQuery();

                            lblMessage.Text = "Admin Document Name added successfully!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;

                            // Clear the textbox for the next entry
                            txtDocName.Text = "";
                        }
                        catch (Exception ex)
                        {
                            lblMessage.Text = "Error saving to database: " + ex.Message;
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
        }
    }
}