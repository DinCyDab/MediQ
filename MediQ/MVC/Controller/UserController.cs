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

        //Used for registering the user
        public bool insertUser(string email, string password, string first_name, string last_name)
        {
            //Checks if the username is already inside the database
            //If true then we won't register the username as we need uniqueness for the username
            if (checkUser(email))
            {
                return false;
            }

            string sql = "INSERT INTO Users(email, password, first_name, last_name) " +
                         $"VALUES('{email}', '{password}', '{first_name}', '{last_name}')";
            this.dc.insertData(sql);
            return true;
        }
        
        //Used for logging in the user and load the user data
        public User loadUser(string email, string password)
        {
            User user = null;
            string sql = $"SELECT * FROM Users " +
                         $"WHERE email = '{email}' " +
                         $"AND password = '{password}' ";
            user = this.dc.loadUserData(sql);
            return user;
        }

        //Used for checking the username inside the database to avoid duplication of username
        //Returns false if not found
        public bool checkUser(string email)
        {
            bool is_found = false;
            string sql = $"SELECT * FROM Users " +
                         $"WHERE email = '{email}'";
            is_found = this.dc.findUser(sql);
            return is_found;
        }
    }
}
