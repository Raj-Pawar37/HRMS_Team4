using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HRMS_Team4.Admin
{
    public partial class Payslip : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int userId;

                if (Request.QueryString["UserId"] != null &&
                    int.TryParse(Request.QueryString["UserId"], out userId))
                {
                    int month = DateTime.Now.Month;
                    int year = DateTime.Now.Year;

                    LoadBasicInfo(userId, month, year);
                    LoadEarnings(userId);
                    LoadDeductions(userId);
                }
            }
        }

        private void LoadBasicInfo(int userId, int month, int year)
        {
            SqlCommand cmd = new SqlCommand("SP_Payslip_BasicInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@Month", month);
            cmd.Parameters.AddWithValue("@Year", year);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                DataRow r = dt.Rows[0];

                lblName.Text = r["FirstName"].ToString();
                lblEmail.Text = r["Email"].ToString();
                lblPhone.Text = r["PhoneNumber"].ToString();

                lblCompanyName.Text = r["OrganizationName"].ToString();
                lblCompanyEmail.Text = r["OrganizationEmail"].ToString();
                lblCompanyPhone.Text = r["OrganizationPhone"].ToString();

                lblHours.Text = r["WorkedHours"].ToString();

                lblRate.Text = Convert.ToDecimal(r["HourlyPay"])
                                     .ToString("0.00");

                lblNetSalary.Text = Convert.ToDecimal(r["EarnedSalary"])
                                        .ToString("0.00");

                lblNetText.Text = lblNetSalary.Text;

                lblMonth.Text = new DateTime(year, month, 1)
                                    .ToString("MMMM yyyy");
            }
        }

        private void LoadEarnings(int userId)
        {
            SqlCommand cmd = new SqlCommand("SP_EmployeeEarnings_ReadByUserId", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", userId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            decimal total = 0;

            foreach (DataRow row in dt.Rows)
            {
                total += Convert.ToDecimal(row["EarningAmount"]);
            }

            lblBonus.Text = total.ToString("0.00");
            lblTotalEarning.Text = total.ToString("0.00");
        }
        private void LoadDeductions(int userId)
        {
            SqlCommand cmd = new SqlCommand("SP_EmployeeDeductions_ReadByUserId", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", userId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            decimal total = 0;

            foreach (DataRow row in dt.Rows)
            {
                total += Convert.ToDecimal(row["DeductionAmount"]);
            }

            lblTax.Text = total.ToString("0.00");
            lblTotalDeduction.Text = total.ToString("0.00");
        }

        //private void LoadPayslip(int empId)
        //{
        //    SqlCommand cmd = new SqlCommand(@"
        //        SELECT 
        //            u.FirstName,
        //            u.LastName,
        //            u.Email,
        //            u.PhoneNumber,

        //            ep.Designation,

        //            s.Bonus,
        //            s.Tax,
        //            s.NetSalary,
        //            s.WorkedHours,

        //            o.OrganizationName,
        //            o.OrganizationEmail,
        //            o.OrganizationPhone,

        //            p.CurrencyType

        //        FROM [User] u
        //        INNER JOIN EmployeeSalaries s ON u.UserId = s.UserId
        //        LEFT JOIN EmployeePerformances ep ON u.UserId = ep.EmployeeId
        //        CROSS JOIN Organization o
        //        LEFT JOIN AllProjects p ON p.EmployeeId = u.UserId

        //        WHERE u.UserId = @UserId
        //    ", con);

        //    cmd.Parameters.AddWithValue("@UserId", empId);

        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);

        //    if (dt.Rows.Count == 0)
        //    {
        //        Response.Write("<script>alert('No payslip data found');</script>");
        //        return;
        //    }

        //    DataRow r = dt.Rows[0];

        //     ================= EMPLOYEE INFO =================
        //    lblName.Text = r["FirstName"] + " " + r["LastName"];
        //    lblEmail.Text = r["Email"].ToString();
        //    lblPhone.Text = r["PhoneNumber"].ToString();
        //    lblDesignation.Text = r["Designation"].ToString();

        //    // ================= ORGANIZATION INFO =================
        //    lblCompanyName.Text = r["OrganizationName"].ToString();
        //    lblCompanyEmail.Text = r["OrganizationEmail"].ToString();
        //    lblCompanyPhone.Text = r["OrganizationPhone"].ToString();

        //    // ================= CURRENCY =================
        //    string currency = r["CurrencyType"] == DBNull.Value ? "INR" : r["CurrencyType"].ToString();

        //    // ================= SALARY =================
        //    decimal bonus = r["Bonus"] == DBNull.Value ? 0 : Convert.ToDecimal(r["Bonus"]);
        //    decimal tax = r["Tax"] == DBNull.Value ? 0 : Convert.ToDecimal(r["Tax"]);
        //    decimal net = r["NetSalary"] == DBNull.Value ? 0 : Convert.ToDecimal(r["NetSalary"]);
        //    int hours = r["WorkedHours"] == DBNull.Value ? 0 : Convert.ToInt32(r["WorkedHours"]);

        //    // ================= BINDING =================
        //    lblBonus.Text = bonus.ToString("0.00");
        //    lblTax.Text = tax.ToString("0.00");
        //    lblTotalEarning.Text = bonus.ToString("0.00");
        //    lblTotalDeduction.Text = tax.ToString("0.00");

        //    lblNetSalary.Text = currency + " " + net.ToString("0.00");
        //    lblNetText.Text = currency + " " + net.ToString("0.00");

        //    lblHours.Text = hours.ToString();
        //}
    }
}