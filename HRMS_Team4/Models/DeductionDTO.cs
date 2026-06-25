using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS_Team4.Models
{
    public class DeductionDTO
    {
        public int DeductionId { get; set; }

        public int DeductionTypeId { get; set; }

        public int DepartmentId { get; set; }

        public int DesignationId { get; set; }

        public decimal DeductionPercentage { get; set; }

        public DateTime? CreatedAt { get; set; }

        public string CreatedBy { get; set; }

        public DateTime? ModifiedAt { get; set; }

        public string ModifiedBy { get; set; }
    }
}