using HRMS_Team4.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.Manager
{
    public partial class TaskBoard : System.Web.UI.Page
    {

        DataTable dtTasks;
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                BindTaskBoard();
            }
        }

        private void BindTaskBoard()
        {
            SqlDataAdapter da = new SqlDataAdapter("SP_TaskBoard_ReadAll", conn);
            DataSet ds = new DataSet();
            da.Fill(ds);

            dtTasks = ds.Tables[1];

            rptProjects.DataSource = ds.Tables[0];
            rptProjects.DataBind();



            //Binding Dropdown 

            ddlProject.DataSource = ds.Tables[0];
            ddlProject.DataTextField = "ProjectName";
            ddlProject.DataValueField = "ProjectId";
            ddlProject.DataBind();

            ddlProject.Items.Insert(0, new ListItem("Select Project", ""));

        }


        protected void rptProjects_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int projectId = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "ProjectId"));

                BindInnerRepeater(e, projectId, "Pending", "rptPending");
                BindInnerRepeater(e, projectId, "Inprogress", "rptInprogress");
                BindInnerRepeater(e, projectId, "Onhold", "rptOnhold");
                BindInnerRepeater(e, projectId, "Completed", "rptCompleted");
            }
        }

        private void BindInnerRepeater(RepeaterItemEventArgs e, int projectId, string status, string rptId)
        {
            Repeater rpt = (Repeater)e.Item.FindControl(rptId);

            DataView dv = new DataView(dtTasks);
            dv.RowFilter = "ProjectId = " + projectId + " AND Status = '" + status + "'";

            rpt.DataSource = dv;
            rpt.DataBind();
        }






        //Modal LOgic 

        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            int projectId = Convert.ToInt32(ddlProject.SelectedValue);

            BindTask(projectId);


        }



        public void BindTask(int projectId)
        {
            SqlCommand cmd = new SqlCommand("SP_Task_ReadByProjectId", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProjectId", projectId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlTask.DataSource = dt;
            ddlTask.DataTextField = "Title";
            ddlTask.DataValueField = "TaskId";
            ddlTask.DataBind();

            ddlTask.Items.Insert(0, new ListItem("Select Task", ""));
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            TaskBoardDTO d = new TaskBoardDTO();

            d.ProjectId = Convert.ToInt32(ddlProject.SelectedValue);
            d.TaskId = Convert.ToInt32(ddlTask.SelectedValue);
            d.Percentage = Convert.ToInt32(txtPercentage.Text);
            d.DueDate = Convert.ToDateTime(txtDueDate.Text);

            TaskBoard_CreateOrUpdate(d);

            ClearTaskBoardModal();
            BindTaskBoard();
        }


        public void ClearTaskBoardModal()
        {

            ddlProject.SelectedIndex = 0;
            ddlTask.Items.Clear();
            ddlTask.Items.Insert(0, new ListItem("Select Task", ""));
            txtPercentage.Text = "";
            txtDueDate.Text = "";
            btnSave.Text = "Save";
        }














































        //Database FUcntions

        public void TaskBoard_CreateOrUpdate(TaskBoardDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_TaskBoard_CreateOrUpdate", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProjectId", d.ProjectId);
            cmd.Parameters.AddWithValue("@TaskId", d.TaskId);
            cmd.Parameters.AddWithValue("@Percentage", d.Percentage);
            cmd.Parameters.AddWithValue("@DueDate", d.DueDate);

            cmd.ExecuteNonQuery();
        }


    }
}