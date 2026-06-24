using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS_Team4.Models
{
    public class RoleDTO
    {
        public int RoleId { get; set; }

        public string RoleName { get; set; }

        public string Status { get; set; }

        public DateTime? CreatedAt { get; set; }

        public string CreatedBy { get; set; }

        public string ModifiedBy { get; set; }

        public DateTime? ModifiedAt { get; set; }
    }
}