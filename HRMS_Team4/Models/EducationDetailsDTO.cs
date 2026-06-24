using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS_Team4.Models
{
    public class EducationDetailsDTO
    {
        public int EducationDetailsId { get; set; }

        public string EducationType { get; set; }

        public string UniversityName { get; set; }

        public int UserId { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }
    }
}