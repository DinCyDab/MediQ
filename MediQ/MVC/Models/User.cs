using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.Models
{
    public class User
    {
        public int user_ID { get; set; }
        public string email { get; set; }
        
        public string password { get; set; }    
        public string first_name { get; set; }
        public string last_name { get; set; }
    }
}
