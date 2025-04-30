using System;
using System.Collections.Generic;
using System.ComponentModel.Design.Serialization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.Controller
{
    class UserController
    {
        DatabaseController db = new DatabaseController();
        public void insertUser(string username, string password)
        {
            string sql = "INSERT INTO Users(username, password) " +
                         $"VALUES({username}, {password})";
            this.db.insertData(sql);
        }
    }
}
