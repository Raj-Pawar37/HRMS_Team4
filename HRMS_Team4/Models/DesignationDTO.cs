using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS_Team4.Models
{
    public class DesignationDTO
    {
        public int DesignationId { get; set; }

        public int DepartmentId { get; set; }

        public string Name { get; set; }

        public int? NoOfEmployee { get; set; }

        public string Status { get; set; }

        public DateTime? CreatedAt { get; set; }

        public string CreatedBy { get; set; }

        public string ModifiedBy { get; set; }

        public DateTime? ModifiedAt { get; set; }
    }
}