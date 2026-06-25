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
    public partial class PayslipReport : System.Web.UI.Page
    {
        string cs =
            ConfigurationManager
            .ConnectionStrings["Pulse360_FinalDb"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCards();
                LoadChart();
                LoadList();
            }
        }

        private void LoadCards()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "sp_PayslipReport_Cards",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                con.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblTotalPayroll.Text =
                        dr["TotalPayroll"].ToString();

                    lblDeductions.Text =
                        dr["Deductions"].ToString();

                    lblAllowances.Text =
                        dr["Allowances"].ToString();

                    lblNetPay.Text =
                        dr["NetPay"].ToString();
                }
            }
        }

        private void LoadChart()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "sp_PayslipReport_Chart",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue(
                    "@Year",
                    2025);

                con.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                while (dr.Read())
                {
                    string month =
                        dr["Month"].ToString();

                    string amount =
                        dr["PayrollAmount"].ToString();

                    switch (month)
                    {
                        case "January":
                            hfJan.Value = amount;
                            break;

                        case "February":
                            hfFeb.Value = amount;
                            break;

                        case "March":
                            hfMar.Value = amount;
                            break;

                        case "April":
                            hfApr.Value = amount;
                            break;

                        case "May":
                            hfMay.Value = amount;
                            break;

                        case "June":
                            hfJun.Value = amount;
                            break;

                        case "July":
                            hfJul.Value = amount;
                            break;

                        case "August":
                            hfAug.Value = amount;
                            break;

                        case "September":
                            hfSep.Value = amount;
                            break;

                        case "October":
                            hfOct.Value = amount;
                            break;

                        case "November":
                            hfNov.Value = amount;
                            break;

                        case "December":
                            hfDec.Value = amount;
                            break;
                    }
                }
            }
        }

        private void LoadList()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "sp_PayslipReport_List",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                gvPayslipReport.DataSource = dt;
                gvPayslipReport.DataBind();
            }
        }
    }
}