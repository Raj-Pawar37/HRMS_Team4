using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class AdminFileUpload : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();
        public string DocTypeOptions { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {


            Page.Form.Enctype = "multipart/form-data";
            if (!IsPostBack)
            {
                BindEmployeeEmails();
                BindDocumentTypes();
            }
        }

        private void BindEmployeeEmails()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetEmailsForDropdown", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ddlEmail.DataSource = dt;
                        ddlEmail.DataTextField = "Email";
                        ddlEmail.DataValueField = "Email";
                        ddlEmail.DataBind();
                    }
                }
            }
            ddlEmail.Items.Insert(0, new ListItem("-- Select Employee Email --", "0"));
        }

        private void BindDocumentTypes()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetAdminDocNamesForDropdown", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();

                    StringBuilder sb = new StringBuilder();
                    sb.Append("<option value=''>-- Select Document Type --</option>");

                    while (sdr.Read())
                    {
                        sb.Append($"<option value='{sdr["DocName"]}'>{sdr["DocName"]}</option>");
                    }

                    DocTypeOptions = sb.ToString();
                    con.Close();
                }
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string selectedEmail = ddlEmail.SelectedValue;
            string[] documentTypes = Request.Form.GetValues("DocumentTypes");
            var uploadedFiles = Request.Files.GetMultiple("Files");
            int successCount = 0;

            try
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    con.Open();
                    for (int i = 0; i < uploadedFiles.Count; i++)
                    {
                        HttpPostedFile file = uploadedFiles[i];

                        if (file != null && file.ContentLength > 0 && documentTypes != null && i < documentTypes.Length)
                        {
                            string specificDocName = documentTypes[i];
                            if (string.IsNullOrEmpty(specificDocName)) continue;

                            string folderPath = Server.MapPath("~/Uploads/");
                            if (!System.IO.Directory.Exists(folderPath))
                            {
                                System.IO.Directory.CreateDirectory(folderPath);
                            }

                            string fileName = DateTime.Now.ToString("yyyyMMddHHmmss_") + System.IO.Path.GetFileName(file.FileName);
                            string savePath = folderPath + fileName;
                            file.SaveAs(savePath);

                            using (SqlCommand cmd = new SqlCommand("usp_AdminDocuments_Insert", con))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@Email", selectedEmail);
                                cmd.Parameters.AddWithValue("@DocName", specificDocName);
                                cmd.Parameters.AddWithValue("@DocFile", "~/Uploads/" + fileName);
                                cmd.ExecuteNonQuery();
                            }
                            successCount++;
                        }
                    }
                }

                if (successCount > 0)
                {
                    lblMessage.Text = $"{successCount} document(s) uploaded successfully!";
                    lblMessage.CssClass = "d-block mb-3 text-success fw-bold";
                }
                else
                {
                    lblMessage.Text = "Failed: Please make sure you selected a file and a document type for each row.";
                    lblMessage.CssClass = "d-block mb-3 text-warning fw-bold";
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