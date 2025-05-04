using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.Models
{
    public class Appointment
    {
        public int appointment_ID { get; set; }
        public int user_ID { get; set; }
        public int doctor_ID { get;set; }
        public DateTime date { get; set; }
        public TimeSpan time { get; set; }
        public string status { get; set; }
    }
}
