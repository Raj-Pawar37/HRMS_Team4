using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Admin
{
    public partial class LeaveSetting : System.Web.UI.Page
    {
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["db"].ConnectionString);
            con.Open();

            if (!IsPostBack)
            {
                BindRepeater();
            }
        }

        public void BindRepeater()
        {
            SqlDataAdapter da = new SqlDataAdapter("sp_MasterLeaveTypes_Select",con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        protected void chkStatus_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;

            if (chk.Checked)
            {
                Response.Write("<script>alert('Active');</script>");
            }
            else
            {
                Response.Write("<script>alert('Inactive');</script>");
            }
        }
    }
}