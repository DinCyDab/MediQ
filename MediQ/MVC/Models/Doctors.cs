using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.Models
{
    public class Doctors
    {
        public int doctor_ID { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string location { get; set; }
        public Category category { get; set; }
        public string status { get; set; }
        public string image_link { get; set; }
    }
}
