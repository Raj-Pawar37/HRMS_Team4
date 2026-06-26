using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Manager
{
    public partial class Project : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                LoadTeamMembers();
                LoadManagers();
                LoadProjectGrid();
            }
        }

        private void LoadTeamMembers()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("EXEC sp_user_TeamMember_Fetch", conn);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                cblTeamMembers.DataSource = dr;
                cblTeamMembers.DataTextField = "EmployeeName";
                cblTeamMembers.DataValueField = "UserId";
                cblTeamMembers.DataBind();
            }
        }

        private void LoadManagers()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("EXEC sp_user_Managers_Fetch", conn);
                conn.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Columns.Count > 0)
                    {
                        string actualColumnName = dt.Columns[0].ColumnName;
                        ddlManagerName.DataSource = dt;
                        ddlManagerName.DataTextField = actualColumnName;
                        ddlManagerName.DataValueField = actualColumnName;
                        ddlManagerName.DataBind();
                    }
                }
                ddlManagerName.Items.Insert(0, new ListItem("Select Project Manager", ""));
            }
        }

        private void LoadProjectGrid()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("EXEC sp_Project_FetchAll", conn);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                rptProjects.DataSource = dr;
                rptProjects.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string logoPath = "";
                string filePath = "";
                string uploadDirectory = Server.MapPath("~/Uploads/");

                if (!Directory.Exists(uploadDirectory))
                {
                    Directory.CreateDirectory(uploadDirectory);
                }

                if (fileLogo.HasFile)
                {
                    string logoFileName = Path.GetFileName(fileLogo.PostedFile.FileName);
                    logoPath = "Uploads/" + logoFileName;
                    fileLogo.SaveAs(uploadDirectory + logoFileName);
                }

                if (fileProject.HasFile)
                {
                    string projectFileName = Path.GetFileName(fileProject.PostedFile.FileName);
                    filePath = "Uploads/" + projectFileName;
                    fileProject.SaveAs(uploadDirectory + projectFileName);
                }

                string sqlFilePath = string.IsNullOrEmpty(filePath) ? "NULL" : $"'{filePath}'";
                string sqlLogoPath = string.IsNullOrEmpty(logoPath) ? "NULL" : $"'{logoPath}'";

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    int targetProjectId = 0;

                    if (!string.IsNullOrEmpty(hfProjectId.Value))
                    {
                        targetProjectId = Convert.ToInt32(hfProjectId.Value);
                        string updateQuery = $"EXEC sp_AllProjects_Update {targetProjectId}, '{txtProjectName.Text}', '{txtClientName.Text}', '{txtDescription.Text}', '{txtStartDate.Text}', '{txtEndDate.Text}', '{ddlPriority.SelectedValue}', {txtProjectValue.Text}, '{ddlPriceType.SelectedValue}', {sqlFilePath}, {sqlLogoPath}, '{ddlStatus.SelectedValue}', '{ddlManagerName.SelectedValue}'";
                        SqlCommand cmdUpdate = new SqlCommand(updateQuery, conn);
                        cmdUpdate.ExecuteNonQuery();
                    }
                    else
                    {
                        string insertQuery = $"EXEC sp_AllProjects_Insert '{txtProjectName.Text}', '{txtClientName.Text}', '{txtDescription.Text}', '{txtStartDate.Text}', '{txtEndDate.Text}', '{ddlPriority.SelectedValue}', {txtProjectValue.Text}, '{ddlPriceType.SelectedValue}', {sqlFilePath}, {sqlLogoPath}, '{ddlStatus.SelectedValue}', '{ddlManagerName.SelectedValue}'";
                        SqlCommand cmdInsert = new SqlCommand(insertQuery, conn);
                        object resultId = cmdInsert.ExecuteScalar();
                        if (resultId != null && resultId != DBNull.Value)
                        {
                            targetProjectId = Convert.ToInt32(resultId);
                        }
                    }

                    if (targetProjectId > 0)
                    {
                        foreach (ListItem item in cblTeamMembers.Items)
                        {
                            if (item.Selected)
                            {
                                int userId = Convert.ToInt32(item.Value);
                                string teamQuery = $"EXEC sp_ProjectTeamMembers_Insert {targetProjectId}, {userId}";
                                SqlCommand cmdTeam = new SqlCommand(teamQuery, conn);
                                cmdTeam.ExecuteNonQuery();
                            }
                        }
                        Response.Write("<script>alert('Project configuration saved successfully!');window.location='ProjectUpload.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Project process error or duplicate item found.');</script>");
                    }
                }
            }
        }

        protected void rptProjects_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int projectId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Edit")
            {
                hfProjectId.Value = projectId.ToString();
                lblModalTitle.Text = "Edit Project";
                btnSave.Text = "Update Project";

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string selectQuery = $"SELECT * FROM AllProjects WHERE ProjectId = {projectId}";
                    SqlCommand cmd = new SqlCommand(selectQuery, conn);
                    conn.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            txtProjectName.Text = dr["ProjectName"].ToString();
                            txtClientName.Text = dr["ClientName"].ToString();
                            txtDescription.Text = dr["Description"].ToString();
                            txtStartDate.Text = dr["StartDate"] != DBNull.Value ? Convert.ToDateTime(dr["StartDate"]).ToString("yyyy-MM-dd") : "";
                            txtEndDate.Text = dr["EndDate"] != DBNull.Value ? Convert.ToDateTime(dr["EndDate"]).ToString("yyyy-MM-dd") : "";
                            ddlPriority.SelectedValue = dr["Priority"].ToString();
                            ddlStatus.SelectedValue = dr["Status"].ToString();
                            txtProjectValue.Text = dr["ProjectValue"].ToString();
                            ddlPriceType.SelectedValue = dr["PriceType"].ToString();
                            ddlManagerName.SelectedValue = dr["ManagerName"].ToString();
                        }
                        string modalScript = "<script type='text/javascript'>" +
                     "   document.addEventListener('DOMContentLoaded', function() {" +
                     "       var myModal = new bootstrap.Modal(document.getElementById('add_project_modal'));" +
                     "       myModal.show();" +
                     "   });" +
                     "</script>";

                        ClientScript.RegisterStartupScript(this.GetType(), "ShowEditModal", modalScript);
                    }

                    cblTeamMembers.ClearSelection();
                    string mappingsQuery = $"SELECT UsersUserId FROM ProjectsUser WHERE ProjectsProjectId = {projectId}";
                    SqlCommand cmdMap = new SqlCommand(mappingsQuery, conn);
                    using (SqlDataReader drMap = cmdMap.ExecuteReader())
                    {
                        while (drMap.Read())
                        {
                            string assignedUserId = drMap["UsersUserId"].ToString();
                            ListItem item = cblTeamMembers.Items.FindByValue(assignedUserId);
                            if (item != null) item.Selected = true;
                        }
                    }
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "PopModal", "var myModal = new bootstrap.Modal(document.getElementById('add_project_modal')); myModal.show();", true);
            }
            else if (e.CommandName == "Delete")
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string deleteQuery = $"EXEC sp_Project_Delete {projectId}";
                    SqlCommand cmd = new SqlCommand(deleteQuery, conn);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                Response.Write("<script>alert('Project record deleted permanently.');</script>");
                LoadProjectGrid();
            }
        }
    }
}