using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class Trainers : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Enctype = "multipart/form-data";

            if (!IsPostBack)
            {
                BindRoles(); // CRITICAL: This populates the dropdown!
                BindTrainers();
            }
        }

        private void BindRoles()
        {
            ddlRole.Items.Clear();
            ddlEditRole.Items.Clear();

            try
            {
                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Role_GetDropdown", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);

                            if (dt.Rows.Count > 0)
                            {
                                ddlRole.DataSource = dt;
                                ddlRole.DataTextField = "RoleName";
                                ddlRole.DataValueField = "RoleName";
                                ddlRole.DataBind();

                                ddlEditRole.DataSource = dt;
                                ddlEditRole.DataTextField = "RoleName";
                                ddlEditRole.DataValueField = "RoleName";
                                ddlEditRole.DataBind();
                            }
                            else
                            {
                                ddlRole.Items.Add(new ListItem("Table is empty!", ""));
                                ddlEditRole.Items.Add(new ListItem("Table is empty!", ""));
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ddlRole.Items.Add(new ListItem("ERROR: " + ex.Message, ""));
                ddlEditRole.Items.Add(new ListItem("ERROR: " + ex.Message, ""));
            }

            ddlRole.Items.Insert(0, new ListItem("-- Select Role --", ""));
            ddlEditRole.Items.Insert(0, new ListItem("-- Select Role --", ""));
        }

        private void BindTrainers(string filter = "Recently Added")
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand("sp_Trainers_GetAll", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Filter", filter);

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptTrainers.DataSource = dt;
                        rptTrainers.DataBind();
                    }
                }
            }
        }

        protected void SortFilter_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string selectedFilter = btn.CommandArgument;
            lblSortText.InnerText = "Sort By : " + selectedFilter;
            BindTrainers(selectedFilter);
        }

        protected void btnAddTrainer_Click(object sender, EventArgs e)
        {
            try
            {
                string cleanPhone = txtPhone.Text.Replace("-", "").Replace("(", "").Replace(")", "").Replace(" ", "");

                string profilePicPath = "";
                if (fuProfilePicture.HasFile)
                {
                    string fileName = DateTime.Now.ToString("yyyyMMddHHmmss_") + Path.GetFileName(fuProfilePicture.PostedFile.FileName);
                    string folderPath = Server.MapPath("~/Uploads/Trainers/");
                    if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                    fuProfilePicture.SaveAs(folderPath + fileName);
                    profilePicPath = "~/Uploads/Trainers/" + fileName;
                }

                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Trainer_Insert", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                        cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                        cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue); // READS FROM DROPDOWN!
                        cmd.Parameters.AddWithValue("@Phone", cleanPhone);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                        cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                        cmd.Parameters.AddWithValue("@ProfilePicture", profilePicPath);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindTrainers();
                txtFirstName.Text = ""; txtLastName.Text = ""; ddlRole.SelectedIndex = 0;
                txtPhone.Text = ""; txtEmail.Text = ""; txtDescription.Text = ""; ddlStatus.SelectedIndex = 0;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "setTimeout(function(){ alert('SUCCESS! Trainer was added.'); }, 100);", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "errorAlert", "alert('ERROR: " + ex.Message.Replace("'", "\\'") + "');", true);
            }
        }

        protected void rptTrainers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Delete")
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(conn))
                    {
                        using (SqlCommand cmd = new SqlCommand("sp_DeleteTrainer", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@TrainerId", id);
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                    BindTrainers();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "setTimeout(function(){ alert('DELETED!'); }, 100);", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "errorAlert", "alert('ERROR: " + ex.Message.Replace("'", "\\'") + "');", true);
                }
            }
            else if (e.CommandName == "Edit")
            {
                hfEditId.Value = id.ToString();

                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Trainer_GetById", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TrainerId", id);
                        con.Open();
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                txtEditFirstName.Text = dr["FirstName"].ToString();
                                txtEditLastName.Text = dr["LastName"].ToString();

                                string roleValue = dr["Role"].ToString();
                                if (ddlEditRole.Items.FindByValue(roleValue) != null)
                                {
                                    ddlEditRole.SelectedValue = roleValue;
                                }

                                txtEditPhone.Text = dr["Phone"].ToString();
                                txtEditEmail.Text = dr["Email"].ToString();
                                txtEditDescription.Text = dr["Description"].ToString();
                                ddlEditStatus.SelectedValue = dr["Status"].ToString();
                                hfOldProfilePicture.Value = dr["ProfilePicture"].ToString();
                            }
                        }
                    }
                }
                ClientScript.RegisterStartupScript(this.GetType(), "pop", "setTimeout(function(){ $('#edit_trainer').modal('show'); }, 100);", true);
            }
        }

        protected void btnUpdateTrainer_Click(object sender, EventArgs e)
        {
            try
            {
                string cleanEditPhone = txtEditPhone.Text.Replace("-", "").Replace("(", "").Replace(")", "").Replace(" ", "");

                string profilePicPath = hfOldProfilePicture.Value;
                if (fuEditProfilePicture.HasFile)
                {
                    string fileName = DateTime.Now.ToString("yyyyMMddHHmmss_") + Path.GetFileName(fuEditProfilePicture.PostedFile.FileName);
                    string folderPath = Server.MapPath("~/Uploads/Trainers/");
                    if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                    fuEditProfilePicture.SaveAs(folderPath + fileName);
                    profilePicPath = "~/Uploads/Trainers/" + fileName;
                }

                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Trainer_Update", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@FirstName", txtEditFirstName.Text);
                        cmd.Parameters.AddWithValue("@LastName", txtEditLastName.Text);
                        cmd.Parameters.AddWithValue("@Role", ddlEditRole.SelectedValue); // READS FROM DROPDOWN!
                        cmd.Parameters.AddWithValue("@Phone", cleanEditPhone);
                        cmd.Parameters.AddWithValue("@Email", txtEditEmail.Text);
                        cmd.Parameters.AddWithValue("@Description", txtEditDescription.Text);
                        cmd.Parameters.AddWithValue("@Status", ddlEditStatus.SelectedValue);
                        cmd.Parameters.AddWithValue("@TrainerId", hfEditId.Value);
                        cmd.Parameters.AddWithValue("@ProfilePicture", profilePicPath);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindTrainers();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "setTimeout(function(){ alert('UPDATED!'); }, 100);", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "errorAlert", "alert('ERROR: " + ex.Message.Replace("'", "\\'") + "');", true);
            }
        }
    }
}