using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.Models
{
    class Schedule
    {
        public int schedule_ID { get; set; }
        public int doctor_ID { get; set; }
        public DateTime date { get; set; }
        public TimeSpan time { get; set; }
        public string status { get; set; }
    }
}
