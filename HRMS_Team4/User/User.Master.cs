using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRMS_Team4.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["RoleId"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            int roleId = Convert.ToInt32(Session["RoleId"]);

            if (roleId == 3)
            {
                Response.Redirect("~/Admin/Dashboard.aspx");
            }
            else if (roleId == 8)
            {
                Response.Redirect("~/Manager/TaskBoard.aspx");
            }
        }




        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();      // Remove all session values
            Session.Abandon();    // Destroy session

            Response.Redirect("~/Account/Login.aspx");
        }
    }
}