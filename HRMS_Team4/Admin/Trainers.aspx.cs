using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class Trainers : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();

        protected void Page_Load(object sender, EventArgs e)
        {



            if (!IsPostBack)
            {
                BindTrainers();
            }
        }

        // 1. Update your BindTrainers method to look exactly like this:
        private void BindTrainers(string filter = "Recently Added")
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand("sp_Trainers_GetAll", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Filter", filter); // Pass the filter to SQL

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

        // 2. Add this Click Event anywhere inside your Trainers class:
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

                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Trainer_Insert", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                        cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                        cmd.Parameters.AddWithValue("@Role", txtRole.Text);
                        cmd.Parameters.AddWithValue("@Phone", cleanPhone);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                        cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                        cmd.Parameters.AddWithValue("@ProfilePicture", "");

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindTrainers();
                txtFirstName.Text = ""; txtLastName.Text = ""; txtRole.Text = "";
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
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "setTimeout(function(){ alert('DELETED! Trainer was permanently removed.'); }, 100);", true);
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
                                txtEditRole.Text = dr["Role"].ToString();
                                txtEditPhone.Text = dr["Phone"].ToString();
                                txtEditEmail.Text = dr["Email"].ToString();
                                txtEditDescription.Text = dr["Description"].ToString();
                                ddlEditStatus.SelectedValue = dr["Status"].ToString();
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

                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_Trainer_Update", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@FirstName", txtEditFirstName.Text);
                        cmd.Parameters.AddWithValue("@LastName", txtEditLastName.Text);
                        cmd.Parameters.AddWithValue("@Role", txtEditRole.Text);
                        cmd.Parameters.AddWithValue("@Phone", cleanEditPhone);
                        cmd.Parameters.AddWithValue("@Email", txtEditEmail.Text);
                        cmd.Parameters.AddWithValue("@Description", txtEditDescription.Text);
                        cmd.Parameters.AddWithValue("@Status", ddlEditStatus.SelectedValue);
                        cmd.Parameters.AddWithValue("@TrainerId", hfEditId.Value);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindTrainers();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "setTimeout(function(){ alert('UPDATED! Trainer was successfully updated.'); }, 100);", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "errorAlert", "alert('ERROR: " + ex.Message.Replace("'", "\\'") + "');", true);
            }
        }
    }
}