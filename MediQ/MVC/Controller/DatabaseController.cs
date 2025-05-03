using Microsoft.Data.SqlClient;
using Microsoft.Identity.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MediQ.MVC.Models;

namespace MediQ.MVC.Controller
{
    class DatabaseController
    {
        string connectionString = "Server=localhost;Database=MediQ;Trusted_Connection=True;Encrypt=False;";
        SqlConnection conn = null;
        
        //Use for inserting data, registering, adding doctors, creating appointments, and etc.
        public void insertData(string sql)
        {
            this.conn = new SqlConnection(this.connectionString);
            this.conn.Open();

            new SqlCommand(sql, this.conn).ExecuteScalar();

            this.conn.Close();
        }

        //Used for loading the user data like login
        public User loadUserData(string sql)
        {
            User user = null;

            this.conn = new SqlConnection(this.connectionString);
            this.conn.Open();

            SqlDataReader reader = new SqlCommand(sql, this.conn).ExecuteReader();

            if (reader.Read())
            {
                user = new User();
                int id = (int)reader["user_ID"];
                string username = (string)reader["username"];
                string first_name = (string)reader["first_name"];
                string last_name = (string)reader["last_name"];

                user.id = id;
                user.username = username;
                user.first_name = first_name;
                user.last_name = last_name;
            }

            this.conn.Close();
            return user;
        }

        //Used to find the User within the database to avoid duplication when registering
        public bool findUser(string sql)
        {
            bool is_found = false;
            this.conn = new SqlConnection(this.connectionString);
            this.conn.Open();

            SqlDataReader reader = new SqlCommand(sql, this.conn).ExecuteReader();

            if (reader.Read())
            {
                is_found = true;
            }

            this.conn.Close();
            return is_found;
        }

        //Used to load the list of appointments on user side
        public List<Appointment> loadAppointments(string sql)
        {
            List<Appointment> list_of_appointments = new List<Appointment>();

            this.conn = new SqlConnection(this.connectionString);
            this.conn.Open();

            SqlDataReader reader = new SqlCommand(sql, this.conn).ExecuteReader();

            while (reader.Read())
            {
                Appointment appointment = new Appointment();
                appointment.appointment_ID = (int)reader["appointment_ID"];
                appointment.user_ID = (int)reader["user_ID"];
                appointment.doctor_ID = (int)reader["doctor_ID"];
                string date = (string)reader["appointment_date"];
                string time = (string)reader["appointment_time"];
                appointment.status = (string)reader["appointment_status"];

                DateTime load_date;
                DateTime.TryParse(date, out load_date);

                TimeSpan load_time;
                TimeSpan.TryParse(time, out load_time);

                appointment.date = load_date;
                appointment.time = load_time;

                list_of_appointments.Add(appointment);
            }

            this.conn.Close();
            return list_of_appointments;
        }

        //Used for searching page, returns the list of doctors
        public List<Doctors> findDoctors(string sql)
        {
            List<Doctors> list_of_doctors = new List<Doctors>();
            this.conn = new SqlConnection(this.connectionString);
            this.conn.Open();

            SqlDataReader reader = new SqlCommand(sql, this.conn).ExecuteReader();

            while (reader.Read())
            {
                Doctors doctor = new Doctors();
                doctor.doctor_ID = (int)reader["doctor_ID"];
                doctor.first_name = (string)reader["first_name"];
                doctor.last_name = (string)reader["last_name"];

                list_of_doctors.Add(doctor);
            }

            this.conn.Close();

            return list_of_doctors;
        }

        //Used to load a doctor individually
        public Doctors loadDoctor(string sql)
        {
            Doctors doctor = new Doctors();
            this.conn = new SqlConnection(this.connectionString);
            this.conn.Open();

            SqlDataReader reader = new SqlCommand(sql, this.conn).ExecuteReader();

            if (reader.Read())
            {
                doctor.doctor_ID = (int)reader["doctor_ID"];
                doctor.first_name = (string)reader["first_name"];
                doctor.last_name = (string)reader["last_name"];
            }

            this.conn.Close();
            return doctor;
        }

        //Used to load the recent search history of the user
        public List<History> loadUserHistory(string sql)
        {
            List<History> list_of_history = new List<History>();

            this.conn = new SqlConnection(this.connectionString);
            this.conn.Open();

            SqlDataReader reader = new SqlCommand(sql, this.conn).ExecuteReader();

            while (reader.Read())
            {
                History history = new History();
                history.user_ID = (int)reader["user_ID"];
                history.doctor_ID = (int)reader["doctor_ID"];

                DateTime load_date;
                DateTime.TryParse((string)reader["view_date"], out load_date);

                TimeSpan load_time;
                TimeSpan.TryParse((string)reader["view_time"], out load_time);

                history.view_date = load_date;
                history.view_time = load_time;

                list_of_history.Add(history);
            }

            this.conn.Close();

            return list_of_history;
        }
    }
}
