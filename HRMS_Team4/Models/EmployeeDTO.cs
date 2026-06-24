using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS_Team4.Models
{
    public class EmployeeDTO
    {
        public int UserId { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        public string PasswordHash { get; set; }

        public string PhoneNumber { get; set; }

        public int RoleId { get; set; }

        public int? DepartmentId { get; set; }

        public int DesignationId { get; set; }

        public DateTime DateOfJoining { get; set; }

        public DateTime DateOfBirth { get; set; }

        public string Gender { get; set; }

        public string Address { get; set; }

        public string AboutEmployee { get; set; }

        public string ProfilePicture { get; set; }

        public int? RoleId1 { get; set; }

        public int? ReportingManager { get; set; }

        public DateTime? CreatedAt { get; set; }

        public string CreatedBy { get; set; }

        public string ModifiedBy { get; set; }

        public DateTime? ModifiedAt { get; set; }

        public string Status { get; set; }
    }
}