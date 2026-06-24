using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class TimeSheet : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(
               ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString);

            con.Open();
            if (!IsPostBack)
            {
                BindTimesheets();
            }
        }

        private void BindTimesheets()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("sp_Timesheets_Select", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    da.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.UseAccessibleHeader = true;
                        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.Replace("'", "") + "')</script>");
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            UpdateStatus("Approved");
            Response.Write("<script>alert('Selected Timesheet Approved Successfully!!')</script>");
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            UpdateStatus("Rejected");
            Response.Write("<script>alert('Selected Timesheet Rejected Successfully!!')</script>");
        }

        private void UpdateStatus(string status)
        {
            string ids = "";

            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl("chkSelect");
                HiddenField hf = (HiddenField)row.FindControl("hfId");

                if (chk != null && chk.Checked)
                {
                    ids += hf.Value + ",";
                }
            }

            if (ids.EndsWith(","))
                ids = ids.Substring(0, ids.Length - 1);

            if (ids == "")
                return;

            string query = "EXEC sp_Timesheet_BulkUpdateStatus '" + ids + "', '" + status + "'";

           
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
               
            

            BindTimesheets();
        }



    }
}