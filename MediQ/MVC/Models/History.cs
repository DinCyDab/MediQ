using Microsoft.Identity.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.Models
{
    public class History
    {
        public int history_ID { get; set; }
        public int user_ID { get; set; }
        public Doctors doctor { get; set; }
        public DateTime date { get; set; }
        public TimeSpan time { get; set; }
    }
}
