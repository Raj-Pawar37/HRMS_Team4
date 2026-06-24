using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS_Team4.Models
{
    public class EmployeeFamilyDetailsDTO
    {
        public int FamilyDetailId { get; set; }

        public string Name { get; set; }

        public string Relation { get; set; }

        public DateTime? DateOfBirth { get; set; }

        public string Phone { get; set; }

        public int UserId { get; set; }
    }
}