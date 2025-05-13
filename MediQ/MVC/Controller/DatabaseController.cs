using Microsoft.Data.SqlClient;
using Microsoft.Identity.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MediQ.MVC.Models;
using System.Diagnostics;

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
                string email = (string)reader["email"];
                string first_name = (string)reader["first_name"];
                string last_name = (string)reader["last_name"];

                user.user_ID = id;
                user.email = email;
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
                Category category = new Category();
                doctor.doctor_ID = (int)reader["doctor_ID"];
                doctor.first_name = (string)reader["first_name"];
                doctor.last_name = (string)reader["last_name"];
                doctor.location = (string)reader["location"];
                doctor.status = (string)reader["status"];
                doctor.image_link = (string)reader["doctor_image"];

                category.category_ID = (int)reader["category_ID"];
                category.category_name = (string)reader["category_name"];

                doctor.category = category;
                list_of_doctors.Add(doctor);
            }

            this.conn.Close();

            return list_of_doctors;
        }

        //Used to load a doctor individually
        public Doctors loadDoctor(string sql)
        {
            Doctors doctor = new Doctors();
            Category category = new Category();
            this.conn = new SqlConnection(this.connectionString);
            this.conn.Open();

            SqlDataReader reader = new SqlCommand(sql, this.conn).ExecuteReader();

            if (reader.Read())
            {
                doctor.doctor_ID = (int)reader["doctor_ID"];
                doctor.first_name = (string)reader["first_name"];
                doctor.last_name = (string)reader["last_name"];
                doctor.location = (string)reader["location"];
                doctor.status = (string)reader["status"];
                doctor.image_link = (string)reader["doctor_image"];

                category.category_ID = (int)reader["category_ID"];
                category.category_name = (string)reader["category_name"];

                doctor.category = category;
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
                Doctors doctor = new Doctors();
                Category category = new Category();

                history.history_ID = (int)reader["history_ID"];

                category.category_ID = (int)reader["category_ID"];
                category.category_name = (string)reader["category_name"];

                doctor.category = category;
                doctor.doctor_ID = (int)reader["doctor_ID"];
                doctor.first_name = (string)reader["first_name"];
                doctor.last_name = (string)reader["last_name"];
                doctor.location = (string)reader["location"];
                doctor.status = (string)reader["status"];
                doctor.image_link = (string)reader["doctor_image"];

                history.doctor = doctor;

                list_of_history.Add(history);
            }

            this.conn.Close();

            return list_of_history;
        }

        public List<Schedule> loadSchedule(string sql)
        {
            List<Schedule> list_of_schedule = new List<Schedule>();
            this.conn = new SqlConnection(this.connectionString);
            this.conn.Open();

            SqlDataReader reader = new SqlCommand(sql, this.conn).ExecuteReader();

            while (reader.Read())
            {
                Schedule schedule = new Schedule();

                if (DBNull.Value != reader["schedule_ID"])
                {
                    schedule.schedule_ID = (int)reader["schedule_ID"];
                    schedule.doctor_ID = (int)reader["doctor_ID"];
                    schedule.status = (string)reader["schedule_status"];

                    TimeSpan output_time = (TimeSpan)reader["schedule_time"];

                    schedule.time = output_time;
                }

                DateTime output_date = (DateTime)reader["schedule_date"];
                schedule.date = output_date;

                list_of_schedule.Add(schedule);
            }

            this.conn.Close();

            return list_of_schedule;
        }

        public List<Schedule> loadDateOnlySchedule(string sql)
        {
            List<Schedule> list_of_schedule = new List<Schedule>();
            this.conn = new SqlConnection(this.connectionString);
            this.conn.Open();

            SqlDataReader reader = new SqlCommand(sql, this.conn).ExecuteReader();

            while (reader.Read())
            {
                Schedule schedule = new Schedule();

                schedule.date = (DateTime)reader["schedule_date"];

                list_of_schedule.Add(schedule);
            }

            this.conn.Close();

            return list_of_schedule;
        }

        public Schedule loadSingleSchedule(string sql)
        {
            Schedule s = new Schedule();
            this.conn = new SqlConnection(this.connectionString);
            this.conn.Open();

            SqlDataReader reader = new SqlCommand(sql, this.conn).ExecuteReader();

            if (reader.Read())
            {
                s.schedule_ID = (int)reader["schedule_ID"];
                s.date = (DateTime)reader["schedule_date"];
                s.time = (TimeSpan)reader["schedule_time"];
                s.status = (string)reader["schedule_status"];
                s.doctor_ID = (int)reader["doctor_ID"];
            }

            this.conn.Close();

            return s;
        }
    }
}
