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
    public partial class LeaveType : System.Web.UI.Page
    {
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["db"].ConnectionString);
            con.Open();

            if (!IsPostBack)
            {
                Panel1.Visible = false;
                BindGrid();
                Fetch();
            }
        }

       

        public void BindGrid()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "sp_MasterLeaveTypes_Select",
                con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            TextBox1.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(
                    "EXEC sp_MasterLeaveTypes_Insert '" + TextBox1.Text + "'", con);

             
                cmd.ExecuteNonQuery();
              
                TextBox1.Text = "";
                Panel1.Visible = false;

                BindGrid();

                Response.Write("<script>alert('Leave Type Added Successfully');</script>");
            }
            catch (Exception ex)
            {
           
                Response.Write("<script>alert('" + ex.Message.Replace("'", "") + "');</script>");
            }
        }


        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            int id = Convert.ToInt32(btn.CommandArgument);

            try
            {
                SqlCommand cmd = new SqlCommand(
                    "exec sp_MasterLeaveTypes_Delete " + id, con);

                cmd.ExecuteNonQuery();

                BindGrid();

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "msg",
                    "alert('Deleted Successfully');",
                    true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "msg",
                    "alert('" + ex.Message.Replace("'", "") + "');",
                    true);
            }
        }

        public void Fetch()
        {
            if (GridView1.Rows.Count > 0)
            {
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string leave=TextBox2.Text;
         try
            {
                SqlCommand cmd = new SqlCommand("exec sp_MasterLeaveTypes_Search '"+leave+"'  ", con);

                SqlDataReader dr= cmd.ExecuteReader();
                GridView1.DataSource = dr;
                GridView1.DataBind();
                

               // BindGrid();

                //Response.Write("<script>alert(' Deleted Successfully');</script>");
            }
            catch (Exception ex)
            {
                        Response.Write("<script>alert('" +
                    ex.Message.Replace("'", "") +
                    "');</script>");
            }   
        }
    }
}