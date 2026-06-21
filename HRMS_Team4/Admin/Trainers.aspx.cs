using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class Trainers : System.Web.UI.Page
    {
        string conn = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Pulse360_FinalDb;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTrainers();
            }
        }

        private void BindTrainers()
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand("Sp_GetAllTariners", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
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

        protected void btnAddTrainer_Click(object sender, EventArgs e)
        {
            try
            {
                // Clean the phone number so the SQL 'bigint' doesn't crash!
                string cleanPhone = txtPhone.Text.Replace("-", "").Replace("(", "").Replace(")", "").Replace(" ", "");

                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_insertTrainer", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                        cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                        cmd.Parameters.AddWithValue("@Role", txtRole.Text);
                        cmd.Parameters.AddWithValue("@Phone", cleanPhone);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                        cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);

                        // THE FIX: Giving the stored procedure the empty ProfilePicture it is asking for!
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
                        using (SqlCommand cmd = new SqlCommand("DELETE FROM Trainer WHERE TrainerId = @Id", con))
                        {
                            cmd.Parameters.AddWithValue("@Id", id);
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
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM Trainer WHERE TrainerId = @Id", con))
                    {
                        cmd.Parameters.AddWithValue("@Id", id);
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
                    string updateSql = "UPDATE Trainer SET FirstName=@FirstName, LastName=@LastName, Role=@Role, Phone=@Phone, Email=@Email, Description=@Desc, Status=@Status WHERE TrainerId=@Id";
                    using (SqlCommand cmd = new SqlCommand(updateSql, con))
                    {
                        cmd.Parameters.AddWithValue("@FirstName", txtEditFirstName.Text);
                        cmd.Parameters.AddWithValue("@LastName", txtEditLastName.Text);
                        cmd.Parameters.AddWithValue("@Role", txtEditRole.Text);
                        cmd.Parameters.AddWithValue("@Phone", cleanEditPhone);
                        cmd.Parameters.AddWithValue("@Email", txtEditEmail.Text);
                        cmd.Parameters.AddWithValue("@Desc", txtEditDescription.Text);
                        cmd.Parameters.AddWithValue("@Status", ddlEditStatus.SelectedValue);
                        cmd.Parameters.AddWithValue("@Id", hfEditId.Value);

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