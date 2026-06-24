using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS_Team4.Models
{
    public class ExperienceDTO
    {
        public int ExperienceId { get; set; }

        public string DesignationName { get; set; }

        public DateTime? FromDate { get; set; }

        public DateTime? ToDate { get; set; }

        public int UserId { get; set; }

        public string CompanyName { get; set; }
    }
}