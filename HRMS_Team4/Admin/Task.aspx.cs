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
    public partial class Task : System.Web.UI.Page
    {
        private readonly string connString = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["Priority"] = "All";
                ViewState["DueDate"] = "";
                ViewState["SelectedProjectId"] = "0";

                BindProjects();
                PopulateProjectScopeDropdown();
            }
        }

        private void BindProjects()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT ProjectId, ProjectName, EndDate, ProjectValue, PriceType, LogoPath FROM AllProjects WHERE Status = 'Active'", conn))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptProjects.DataSource = dt;
                    rptProjects.DataBind();
                }
            }
        }

        private void PopulateProjectScopeDropdown()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT ProjectId, ProjectName FROM AllProjects WHERE Status = 'Active' ORDER BY ProjectName ASC", conn))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    ddlModalProject.DataSource = dt;
                    ddlModalProject.DataTextField = "ProjectName";
                    ddlModalProject.DataValueField = "ProjectId";
                    ddlModalProject.DataBind();
                    ddlModalProject.Items.Insert(0, new ListItem("Select Project", ""));
                }
            }
            ddlModalTeam.Items.Clear();
            ddlModalTeam.Items.Insert(0, new ListItem("Select Team Members", ""));
        }

        protected void ddlModalProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlModalTeam.Items.Clear();
            ddlModalTeam.Items.Insert(0, new ListItem("Select Team Members", ""));

            if (!string.IsNullOrEmpty(ddlModalProject.SelectedValue))
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_GetProjectTeamMembers", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProjectId", Convert.ToInt32(ddlModalProject.SelectedValue));

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            ddlModalTeam.DataSource = dt;
                            ddlModalTeam.DataTextField = "Name";
                            ddlModalTeam.DataValueField = "UserId";
                            ddlModalTeam.DataBind();
                            ddlModalTeam.Items.Insert(0, new ListItem("Select Team Members", ""));
                        }
                    }
                }
            }
            upModalFields.Update();
        }

        protected void rptProjects_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                int projectId = Convert.ToInt32(row["ProjectId"]);

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_GetProjectTaskSummary", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProjectId", projectId);

                        conn.Open();
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                int total = Convert.ToInt32(dr["TotalTasks"]);
                                int completed = Convert.ToInt32(dr["CompletedTasks"]);
                                int percentage = Convert.ToInt32(dr["ProgressPercentage"]);

                                ((Literal)e.Item.FindControl("litTotalTasks")).Text = total.ToString();
                                ((Literal)e.Item.FindControl("litCompletedTasks")).Text = completed.ToString();
                                ((Literal)e.Item.FindControl("litPercentageText")).Text = percentage.ToString();
                                ((Panel)e.Item.FindControl("pnlProgressBar")).Style["width"] = percentage + "%";
                            }
                        }
                    }
                }
            }
        }

        protected void rptProjects_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectProject")
            {
                int projectId = Convert.ToInt32(e.CommandArgument);
                ViewState["SelectedProjectId"] = projectId.ToString();
                BindRightSideTaskDetails(projectId);
            }
        }

        private void BindRightSideTaskDetails(int projectId)
        {
            string priority = ViewState["Priority"].ToString();
            string date = ViewState["DueDate"].ToString();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                // 1. Fetch values from summary procedure
                using (SqlCommand cmd = new SqlCommand("sp_GetProjectTaskSummary", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ProjectId", projectId);

                    conn.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            lblSelectedProjectName.Text = dr["ProjectName"].ToString();
                            lblTasksFraction.Text = $"{dr["CompletedTasks"]} / {dr["TotalTasks"]}";
                            lblActivePercentage.Text = dr["ProgressPercentage"].ToString();
                            pnlActiveProgressBar.Style["width"] = dr["ProgressPercentage"] + "%";
                        }
                    }
                }

                // 2. Load list rows into Repeater controls
                using (SqlCommand cmd = new SqlCommand("sp_GetProjectTaskList", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ProjectId", projectId);
                    cmd.Parameters.AddWithValue("@Priority", priority);
                    cmd.Parameters.AddWithValue("@DueDate", date);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        rptProjectTasks.DataSource = dt;
                        rptProjectTasks.DataBind();
                    }
                }
            }

            pnlEmptyState.Visible = false;
            pnlActiveState.Visible = true;
            upTaskDetails.Update();
        }

        protected void btnModalSaveTask_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlModalProject.SelectedValue) || string.IsNullOrWhiteSpace(txtModalTitle.Text) || string.IsNullOrWhiteSpace(txtModalDueDate.Text))
            {
                AlertUser("Please fill in all layout fields.");
                return;
            }

            string attachmentPath = "";
            if (fuModalAttachment.HasFile)
            {
                string folder = Server.MapPath("~/Uploads/Tasks/");
                if (!System.IO.Directory.Exists(folder)) System.IO.Directory.CreateDirectory(folder);
                string file = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(fuModalAttachment.FileName);
                fuModalAttachment.SaveAs(folder + file);
                attachmentPath = "~/Uploads/Tasks/" + file;
            }

            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_InsertTask", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Projectid", ddlModalProject.SelectedValue);
                    cmd.Parameters.AddWithValue("@Title", txtModalTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Deadline", txtModalDueDate.Text);
                    cmd.Parameters.AddWithValue("@Priority", ddlModalPriority.SelectedValue);
                    cmd.Parameters.AddWithValue("@Status", ddlModalStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@Description", string.IsNullOrWhiteSpace(txtModalDesc.Text) ? (object)DBNull.Value : txtModalDesc.Text.Trim());
                    cmd.Parameters.AddWithValue("@Attachment", string.IsNullOrEmpty(attachmentPath) ? (object)DBNull.Value : attachmentPath);

                    if (!string.IsNullOrEmpty(ddlModalTeam.SelectedValue))
                        cmd.Parameters.AddWithValue("@Userid", Convert.ToInt32(ddlModalTeam.SelectedValue));
                    else
                        cmd.Parameters.AddWithValue("@Userid", DBNull.Value);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            BindProjects();
            ResetForm();
            AlertUser("Task added successfully!");
        }

        private void ResetForm()
        {
            txtModalTitle.Text = string.Empty;
            txtModalDueDate.Text = string.Empty;
            ddlModalProject.SelectedIndex = 0;
            ddlModalTeam.Items.Clear();
            ddlModalTeam.Items.Insert(0, new ListItem("Select Team Members", ""));
            ddlModalStatus.SelectedIndex = 0;
            ddlModalPriority.SelectedIndex = 0;
            txtModalDesc.Text = string.Empty;
            pnlEmptyState.Visible = true;
            pnlActiveState.Visible = false;
            upTaskDetails.Update();
        }

        protected void PriorityFilter_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            ViewState["Priority"] = btn.CommandArgument;

            btnFilterAll.CssClass = "nav-link btn-sm filter-btn";
            btnFilterHigh.CssClass = "nav-link btn-sm filter-btn";
            btnFilterMedium.CssClass = "nav-link btn-sm filter-btn";
            btnFilterLow.CssClass = "nav-link btn-sm filter-btn";
            btn.CssClass = "nav-link btn-sm filter-btn active";

            BindProjects();

            int activeId = Convert.ToInt32(ViewState["SelectedProjectId"]);
            if (activeId > 0) BindRightSideTaskDetails(activeId);
            else ResetForm();
        }

        protected void txtDueDateFilter_TextChanged(object sender, EventArgs e)
        {
            ViewState["DueDate"] = txtDueDateFilter.Text;
            BindProjects();

            int activeId = Convert.ToInt32(ViewState["SelectedProjectId"]);
            if (activeId > 0) BindRightSideTaskDetails(activeId);
            else ResetForm();
        }

        private void AlertUser(string msg)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), $"alert('{msg.Replace("'", "\\'")}');", true);
        }
    }
}