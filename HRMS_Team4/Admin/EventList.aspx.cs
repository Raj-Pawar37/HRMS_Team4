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
    public partial class EventList : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEventTypes();
                LoadEvents();
            }
        }

        private void LoadEvents()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SP_Events_ReadAll", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvEvents.DataSource = dt;
                gvEvents.DataBind();
            }
        }

        private void LoadEventTypes()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SP_EventTypes_ReadAll", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlEventType.DataSource = dt;
                ddlEventType.DataTextField = "Name";
                ddlEventType.DataValueField = "Id";
                ddlEventType.DataBind();
                ddlEventType.Items.Insert(0, new ListItem("Select Event Type", ""));

                ddlEditType.DataSource = dt;
                ddlEditType.DataTextField = "Name";
                ddlEditType.DataValueField = "Id";
                ddlEditType.DataBind();
                ddlEditType.Items.Insert(0, new ListItem("Select Event Type", ""));
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SP_Events_Create", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Title", txtEventTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@Date", Convert.ToDateTime(txtEventDate.Text));
                cmd.Parameters.AddWithValue("@EventTypeId", ddlEventType.SelectedValue);
                cmd.Parameters.AddWithValue("@Status", "Active");

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadEvents();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int eventId = Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT Id, Title, Date, EventTypeId FROM Events WHERE Id=@Id", con);

                cmd.Parameters.AddWithValue("@Id", eventId);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    hfEventId.Value = dr["Id"].ToString();
                    txtEditTitle.Text = dr["Title"].ToString();
                    txtEditDate.Text = Convert.ToDateTime(dr["Date"]).ToString("yyyy-MM-dd");
                    ddlEditType.SelectedValue = dr["EventTypeId"].ToString();
                }
            }

            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "EditModal",
                "$('#editEventModal').modal('show');",
                true);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    @"UPDATE Events
                      SET Title=@Title,
                          Date=@Date,
                          EventTypeId=@EventTypeId
                      WHERE Id=@Id", con);

                cmd.Parameters.AddWithValue("@Id", hfEventId.Value);
                cmd.Parameters.AddWithValue("@Title", txtEditTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@Date", Convert.ToDateTime(txtEditDate.Text));
                cmd.Parameters.AddWithValue("@EventTypeId", ddlEditType.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadEvents();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int eventId = Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM Events WHERE Id=@Id", con);

                cmd.Parameters.AddWithValue("@Id", eventId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadEvents();
        }
    }
}