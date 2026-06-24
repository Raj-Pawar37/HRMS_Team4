using System;
using System.Data;

namespace HRMS_Team4
{
    public partial class Timesheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("Employee");
            dt.Columns.Add("CreatedAt");
            dt.Columns.Add("Project");
            dt.Columns.Add("Hours");
            dt.Columns.Add("Status");

            dt.Rows.Add("Ram Kheloji", "28-02-2025", "Hospital", "3", "Rejected");
            dt.Rows.Add("Ram Kheloji", "14-02-2025", "Restaurant", "6", "Rejected");
            dt.Rows.Add("Nitesh N", "05-03-2025", "Estate", "5", "Approved");

            gvTimesheet.DataSource = dt;
            gvTimesheet.DataBind();
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {

        }

        protected void btnReject_Click(object sender, EventArgs e)
        {

        }
    }
}