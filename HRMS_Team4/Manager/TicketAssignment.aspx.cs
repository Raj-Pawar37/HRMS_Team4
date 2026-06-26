using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Manager
{
    public partial class TicketAssignment : System.Web.UI.Page
    {

        string connStr = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();
        int SessionUserId;

        protected void Page_Load(object sender, EventArgs e)
        {
            SessionUserId = Convert.ToInt32(Session["UserId"]);


            if (!IsPostBack)
            {
                LoadTickets();

                    PopulateEmployeeDropdown();
            }
        }

        private void LoadTickets()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_GetTicketList", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@UserId", SessionUserId);
                        cmd.Parameters.AddWithValue("@Role", 8);

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            rptTickets.DataSource = dt;
                            rptTickets.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                AlertMessage("Data Matrix Load Error: " + ex.Message);
            }
        }

        private void PopulateEmployeeDropdown()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "SELECT UserId, CONCAT(FirstName, ' ', LastName) AS FullName FROM [User]";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            ddlEmployees.DataSource = dt;
                            ddlEmployees.DataTextField = "FullName";
                            ddlEmployees.DataValueField = "UserId";
                            ddlEmployees.DataBind();
                            ddlEmployees.Items.Insert(0, new ListItem("-- Select Handyman Employee --", ""));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                AlertMessage("Error populating structural employee list tools: " + ex.Message);
            }
        }

        protected void btnSubmitTicket_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTicketName.Text) || string.IsNullOrWhiteSpace(txtDescription.Text))
            {
                AlertMessage("All core textual ticket descriptions are required.");
                return;
            }

            string targetVirtualPath = string.Empty;

            try
            {
                if (fileAttachment.HasFile)
                {
                    string fileExtension = Path.GetExtension(fileAttachment.FileName);
                    string generatedFileName = Guid.NewGuid().ToString() + fileExtension;
                    string physicalStorageFolder = Server.MapPath("~/Uploads/Tickets/");

                    if (!Directory.Exists(physicalStorageFolder))
                    {
                        Directory.CreateDirectory(physicalStorageFolder);
                    }

                    fileAttachment.SaveAs(Path.Combine(physicalStorageFolder, generatedFileName));
                    targetVirtualPath = "~/Uploads/Tickets/" + generatedFileName;
                }

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_RaiseNewTicket", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TicketName", txtTicketName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                        cmd.Parameters.AddWithValue("@Attachment", string.IsNullOrEmpty(targetVirtualPath) ? (object)DBNull.Value : targetVirtualPath);
                        cmd.Parameters.AddWithValue("@RaisedBy", SessionUserId);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                txtTicketName.Text = string.Empty;
                txtDescription.Text = string.Empty;
                LoadTickets();
                AlertMessage("Support ticket successfully opened inside helpdesk queue.");
            }
            catch (Exception ex)
            {
                AlertMessage("Error creating ticket execution log: " + ex.Message);
            }
        }

        protected void rptTickets_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                string status = row["Status"].ToString();
                int currentUserId = Convert.ToInt32(Session["UserId"]);

                LinkButton btnAssign = (LinkButton)e.Item.FindControl("btnOpenAssignModal");
                LinkButton btnResolve = (LinkButton)e.Item.FindControl("btnOpenResolveModal");
                LinkButton btnViewSolution = (LinkButton)e.Item.FindControl("btnViewSolution");
                HtmlGenericControl lblNoAction = (HtmlGenericControl)e.Item.FindControl("lblNoAction");

                string userRole = Session["Role"].ToString();

                if (status == "Closed")
                {
                    int raisedById = Convert.ToInt32(row["RaisedBy"]);
                    int assignedToId = row["AssignTo"] != DBNull.Value ? Convert.ToInt32(row["AssignTo"]) : 0;

                    // Validation Check: Original Employee, Assigned Technician, or Managers can read out logs
                    if (userRole == "Manager" || currentUserId == raisedById || currentUserId == assignedToId)
                    {
                        btnViewSolution.Visible = true;
                    }
                    else
                    {
                        lblNoAction.Visible = true;
                    }
                }
                else if (userRole == "Manager")
                {
                    if (status == "Open") btnAssign.Visible = true;
                    else lblNoAction.Visible = true;
                }
                else if (userRole == "Employee")
                {
                    int assignedToId = row["AssignTo"] != DBNull.Value ? Convert.ToInt32(row["AssignTo"]) : 0;

                    if (status == "Assigned" && currentUserId == assignedToId)
                    {
                        btnResolve.Visible = true;
                    }
                    else
                    {
                        lblNoAction.Visible = true;
                    }
                }
            }
        }

        protected void rptTickets_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int ticketId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "OpenAssign")
            {
                hfSelectedTicketId.Value = ticketId.ToString();
                TriggerModalClientScript("modal_manager_assign");
            }
            else if (e.CommandName == "OpenResolve")
            {
                hfResolveTicketId.Value = ticketId.ToString();
                TriggerModalClientScript("modal_employee_resolve");
            }
            else if (e.CommandName == "ViewSolution")
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(connStr))
                    {
                        string query = "SELECT TicketName, ResolutionDescription FROM RaiseTicket WHERE Id = @Id";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Id", ticketId);
                            con.Open();
                            using (SqlDataReader dr = cmd.ExecuteReader())
                            {
                                if (dr.Read())
                                {
                                    txtViewTicketName.Text = dr["TicketName"].ToString();
                                    txtViewResolutionDescription.Text = !string.IsNullOrEmpty(dr["ResolutionDescription"].ToString())
                                        ? dr["ResolutionDescription"].ToString()
                                        : "No summary description logs available.";

                                    TriggerModalClientScript("modal_view_solution");
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    AlertMessage("Error opening resolution details view: " + ex.Message);
                }
            }
        }

        protected void btnConfirmAssignment_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlEmployees.SelectedValue))
            {
                AlertMessage("Please explicitly select an internal employee resource mapping choice.");
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_AssignTicketToEmployee", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TicketId", Convert.ToInt32(hfSelectedTicketId.Value));
                        cmd.Parameters.AddWithValue("@AssignBy",SessionUserId);
                        cmd.Parameters.AddWithValue("@AssignTo", Convert.ToInt32(ddlEmployees.SelectedValue));

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                LoadTickets();
                AlertMessage("System tracking assignment updated successfully.");
            }
            catch (Exception ex)
            {
                AlertMessage("Assignment Error: " + ex.Message);
            }
        }

        protected void btnConfirmResolution_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtResolutionNotes.Text))
            {
                AlertMessage("Resolution breakdown descriptions cannot be blank.");
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_ResolveTicket", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TicketId", Convert.ToInt32(hfResolveTicketId.Value));
                        cmd.Parameters.AddWithValue("@UserId", SessionUserId);
                        cmd.Parameters.AddWithValue("@ResolutionDescription", txtResolutionNotes.Text.Trim());

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                txtResolutionNotes.Text = string.Empty;
                LoadTickets();
                AlertMessage("Ticket resolution recorded successfully.");
            }
            catch (Exception ex)
            {
                AlertMessage("Resolution Post Error: " + ex.Message);
            }
        }

        protected string GetStatusClass(string status)
        {
            switch (status)
            {
                case "Open": return "bg-danger";
                case "Assigned": return "bg-info text-white";
                case "Closed": return "bg-success";
                default: return "bg-secondary";
            }
        }

        private void TriggerModalClientScript(string targetModalElementId)
        {
            string jsBlockScript = string.Format("setTimeout(function(){{ var TargetInstance = new bootstrap.Modal(document.getElementById('{0}')); TargetInstance.show(); }}, 150);", targetModalElementId);
            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), jsBlockScript, true);
        }

        private void AlertMessage(string traceMessage)
        {
            string exactEscapedDetails = traceMessage.Replace("'", "\\'").Replace("\r", "").Replace("\n", " ");
            ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), string.Format("alert('{0}');", exactEscapedDetails), true);
        }
    }
}