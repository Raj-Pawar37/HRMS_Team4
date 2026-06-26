using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HRMS_Team4.Models
{
    public class TaskBoardDTO
    {
        public int TaskBoardId { get; set; }
        public int ProjectId { get; set; }
        public int TaskId { get; set; }
        public int Percentage { get; set; }
        public DateTime DueDate { get; set; }
    }
}