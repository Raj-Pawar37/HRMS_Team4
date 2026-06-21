using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class TrainingList : System.Web.UI.Page
    {
        string conn = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Pulse360_FinalDb;Integrated Security=True;";

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

        private void BindTraining()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conn))
                {
                    string query = @"
                            SELECT
                                t.TrainingId,
                                tt.TrainingTypeName,
                                CONCAT(tr.FirstName,' ',tr.LastName) AS TrainerName,
                                CONCAT(u.FirstName,' ',u.LastName) AS EmployeeName,
                                t.StartDate,
                                t.EndDate,
                                t.Description,
                                t.TrainingCost,
                                t.Status
                            FROM Training t
                            LEFT JOIN TrainingType tt
                                ON t.TrainingTypeId = tt.TrainingTypeId
                            LEFT JOIN Trainer tr
                                ON t.TrainerId = tr.TrainerId
                            LEFT JOIN [User] u
                                ON t.UserId = u.UserId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {

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

        private void LoadTrainers()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conn))
                {
                    SqlCommand cmd = new SqlCommand(
                        "SELECT TrainerId, CONCAT(FirstName,' ',LastName) AS TrainerName FROM Trainer",
                        con);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    ddlTrainer.DataSource = dt;
                    ddlTrainer.DataTextField = "TrainerName";
                    ddlTrainer.DataValueField = "TrainerId";
                    ddlTrainer.DataBind();

                    ddlTrainer.Items.Insert(0,
                        new ListItem("-- Select Trainer --", ""));

                   
                }
            }
            catch (Exception ex)
            {
                Response.Write("<h3 style='color:red'>TRAINER LOAD ERROR: "
                    + ex.Message + "</h3>");
            }
        }

        private void LoadUsers()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conn))
                {
                    SqlCommand cmd = new SqlCommand(
                        "SELECT UserId, CONCAT(FirstName,' ',LastName) AS UserName FROM [User]",
                        con);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    ddlUser.DataSource = dt;
                    ddlUser.DataTextField = "UserName";
                    ddlUser.DataValueField = "UserId";
                    ddlUser.DataBind();

                    ddlUser.Items.Insert(0,
                        new ListItem("-- Select User --", ""));

                    
                }
            }
            catch (Exception ex)
            {
                Response.Write("<h3 style='color:red'>USER LOAD ERROR: "
                    + ex.Message + "</h3>");
            }
        }

        private void LoadTrainingTypes()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conn))
                {
                    SqlCommand cmd = new SqlCommand(
                        "SELECT TrainingTypeId, TrainingTypeName FROM TrainingType",
                        con);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    ddlTrainingType.DataSource = dt;
                    ddlTrainingType.DataTextField = "TrainingTypeName";
                    ddlTrainingType.DataValueField = "TrainingTypeId";
                    ddlTrainingType.DataBind();

                    ddlTrainingType.Items.Insert(0,
                        new ListItem("-- Select Training Type --", ""));

                 
                }
            }
            catch (Exception ex)
            {
                Response.Write("<h3 style='color:red'>TRAINING TYPE LOAD ERROR: "
                    + ex.Message + "</h3>");
            }
        }

        protected void btnAddTraining_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlTrainingType.SelectedValue))
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "msg1",
                    "alert('Please select Training Type');",
                    true);
                return;
            }

            if (string.IsNullOrEmpty(ddlTrainer.SelectedValue))
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "msg2",
                    "alert('Please select Trainer');",
                    true);
                return;
            }

            if (string.IsNullOrEmpty(ddlUser.SelectedValue))
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "msg3",
                    "alert('Please select User');",
                    true);
                return;
            }

            try
            {
                int typeId = Convert.ToInt32(
                    ddlTrainingType.SelectedValue);

                int trainerId = Convert.ToInt32(
                    ddlTrainer.SelectedValue);

                int userId = Convert.ToInt32(
                    ddlUser.SelectedValue);

                //Response.Write(
                //    "<br/><b>DEBUG VALUES</b><br/>" +
                //    "TrainingTypeId = " + typeId + "<br/>" +
                //    "TrainerId = " + trainerId + "<br/>" +
                //    "UserId = " + userId + "<br/>");

                using (SqlConnection con = new SqlConnection(conn))
                {
                    string procedureName =
                   ViewState["TrainingId"] == null
                      ? "sp_InsertTraining"
                      : "sp_updateTraining";

                    using (SqlCommand cmd =
                        new SqlCommand(procedureName, con))
                    {
                        cmd.CommandType =
                            CommandType.StoredProcedure;
                        if (ViewState["TrainingId"] != null)
                        {
                            cmd.Parameters.AddWithValue(
                                "@TrainingId",
                                Convert.ToInt32(ViewState["TrainingId"]));

                            cmd.Parameters.AddWithValue("@CreatedAt", DBNull.Value);
                            cmd.Parameters.AddWithValue("@CreatedBy", DBNull.Value);
                            cmd.Parameters.AddWithValue("@ModifiedBy", "Admin");
                            cmd.Parameters.AddWithValue("@ModifiedAt", DateTime.Now);
                        }

                        cmd.Parameters.AddWithValue(
                            "@TrainingTypeId", typeId);

                        cmd.Parameters.AddWithValue(
                            "@TrainerId", trainerId);

                        cmd.Parameters.AddWithValue(
                            "@UserId", userId);

                        decimal cost = 0;
                        decimal.TryParse(txtCost.Text, out cost);

                        cmd.Parameters.AddWithValue(
                            "@TrainingCost", cost);

                        DateTime startDate;
                        DateTime endDate;

                        if (!DateTime.TryParse(
                            txtStartDate.Text,
                            out startDate))
                        {
                            startDate = DateTime.Now;
                        }

                        if (!DateTime.TryParse(
                            txtEndDate.Text,
                            out endDate))
                        {
                            endDate = DateTime.Now.AddDays(1);
                        }

                        cmd.Parameters.AddWithValue(
                            "@StartDate", startDate);

                        cmd.Parameters.AddWithValue(
                            "@EndDate", endDate);

                        cmd.Parameters.AddWithValue(
                            "@Description",
                            txtDescription.Text.Trim());

                        cmd.Parameters.AddWithValue(
                            "@Status",
                            ddlStatus.SelectedValue);

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

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "success",
                    "alert('SUCCESS! Training Added Successfully');",
                    true);
            }
            catch (Exception ex)
            {
                string cleanError =
                    ex.Message.Replace("'", "\\'")
                    .Replace("\r", "")
                    .Replace("\n", " ");

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "dbError",
                    "alert('DATABASE ERROR: "
                    + cleanError + "');",
                    true);

                //Response.Write(
                //    "<div style='background:red;color:white;" +
                //    "padding:15px;font-weight:bold'>" +
                //    ex.Message +
                //    "</div>");
            }
        }

        protected void rptTraining_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int id =
                    Convert.ToInt32(e.CommandArgument);

                try
                {
                    using (SqlConnection con =
                        new SqlConnection(conn))
                    {
                        SqlCommand cmd =
                            new SqlCommand(
                                "DELETE FROM Training WHERE TrainingId=@Id",
                                con);

                        cmd.Parameters.AddWithValue(
                            "@Id", id);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }

                    BindTraining();

                    ClientScript.RegisterStartupScript(
                        this.GetType(),
                        "delete",
                        "alert('Training Deleted');",
                        true);
                }
                catch (Exception ex)
                {
                    Response.Write(
                        "<h3 style='color:red'>DELETE ERROR : "
                        + ex.Message + "</h3>");
                }
            }
            else if (e.CommandName == "Edit")
            {
                try
                {
                   

                    int id = Convert.ToInt32(e.CommandArgument);

                    using (SqlConnection con = new SqlConnection(conn))
                    {
                        SqlCommand cmd = new SqlCommand(
                            "SELECT * FROM Training WHERE TrainingId=@Id", con);

                        cmd.Parameters.AddWithValue("@Id", id);

                        con.Open();

                        SqlDataReader dr = cmd.ExecuteReader();

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

                            txtStartDate.Text =
                                Convert.ToDateTime(dr["StartDate"]).ToString("yyyy-MM-dd");

                            txtEndDate.Text =
                                Convert.ToDateTime(dr["EndDate"]).ToString("yyyy-MM-dd");

                            btnAddTraining.Text = "Update Training";
                            ScriptManager.RegisterStartupScript(
                            this,
                            GetType(),
                            "ShowModal",
                            "setTimeout(function(){ var modal = new bootstrap.Modal(document.getElementById('add_training')); modal.show(); }, 100);",
                            true);

                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('ERROR : " +
                        ex.Message.Replace("'", "") + "');</script>");
                }
            }

            
                    }
                }
            }
        
    