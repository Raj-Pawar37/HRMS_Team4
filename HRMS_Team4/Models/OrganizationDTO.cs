using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS_Team4.Models
{
    public class OrganizationDTO
    {
        public int OrganizationId { get; set; }

        public string OrganizationName { get; set; }

        public string OrganizationDescription { get; set; }

        public string OrganizationAddress { get; set; }

        public string OrganizationPhone { get; set; }

        public string OrganizationEmail { get; set; }

        public string OrganizationLogo { get; set; }
    }
}