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

namespace HRMS_Team4.Admin
{
    public partial class EmployeeDetails : System.Web.UI.Page
    {
        SqlConnection conn;
        private int UserId = 40;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Pulse360_FinalDb"].ConnectionString.ToString();
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                EducationDetails_ReadAll();
                Experience_ReadAll();
                EmployeeFamilyDetails_ReadAll();
                EmployeeBankDetails_ReadAll();
            }
        }

        public void ShowToast(string message, string type)
        {
            string script = $@"
                setTimeout(function() {{
                    toastr.{type}('{message}');
                }}, 300);
            ";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "toast", script, true);
        }






























        //Database Fucntions 

        public void Experience_Create(ExperienceDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_Experience_Create", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@DesignationName", d.DesignationName);
            cmd.Parameters.AddWithValue("@FromDate", d.FromDate);
            cmd.Parameters.AddWithValue("@ToDate", d.ToDate);
            cmd.Parameters.AddWithValue("@UserId", d.UserId);
            cmd.Parameters.AddWithValue("@CompanyName", d.CompanyName);

            cmd.ExecuteNonQuery();
        }

        public void Experience_Update(ExperienceDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_Experience_Update", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ExperienceId", d.ExperienceId);
            cmd.Parameters.AddWithValue("@DesignationName", d.DesignationName);
            cmd.Parameters.AddWithValue("@FromDate", d.FromDate);
            cmd.Parameters.AddWithValue("@ToDate", d.ToDate);
            cmd.Parameters.AddWithValue("@UserId", d.UserId);
            cmd.Parameters.AddWithValue("@CompanyName", d.CompanyName);

            cmd.ExecuteNonQuery();
        }

        public void Experience_Delete(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_Experience_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ExperienceId", id);

            cmd.ExecuteNonQuery();
        }

        public ExperienceDTO Experience_ReadById(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_Experience_ReadById", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ExperienceId", id);

            SqlDataReader rdr = cmd.ExecuteReader();

            ExperienceDTO d = new ExperienceDTO();

            if (rdr.Read())
            {
                d.ExperienceId = Convert.ToInt32(rdr["ExperienceId"]);
                d.DesignationName = rdr["DesignationName"].ToString();
                d.CompanyName = rdr["CompanyName"].ToString();
                d.UserId = Convert.ToInt32(rdr["UserId"]);
                d.FromDate = Convert.ToDateTime(rdr["FromDate"]);
                d.ToDate = Convert.ToDateTime(rdr["ToDate"]);
            }

            rdr.Close();
            return d;
        }








        public void EducationDetails_Create(EducationDetailsDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_EducationDetails_Create", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@EducationType", d.EducationType);
            cmd.Parameters.AddWithValue("@UniversityName", d.UniversityName);
            cmd.Parameters.AddWithValue("@UserId", d.UserId);
            cmd.Parameters.AddWithValue("@StartDate", d.StartDate);
            cmd.Parameters.AddWithValue("@EndDate", d.EndDate);

            cmd.ExecuteNonQuery();
        }

        public void EducationDetails_Update(EducationDetailsDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_EducationDetails_Update", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@EducationDetailsId", d.EducationDetailsId);
            cmd.Parameters.AddWithValue("@EducationType", d.EducationType);
            cmd.Parameters.AddWithValue("@UniversityName", d.UniversityName);
            cmd.Parameters.AddWithValue("@UserId", d.UserId);
            cmd.Parameters.AddWithValue("@StartDate", d.StartDate);
            cmd.Parameters.AddWithValue("@EndDate", d.EndDate);

            cmd.ExecuteNonQuery();
        }

        public void EducationDetails_Delete(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_EducationDetails_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@EducationDetailsId", id);

            cmd.ExecuteNonQuery();
        }

        public EducationDetailsDTO EducationDetails_ReadById(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_EducationDetails_ReadById", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@EducationDetailsId", id);

            SqlDataReader rdr = cmd.ExecuteReader();

            EducationDetailsDTO d = new EducationDetailsDTO();

            if (rdr.Read())
            {
                d.EducationDetailsId = Convert.ToInt32(rdr["EducationDetailsId"]);
                d.EducationType = rdr["EducationType"].ToString();
                d.UniversityName = rdr["UniversityName"].ToString();
                d.UserId = Convert.ToInt32(rdr["UserId"]);
                d.StartDate = Convert.ToDateTime(rdr["StartDate"]);
                d.EndDate = Convert.ToDateTime(rdr["EndDate"]);
            }

            rdr.Close();
            return d;
        }











        public void EmployeeBankDetails_Create(EmployeeBankDetailsDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_EmployeeBankDetails_Create", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@BankName", d.BankName);
            cmd.Parameters.AddWithValue("@AccountNumber", d.AccountNumber);
            cmd.Parameters.AddWithValue("@IFSCCode", d.IFSCCode);
            cmd.Parameters.AddWithValue("@BranchName", d.BranchName);
            cmd.Parameters.AddWithValue("@UserId", d.UserId);

            cmd.ExecuteNonQuery();
        }

        public void EmployeeBankDetails_Update(EmployeeBankDetailsDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_EmployeeBankDetails_Update", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@BankDetailId", d.BankDetailId);
            cmd.Parameters.AddWithValue("@BankName", d.BankName);
            cmd.Parameters.AddWithValue("@AccountNumber", d.AccountNumber);
            cmd.Parameters.AddWithValue("@IFSCCode", d.IFSCCode);
            cmd.Parameters.AddWithValue("@BranchName", d.BranchName);
            cmd.Parameters.AddWithValue("@UserId", d.UserId);

            cmd.ExecuteNonQuery();
        }

        public void EmployeeBankDetails_Delete(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_EmployeeBankDetails_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@BankDetailId", id);

            cmd.ExecuteNonQuery();
        }

        public EmployeeBankDetailsDTO EmployeeBankDetails_ReadById(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_EmployeeBankDetails_ReadById", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@BankDetailId", id);

            SqlDataReader rdr = cmd.ExecuteReader();

            EmployeeBankDetailsDTO d = new EmployeeBankDetailsDTO();

            if (rdr.Read())
            {
                d.BankDetailId = Convert.ToInt32(rdr["BankDetailId"]);
                d.BankName = rdr["BankName"].ToString();
                d.AccountNumber = rdr["AccountNumber"].ToString();
                d.IFSCCode = rdr["IFSCCode"].ToString();
                d.BranchName = rdr["BranchName"].ToString();
                d.UserId = Convert.ToInt32(rdr["UserId"]);
            }

            rdr.Close();
            return d;
        }








        public void EmployeeFamilyDetails_Create(EmployeeFamilyDetailsDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_EmployeeFamilyDetails_Create", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Name", d.Name);
            cmd.Parameters.AddWithValue("@Relation", d.Relation);
            cmd.Parameters.AddWithValue("@DateOfBirth", d.DateOfBirth);
            cmd.Parameters.AddWithValue("@Phone", d.Phone);
            cmd.Parameters.AddWithValue("@UserId", d.UserId);

            cmd.ExecuteNonQuery();
        }

        public void EmployeeFamilyDetails_Update(EmployeeFamilyDetailsDTO d)
        {
            SqlCommand cmd = new SqlCommand("SP_EmployeeFamilyDetails_Update", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FamilyDetailId", d.FamilyDetailId);
            cmd.Parameters.AddWithValue("@Name", d.Name);
            cmd.Parameters.AddWithValue("@Relation", d.Relation);
            cmd.Parameters.AddWithValue("@DateOfBirth", d.DateOfBirth);
            cmd.Parameters.AddWithValue("@Phone", d.Phone);
            cmd.Parameters.AddWithValue("@UserId", d.UserId);

            cmd.ExecuteNonQuery();
        }

        public void EmployeeFamilyDetails_Delete(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_EmployeeFamilyDetails_Delete", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FamilyDetailId", id);

            cmd.ExecuteNonQuery();
        }

        public EmployeeFamilyDetailsDTO EmployeeFamilyDetails_ReadById(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_EmployeeFamilyDetails_ReadById", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FamilyDetailId", id);

            SqlDataReader rdr = cmd.ExecuteReader();

            EmployeeFamilyDetailsDTO d = new EmployeeFamilyDetailsDTO();

            if (rdr.Read())
            {
                d.FamilyDetailId = Convert.ToInt32(rdr["FamilyDetailId"]);
                d.Name = rdr["Name"].ToString();
                d.Relation = rdr["Relation"].ToString();
                d.DateOfBirth = Convert.ToDateTime(rdr["DateOfBirth"]);
                d.Phone = rdr["Phone"].ToString();
                d.UserId = Convert.ToInt32(rdr["UserId"]);
            }

            rdr.Close();
            return d;
        }

















        protected void btnSaveBankDetails_Click(object sender, EventArgs e)
        {
            EmployeeBankDetailsDTO obj = new EmployeeBankDetailsDTO()
            {
                BankName = txtBankName.Text,
                AccountNumber = txtAccountNumber.Text,
                IFSCCode = txtIFSCCode.Text,
                BranchName = txtBranchName.Text,
                UserId = UserId
            };

            if (hfBankDetailId.Value == "")
            {
                EmployeeBankDetails_Create(obj);
                ShowToast("Bank details created successfully", "success");
            }
            else
            {
                obj.BankDetailId = int.Parse(hfBankDetailId.Value);
                EmployeeBankDetails_Update(obj);
                ShowToast("Bank details updated successfully", "success");
            }

            RefreshBankDetailsForm();
            EmployeeBankDetails_ReadAll();
        }

        public void EmployeeBankDetails_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_EmployeeBankDetails_ReadByUserId", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", UserId);

            SqlDataAdapter ada = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            ada.Fill(ds);

            rptBankDetails.DataSource = ds.Tables[0];
            rptBankDetails.DataBind();
        }
        private void RefreshBankDetailsForm()
        {
            hfBankDetailId.Value = "";

            txtBankName.Text = "";
            txtAccountNumber.Text = "";
            txtIFSCCode.Text = "";
            txtBranchName.Text = "";

            btnSaveBankDetails.Text = "Add Bank Details";
        }

        protected void rptBankDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditBank")
            {
                EmployeeBankDetailsDTO d = EmployeeBankDetails_ReadById(id);

                hfBankDetailId.Value = d.BankDetailId.ToString();
                txtBankName.Text = d.BankName;
                txtAccountNumber.Text = d.AccountNumber;
                txtIFSCCode.Text = d.IFSCCode;
                txtBranchName.Text = d.BranchName;

                btnSaveBankDetails.Text = "Update Bank Details";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "openBankModal",
                    "var myModal = new bootstrap.Modal(document.getElementById('editbankDetailsModal')); myModal.show();", true);
            }

            if (e.CommandName == "DeleteBank")
            {
                EmployeeBankDetails_Delete(id);
                ShowToast("Bank details deleted successfully", "success");
                EmployeeBankDetails_ReadAll();
            }
        }












        protected void btnSaveFamilyDetails_Click(object sender, EventArgs e)
        {
            EmployeeFamilyDetailsDTO obj = new EmployeeFamilyDetailsDTO()
            {
                Name = txtFamilyName.Text,
                Relation = txtRelation.Text,
                DateOfBirth = DateTime.Parse(txtDateOfBirth.Text),
                Phone = txtPhone.Text,
                UserId = UserId
            };

            if (hfFamilyDetailId.Value == "")
            {
                EmployeeFamilyDetails_Create(obj);
                ShowToast("Family details created successfully", "success");
            }
            else
            {
                obj.FamilyDetailId = int.Parse(hfFamilyDetailId.Value);
                EmployeeFamilyDetails_Update(obj);
                ShowToast("Family details updated successfully", "success");
            }

            RefreshFamilyDetailsForm();
            EmployeeFamilyDetails_ReadAll();
        }

        public void EmployeeFamilyDetails_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_EmployeeFamilyDetails_ReadByUserId", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", UserId);

            SqlDataAdapter ada = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            ada.Fill(ds);

            rptFamilyDetails.DataSource = ds.Tables[0];
            rptFamilyDetails.DataBind();
        }
        private void RefreshFamilyDetailsForm()
        {
            hfFamilyDetailId.Value = "";

            txtFamilyName.Text = "";
            txtRelation.Text = "";
            txtDateOfBirth.Text = "";
            txtPhone.Text = "";

            btnSaveFamilyDetails.Text = "Add Family Details";
        }

        protected void rptFamilyDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditFamily")
            {
                EmployeeFamilyDetailsDTO d = EmployeeFamilyDetails_ReadById(id);

                hfFamilyDetailId.Value = d.FamilyDetailId.ToString();
                txtFamilyName.Text = d.Name;
                txtRelation.Text = d.Relation;
                txtDateOfBirth.Text = d.DateOfBirth.HasValue ? d.DateOfBirth.Value.ToString("yyyy-MM-dd") : "";
                txtPhone.Text = d.Phone;

                btnSaveFamilyDetails.Text = "Update Family Details";

                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "openFamilyModal",
                    "var myModal = new bootstrap.Modal(document.getElementById('editFamilyDetailsModal')); myModal.show();",
                    true);
            }
            else if (e.CommandName == "DeleteFamily")
            {
                EmployeeFamilyDetails_Delete(id);

                ShowToast("Family details deleted successfully", "success");

                EmployeeFamilyDetails_ReadAll();
            }
        }









        protected void btnSaveEducationDetails_Click(object sender, EventArgs e)
        {
            EducationDetailsDTO obj = new EducationDetailsDTO()
            {
                EducationType = txtEducationType.Text,
                UniversityName = txtUniversityName.Text,
                StartDate = DateTime.Parse(txtEducationStartDate.Text),
                EndDate = DateTime.Parse(txtEducationEndDate.Text),
                UserId = UserId
            };

            if (hfEducationDetailsId.Value == "")
            {
                EducationDetails_Create(obj);
                ShowToast("Education details created successfully", "success");
            }
            else
            {
                obj.EducationDetailsId = int.Parse(hfEducationDetailsId.Value);
                EducationDetails_Update(obj);
                ShowToast("Education details updated successfully", "success");
            }

            RefreshEducationDetailsForm();
            EducationDetails_ReadAll();
        }


        public void EducationDetails_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_EducationDetails_ReadByUserId", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", UserId);

            SqlDataAdapter ada = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            ada.Fill(ds);

            rptEducationDetails.DataSource = ds.Tables[0];
            rptEducationDetails.DataBind();
        }
        private void RefreshEducationDetailsForm()
        {
            hfEducationDetailsId.Value = "";

            txtEducationType.Text = "";
            txtUniversityName.Text = "";
            txtEducationStartDate.Text = "";
            txtEducationEndDate.Text = "";

            btnSaveEducationDetails.Text = "Add Education Details";
        }

        protected void rptEducationDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditEducation")
            {
                EducationDetailsDTO d = EducationDetails_ReadById(id);

                hfEducationDetailsId.Value = d.EducationDetailsId.ToString();
                txtUniversityName.Text = d.UniversityName;
                txtEducationType.Text = d.EducationType;
                txtEducationStartDate.Text = d.StartDate.HasValue ? d.StartDate.Value.ToString("yyyy-MM-dd") : "";
                txtEducationEndDate.Text = d.EndDate.HasValue ? d.EndDate.Value.ToString("yyyy-MM-dd") : "";

                btnSaveEducationDetails.Text = "Update Education Details";

                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "openEducationModal",
                    "var myModal = new bootstrap.Modal(document.getElementById('editeducationDetailsModal')); myModal.show();",
                    true);
            }
            else if (e.CommandName == "DeleteEducation")
            {
                EducationDetails_Delete(id);
                ShowToast("Education details deleted successfully", "success");
                EducationDetails_ReadAll();
            }
        }







        protected void btnSaveExperienceDetails_Click(object sender, EventArgs e)
        {
            ExperienceDTO obj = new ExperienceDTO()
            {
                DesignationName = txtDesignationName.Text,
                CompanyName = txtCompanyName.Text,
                FromDate = DateTime.Parse(txtFromDate.Text),
                ToDate = DateTime.Parse(txtToDate.Text),
                UserId = UserId
            };

            if (hfExperienceId.Value == "")
            {
                Experience_Create(obj);
                ShowToast("Experience details created successfully", "success");
            }
            else
            {
                obj.ExperienceId = int.Parse(hfExperienceId.Value);
                Experience_Update(obj);
                ShowToast("Experience details updated successfully", "success");
            }

            RefreshExperienceDetailsForm();
            Experience_ReadAll();
        }

        public void Experience_ReadAll()
        {
            SqlCommand cmd = new SqlCommand("SP_Experience_ReadByUserId", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", UserId);

            SqlDataAdapter ada = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            ada.Fill(ds);

            rptExperienceDetails.DataSource = ds.Tables[0];
            rptExperienceDetails.DataBind();
        }

        private void RefreshExperienceDetailsForm()
        {
            hfExperienceId.Value = "";

            txtDesignationName.Text = "";
            txtCompanyName.Text = "";
            txtFromDate.Text = "";
            txtToDate.Text = "";

            btnSaveExperienceDetails.Text = "Add Experience Details";
        }

        protected void rptExperienceDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditExperience")
            {
                ExperienceDTO d = Experience_ReadById(id);

                hfExperienceId.Value = d.ExperienceId.ToString();
                txtCompanyName.Text = d.CompanyName;
                txtDesignationName.Text = d.DesignationName;
                txtFromDate.Text = d.FromDate?.ToString("yyyy-MM-dd") ?? "";
                txtToDate.Text = d.ToDate?.ToString("yyyy-MM-dd") ?? "";

                btnSaveExperienceDetails.Text = "Update Experience Details";

                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "openExperienceModal",
                    "var myModal = new bootstrap.Modal(document.getElementById('editexperienceDetailsModal')); myModal.show();",
                    true);
            }
            else if (e.CommandName == "DeleteExperience")
            {
                Experience_Delete(id);
                ShowToast("Experience details deleted successfully", "success");
                Experience_ReadAll();
            }
        }






    }
}