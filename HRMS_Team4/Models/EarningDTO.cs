using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS_Team4.Models
{
    public class EarningDTO
    {
        public int EarningsId { get; set; }

        public int EarntypeId { get; set; }

        public decimal EarningsPercentage { get; set; }

        public int DepartmentId { get; set; }

        public int DesignationId { get; set; }

        public string CreatedBy { get; set; }

        public DateTime? CreatedAt { get; set; }

        public string ModifiedBy { get; set; }

        public DateTime? ModifiedAt { get; set; }
    }
}