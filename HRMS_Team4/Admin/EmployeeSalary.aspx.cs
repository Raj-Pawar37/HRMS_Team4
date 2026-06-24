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
    public partial class EmployeeSalary : System.Web.UI.Page
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
            try
            {
               // SqlCommand cmd = new SqlCommand("sp_Employee_Select", con);
                SqlCommand cmd = new SqlCommand("EXEC sp_Employee_Select", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);


               // SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        ddlEmployee.DataSource = dt;
                        ddlEmployee.DataTextField = "Name";
                        ddlEmployee.DataValueField = "UserId";
                        ddlEmployee.DataBind();

                        ddlEmployee.Items.Insert(0,new System.Web.UI.WebControls.ListItem("-- Select Employee --", ""));
                   
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" +
                    ex.Message.Replace("'", "") + "')</script>");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlEmployee.SelectedIndex == 0)
                {
                    Response.Write("<script>alert('Select Employee')</script>");
                    return;
                }
               

                SqlCommand cmd = new SqlCommand(
                    "EXEC sp_EmployeeSalary_Insert " +
                    ddlEmployee.SelectedValue + "," +
                    txtSalary.Text, con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    int salaryId = Convert.ToInt32(dt.Rows[0]["SalaryId"]);

                    Response.Write("<script>alert('Salary Saved Successfully. ID: " +
                        salaryId + "')</script>");
                }
                ClearForm();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" +
                    ex.Message.Replace("'", "") + "')</script>");
            }
        }

        protected void txtSalary_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlEmployee.SelectedIndex == 0) return;

                decimal salary = Convert.ToDecimal(txtSalary.Text);

                SqlCommand cmd = new SqlCommand("sp_SalaryStructure_Get", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@UserId", SqlDbType.Int).Value =
                    Convert.ToInt32(ddlEmployee.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                decimal totalEarnings = 0;
                decimal totalDeductions = 0;

                foreach (DataRow r in dt.Rows)
                {
                    decimal percentage = Convert.ToDecimal(r["Percentage"]);
                    decimal amount = salary * percentage / 100;

                    if (r["Type"].ToString() == "EARNING")
                        totalEarnings += amount;
                    else
                        totalDeductions += amount;
                }

                txtBonus.Text = totalEarnings.ToString("0.00");   // optional display
                txtTax.Text = totalDeductions.ToString("0.00");   // optional display
                txtProfit.Text = "0.00"; // if not separated in DB
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" +
                    ex.Message.Replace("'", "") + "')</script>");
            }
        }

        private void ClearForm()
        {
            ddlEmployee.SelectedIndex = 0;
            txtSalary.Text = "";
            txtBonus.Text = "";
            txtProfit.Text = "";
            txtTax.Text = "";
        }
    }
}