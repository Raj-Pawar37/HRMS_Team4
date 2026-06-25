using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class Promotion1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDesignation();
                LoadPromotion();
            }
        }

        private void LoadPromotion()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SP_Promotion_ReadAll", con);
                cmd.CommandType = CommandType.StoredProcedure;

                DataTable dt = new DataTable();
                new SqlDataAdapter(cmd).Fill(dt);

                GridPromotion.DataSource = dt;
                GridPromotion.DataBind();
                GridPromotion.Visible = dt.Rows.Count > 0;
            }
        }

        private void LoadDesignation()
        {
            ddlDesignationFrom.Items.Clear();
            ddlDesignationTo.Items.Clear();

            string[] designations = { "Sales", "Software Developer", "Trainee", "Junior Developer", "Senior Developer" };

            foreach (string d in designations)
            {
                ddlDesignationFrom.Items.Add(new ListItem(d, d));
                ddlDesignationTo.Items.Add(new ListItem(d, d));
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUserID.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "msg",
                    "alert('Please enter User ID.');", true);
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd;
                bool isNew = string.IsNullOrEmpty(hfPromotionId.Value);

                if (isNew)
                {
                    cmd = new SqlCommand("SP_Promotion_Create", con);
                }
                else
                {
                    cmd = new SqlCommand("SP_Promotion_Update", con);
                    cmd.Parameters.AddWithValue("@PromotionId", Convert.ToInt32(hfPromotionId.Value));
                }

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(txtUserID.Text));
                cmd.Parameters.AddWithValue("@DesignationFrom", ddlDesignationFrom.SelectedValue);
                cmd.Parameters.AddWithValue("@DesignationTo", ddlDesignationTo.SelectedValue);
                cmd.Parameters.AddWithValue("@Date", txtPromotionDate.Text);

                con.Open();
                cmd.ExecuteNonQuery();

                string msg = isNew ? "Promotion Added Successfully" : "Promotion Updated Successfully";
                hfPromotionId.Value = "";

                ScriptManager.RegisterStartupScript(this, GetType(), "msg",
                    $"alert('{msg}');", true);

            }

            LoadPromotion();
        }

        protected void gvPromotion_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int promotionId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "DeleteRow")
                DeletePromotion(promotionId);

            if (e.CommandName == "EditRow")
                EditPromotion(promotionId);
        }


        private void DeletePromotion(int promotionId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SP_Promotion_Delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PromotionId", promotionId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadPromotion();
        }


        private void EditPromotion(int promotionId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM Promotion WHERE PromotionId=@PromotionId", con);
                cmd.Parameters.AddWithValue("@PromotionId", promotionId);

                DataTable dt = new DataTable();
                new SqlDataAdapter(cmd).Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    string desigFrom = dt.Rows[0]["DesignationFrom"].ToString();
                    string desigTo = dt.Rows[0]["DesignationTo"].ToString();

                    hfPromotionId.Value = dt.Rows[0]["PromotionId"].ToString();
                    txtUserID.Text = dt.Rows[0]["UserID"].ToString();
                    txtPromotionDate.Text = Convert.ToDateTime(dt.Rows[0]["Date"]).ToString("yyyy-MM-dd");


                    if (ddlDesignationFrom.Items.FindByValue(desigFrom) != null)
                        ddlDesignationFrom.SelectedValue = desigFrom;

                    if (ddlDesignationTo.Items.FindByValue(desigTo) != null)
                        ddlDesignationTo.SelectedValue = desigTo;


                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModal",
                        @"setTimeout(function() {
                            document.getElementById('promotionModalLabel').innerText = 'Edit Promotion';
                            var existingModal = bootstrap.Modal.getInstance(document.getElementById('promotionModal'));
                            if (existingModal) { existingModal.dispose(); }
                            new bootstrap.Modal(document.getElementById('promotionModal')).show();
                        }, 100);", true);
                }
            }
        }


        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SP_Promotion_ReadAll", con);
                cmd.CommandType = CommandType.StoredProcedure;

                DataTable dt = new DataTable();
                new SqlDataAdapter(cmd).Fill(dt);

                dt.DefaultView.RowFilter = $"EmployeeName LIKE '%{txtSearch.Text.Replace("'", "''")}%'";

                GridPromotion.DataSource = dt.DefaultView;
                GridPromotion.DataBind();
            }
        }
    }
}