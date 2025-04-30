using System;
using System.Collections.Generic;
using System.ComponentModel.Design.Serialization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MediQ.MVC.Models;

namespace MediQ.MVC.Controller
{
    class UserController
    {
        DatabaseController dc = new DatabaseController();
        public bool insertUser(string username, string password, string first_name, string last_name)
        {
            //Checks if the username is already inside the database
            //If true then we won't register the username as we need uniqueness for the username
            if (checkUser(username))
            {
                return false;
            }

            string sql = "INSERT INTO Users(username, password, first_name, last_name) " +
                         $"VALUES('{username}', '{password}', '{first_name}', '{last_name}')";
            this.dc.insertData(sql);
            return true;
        }
        
        public User loadUser(string username, string password)
        {
            User user = null;
            string sql = $"SELECT * FROM Users " +
                         $"WHERE username = '{username}' " +
                         $"AND password = '{password}' ";
            user = this.dc.loadUserData(sql);
            return user;
        }

        public bool checkUser(string username)
        {
            bool is_found = false;
            string sql = $"SELECT * FROM Users " +
                         $"WHERE username = '{username}'";
            is_found = this.dc.findUser(sql);
            return is_found;
        }
    }
}
