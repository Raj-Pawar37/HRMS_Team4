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
    public partial class AddMasterEvent : Page
    {
        private static string cs =
            ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEventTypes();
            }
        }

        private void LoadEventTypes()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand("SP_EventTypes_ReadAll", con);

                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();
                da.Fill(dt);

                gvEventTypes.DataSource = dt;
                gvEventTypes.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd =
                        new SqlCommand("SP_EventTypes_Create", con);

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue( "@Name",txtEventTypeName.Text.Trim());

                    cmd.Parameters.AddWithValue( "@Color",txtColor.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                txtEventTypeName.Text = "";
                txtColor.Text = "#563d7c";

                LoadEventTypes();

                ScriptManager.RegisterStartupScript(this, GetType(), "msg", "alert('Event Type Added Successfully');",true); 
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "msg","alert('" + ex.Message.Replace("'", "") + "');",true);
            }
        }

        protected void gvEventTypes_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteType")
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);

                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        SqlCommand cmd =
                            new SqlCommand("SP_EventTypes_Delete", con);

                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@Id", id);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }

                    LoadEventTypes();

                    ScriptManager.RegisterStartupScript(this, GetType(), "msg", "alert('Event Type Deleted Successfully');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "msg", "alert('" + ex.Message.Replace("'", "") + "');",true);
                }
            }
        }
    }
}