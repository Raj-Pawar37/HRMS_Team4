using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class TrainersType : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTrainingTypes();
            }
        }

        private void BindTrainingTypes(string filter = "Recently Added")
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand("sp_TrainingTypes_GetAll", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Filter", filter); // Pass the filter to SQL

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptTrainingTypes.DataSource = dt;
                        rptTrainingTypes.DataBind();
                    }
                }
            }
        }

        protected void SortFilter_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string selectedFilter = btn.CommandArgument;

            lblSortText.InnerText = "Sort By : " + selectedFilter;
            BindTrainingTypes(selectedFilter);
        }

        protected void btnAddTrainingType_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_TrainingType_Insert", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TrainingTypeName", txtTrainingType.Text);
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                        cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindTrainingTypes();
                txtTrainingType.Text = "";
                txtDescription.Text = "";
                ddlStatus.SelectedIndex = 0;

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "setTimeout(function(){ alert('SUCCESS! Training Type was added.'); }, 100);", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "errorAlert", "alert('ERROR: " + ex.Message.Replace("'", "\\'") + "');", true);
            }
        }

        protected void rptTrainingTypes_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Delete")
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(conn))
                    {
                        using (SqlCommand cmd = new SqlCommand("sp_DeleteTrainingType", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@TrainingTypeId", id);
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                    BindTrainingTypes();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "setTimeout(function(){ alert('DELETED! Training Type was permanently removed.'); }, 100);", true);
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
                    using (SqlCommand cmd = new SqlCommand("sp_TrainingType_GetById", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TrainingTypeId", id);
                        con.Open();
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                txtEditType.Text = dr["TrainingTypeName"].ToString();
                                txtEditDescription.Text = dr["Description"].ToString();
                                ddlEditStatus.SelectedValue = dr["Status"].ToString();
                            }
                        }
                    }
                }
                ClientScript.RegisterStartupScript(this.GetType(), "pop", "setTimeout(function(){ $('#edit_training_type').modal('show'); }, 100);", true);
            }
        }

        protected void btnUpdateTrainingType_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conn))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_TrainingType_Update", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TrainingTypeName", txtEditType.Text);
                        cmd.Parameters.AddWithValue("@Description", txtEditDescription.Text);
                        cmd.Parameters.AddWithValue("@Status", ddlEditStatus.SelectedValue);
                        cmd.Parameters.AddWithValue("@TrainingTypeId", hfEditId.Value);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindTrainingTypes();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "setTimeout(function(){ alert('UPDATED! Training Type was successfully updated.'); }, 100);", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "errorAlert", "alert('ERROR: " + ex.Message.Replace("'", "\\'") + "');", true);
            }
        }
    }
}