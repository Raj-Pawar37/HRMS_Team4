using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.User
{
    public partial class Payslip : System.Web.UI.Page
    {
        SqlConnection con;
        int SessionUserId = 32;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString);
            con.Open();
            if (!IsPostBack)
            {
                BindPayslips();
            }
        }

        private void BindPayslips()
        {
            SqlCommand cmd = new SqlCommand("sp_Payslip_GetByUser", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", SessionUserId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                gvPayslips.DataSource = dt;
                gvPayslips.DataBind();

                //gvPayslips.UseAccessibleHeader = true;
                //gvPayslips.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            else
            {


            }
        }

        protected void gvPayslips_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewPayslip" || e.CommandName == "DownloadPayslip")
            {
                int payslipId = 37;
                //int payslipId = Convert.ToInt32(e.CommandArgument);

                Response.Redirect("~/Admin/Payslips.aspx?PayslipId=" + payslipId);
            }
        }
    }
}