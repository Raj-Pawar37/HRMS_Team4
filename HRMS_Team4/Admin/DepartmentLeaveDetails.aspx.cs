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
    public partial class DepartmentLeaveDetails : System.Web.UI.Page
    {
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString);
            con.Open();

            if (!IsPostBack)
            {

                LoadLeaves();
            }
        }

        private void LoadLeaves()
        {
            SqlCommand cmd = new SqlCommand("sp_DepartmentLeaves_Select", con);
            SqlDataReader dr = cmd.ExecuteReader();

            GridView1.DataSource = dr;
            GridView1.DataBind();
            Fetch();
        }

        protected void LnkDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            int id = int.Parse(btn.CommandArgument.ToString());
           
            try
            {
                SqlCommand cmd = new SqlCommand("exec sp_DepartmentLeaves_Delete '" + id + "' ", con);

                cmd.ExecuteNonQuery();
                LoadLeaves();
                Fetch();
                Response.Write("<script>alert(' Deleted Successfully');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.Replace("'", "") + "');</script>");
            }

        }

        public void Fetch() {
            if (GridView1.Rows.Count > 0)
            {
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        }
    } 