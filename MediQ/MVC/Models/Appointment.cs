using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.Models
{
    class Appointment
    {
        public int appointment_ID { get; set; }
        public int user_ID { get; set; }
        public int doctor_ID { get;set; }
        public string date { get; set; }
        public string time { get; set; }
        public string status { get; set; }
    }
}
