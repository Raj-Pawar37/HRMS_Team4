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
    public partial class GeneratePayslip : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString);
            con.Open();
            if (!IsPostBack)
            {
                LoadEmployees();
            }
        }
        private void LoadEmployees()
        {
            SqlCommand cmd = new SqlCommand("SELECT UserId, FirstName + ' ' + LastName AS Name FROM [User]", con);
            SqlDataReader dr = cmd.ExecuteReader();

                ddlEmployee.DataSource = dr;
                ddlEmployee.DataTextField = "Name";
                ddlEmployee.DataValueField = "UserId";
                ddlEmployee.DataBind();

                ddlEmployee.Items.Insert(0, new ListItem("-- Select Employee --", ""));
            
        }
        //protected void btnGeneratePayslip_Click(object sender, EventArgs e)
        //{
        //    int userId = Convert.ToInt32(ddlEmployee.SelectedValue);
        //    string month = ddlMonth.SelectedValue;
        //    int year = Convert.ToInt32(txtYear.Text);

        //    string query = "EXEC sp_GeneratePayslip " +
        //                   userId + ", '" +
        //                   month + "', " +
        //                   year;


        //        SqlCommand cmd = new SqlCommand(query, con);

        //        cmd.ExecuteNonQuery();

        //    Response.Write("<script>alert('Generate Successfully!!')</script>");


        //}

        protected void btnGeneratePayslip_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(ddlEmployee.SelectedValue);
            string month = ddlMonth.SelectedValue;
            int year = Convert.ToInt32(txtYear.Text);

            string payslipPath = "/Payslips/" + userId + "_" + month + "_" + year + ".pdf";

            string query = "EXEC sp_GeneratePayslip " +
                           userId + ", '" +
                           month + "', " +
                           year + ", '" +
                           payslipPath + "'";

            SqlCommand cmd = new SqlCommand(query, con);

          
            cmd.ExecuteNonQuery();
           

            Response.Write("<script>alert('Generated Successfully!!');</script>");
        }
    }

}