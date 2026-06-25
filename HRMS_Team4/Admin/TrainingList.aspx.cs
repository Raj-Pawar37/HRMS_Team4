using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class TrainingList : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTrainingTypes();
                LoadTrainers();
                LoadUsers();
                BindTraining();
            }
        }

        // Added a default parameter so it loads "Recently Added" automatically
        private void BindTraining(string filter = "Recently Added")
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Training_GetAll", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Pass the sorting word (Ascending, Last 7 Days, etc) to SQL!
                        cmd.Parameters.AddWithValue("@Filter", filter);

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        rptTraining.DataSource = dt;
                        rptTraining.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<h3 style='color:red'>READ ERROR: " + ex.Message + "</h3>");
            }
        }

        protected void SortFilter_Click(object sender, EventArgs e)
        {
            // Figure out which button was clicked
            LinkButton btn = (LinkButton)sender;
            string selectedFilter = btn.CommandArgument;

            // Update the dropdown text so the user knows what they clicked
            lblSortText.InnerText = "Sort By : " + selectedFilter;

            // Reload the table using the new filter!
            BindTraining(selectedFilter);
        }

        private void LoadTrainers()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Trainer_GetDropdown", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        ddlTrainer.DataSource = dt;
                        ddlTrainer.DataTextField = "TrainerName";
                        ddlTrainer.DataValueField = "TrainerId";
                        ddlTrainer.DataBind();

                        ddlTrainer.Items.Insert(0, new ListItem("-- Select Trainer --", ""));
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<h3 style='color:red'>TRAINER LOAD ERROR: " + ex.Message + "</h3>");
            }
        }

        private void LoadUsers()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_User_GetDropdown", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        ddlUser.DataSource = dt;
                        ddlUser.DataTextField = "UserName";
                        ddlUser.DataValueField = "UserId";
                        ddlUser.DataBind();

                        ddlUser.Items.Insert(0, new ListItem("-- Select User --", ""));
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<h3 style='color:red'>USER LOAD ERROR: " + ex.Message + "</h3>");
            }
        }

        private void LoadTrainingTypes()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_TrainingType_GetDropdown", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        ddlTrainingType.DataSource = dt;
                        ddlTrainingType.DataTextField = "TrainingTypeName";
                        ddlTrainingType.DataValueField = "TrainingTypeId";
                        ddlTrainingType.DataBind();

                        ddlTrainingType.Items.Insert(0, new ListItem("-- Select Training Type --", ""));
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<h3 style='color:red'>TRAINING TYPE LOAD ERROR: " + ex.Message + "</h3>");
            }
        }

        protected void btnAddTraining_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlTrainingType.SelectedValue))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "msg1", "alert('Please select Training Type');", true);
                return;
            }
            if (string.IsNullOrEmpty(ddlTrainer.SelectedValue))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "msg2", "alert('Please select Trainer');", true);
                return;
            }
            if (string.IsNullOrEmpty(ddlUser.SelectedValue))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "msg3", "alert('Please select User');", true);
                return;
            }

            try
            {
                int typeId = Convert.ToInt32(ddlTrainingType.SelectedValue);
                int trainerId = Convert.ToInt32(ddlTrainer.SelectedValue);
                int userId = Convert.ToInt32(ddlUser.SelectedValue);

                using (SqlConnection con = new SqlConnection(conn))
                {
                    string procedureName = ViewState["TrainingId"] == null ? "sp_Training_Insert" : "sp_Training_Update";

                    using (SqlCommand cmd = new SqlCommand(procedureName, con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        if (ViewState["TrainingId"] != null)
                        {
                            cmd.Parameters.AddWithValue("@TrainingId", Convert.ToInt32(ViewState["TrainingId"]));
                            cmd.Parameters.AddWithValue("@CreatedAt", DBNull.Value);
                            cmd.Parameters.AddWithValue("@CreatedBy", DBNull.Value);
                            cmd.Parameters.AddWithValue("@ModifiedBy", "Admin");
                            cmd.Parameters.AddWithValue("@ModifiedAt", DateTime.Now);
                        }

                        cmd.Parameters.AddWithValue("@TrainingTypeId", typeId);
                        cmd.Parameters.AddWithValue("@TrainerId", trainerId);
                        cmd.Parameters.AddWithValue("@UserId", userId);

                        decimal cost = 0;
                        decimal.TryParse(txtCost.Text, out cost);
                        cmd.Parameters.AddWithValue("@TrainingCost", cost);

                        DateTime startDate;
                        DateTime endDate;
                        if (!DateTime.TryParse(txtStartDate.Text, out startDate)) startDate = DateTime.Now;
                        if (!DateTime.TryParse(txtEndDate.Text, out endDate)) endDate = DateTime.Now.AddDays(1);

                        cmd.Parameters.AddWithValue("@StartDate", startDate);
                        cmd.Parameters.AddWithValue("@EndDate", endDate);
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                        cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindTraining();

                ddlTrainingType.SelectedIndex = 0;
                ddlTrainer.SelectedIndex = 0;
                ddlUser.SelectedIndex = 0;
                ddlStatus.SelectedIndex = 0;

                txtCost.Text = "";
                txtStartDate.Text = "";
                txtEndDate.Text = "";
                txtDescription.Text = "";
                ViewState["TrainingId"] = null;
                btnAddTraining.Text = "Add Training";

                ClientScript.RegisterStartupScript(this.GetType(), "success", "alert('SUCCESS! Training Processed Successfully');", true);
            }
            catch (Exception ex)
            {
                string cleanError = ex.Message.Replace("'", "\\'").Replace("\r", "").Replace("\n", " ");
                ClientScript.RegisterStartupScript(this.GetType(), "dbError", "alert('DATABASE ERROR: " + cleanError + "');", true);
            }
        }

        protected void rptTraining_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Delete")
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(conn))
                    {
                        using (SqlCommand cmd = new SqlCommand("sp_Training_Delete", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@Id", id);
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                    BindTraining();
                    ClientScript.RegisterStartupScript(this.GetType(), "delete", "alert('Training Deleted');", true);
                }
                catch (Exception ex)
                {
                    Response.Write("<h3 style='color:red'>DELETE ERROR : " + ex.Message + "</h3>");
                }
            }
            else if (e.CommandName == "Edit")
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(conn))
                    {
                        using (SqlCommand cmd = new SqlCommand("sp_Training_GetById", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@Id", id);
                            con.Open();
                            using (SqlDataReader dr = cmd.ExecuteReader())
                            {
                                if (dr.Read())
                                {
                                    ViewState["TrainingId"] = dr["TrainingId"];

                                    LoadTrainingTypes();
                                    LoadTrainers();
                                    LoadUsers();

                                    ddlTrainingType.SelectedValue = dr["TrainingTypeId"].ToString();
                                    ddlTrainer.SelectedValue = dr["TrainerId"].ToString();
                                    ddlUser.SelectedValue = dr["UserId"].ToString();

                                    txtCost.Text = dr["TrainingCost"].ToString();
                                    txtDescription.Text = dr["Description"].ToString();
                                    ddlStatus.SelectedValue = dr["Status"].ToString();

                                    txtStartDate.Text = Convert.ToDateTime(dr["StartDate"]).ToString("yyyy-MM-dd");
                                    txtEndDate.Text = Convert.ToDateTime(dr["EndDate"]).ToString("yyyy-MM-dd");

                                    btnAddTraining.Text = "Update Training";
                                    ScriptManager.RegisterStartupScript(
                                        this, GetType(), "ShowModal",
                                        "setTimeout(function(){ var modal = new bootstrap.Modal(document.getElementById('add_training')); modal.show(); }, 100);",
                                        true);
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('ERROR : " + ex.Message.Replace("'", "") + "');</script>");
                }
            }
        }
    }
}