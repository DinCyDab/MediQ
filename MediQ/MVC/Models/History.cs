using Microsoft.Identity.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.Models
{
    class History
    {
        public int user_ID { get; set; }
        public int doctor_ID { get; set; }
        public DateTime view_date { get; set; }
        public TimeSpan view_time { get; set; }
    }
}
