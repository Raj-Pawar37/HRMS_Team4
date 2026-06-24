using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS_Team4.Models
{
    public class EmployeeBankDetailsDTO
    {
        public int BankDetailId { get; set; }

        public string BankName { get; set; }

        public string AccountNumber { get; set; }

        public string IFSCCode { get; set; }

        public string BranchName { get; set; }

        public int UserId { get; set; }

    }
}