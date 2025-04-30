using MediQ.MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.Controller
{
    class AppointmentController
    {
        DatabaseController dc = new DatabaseController();
        public void createAppointment(int user_ID, int doctor_ID, string date, string time, string status)
        {
            DateTime input_date;
            DateTime.TryParse(date, out input_date);

            TimeSpan input_time;
            TimeSpan.TryParse(time, out input_time);

            string sql = $"INSERT INTO Appointment(user_ID, doctor_ID, appointment_date, appointment_time, appointment_status)" +
                         $"VALUES('{user_ID}', '{doctor_ID}', '{input_date}', '{input_time}', '{status}')";

            this.dc.insertData(sql);
        }

        public List<Appointment> loadAppointments(int user_ID, string date)
        {
            List<Appointment> list_of_appointments = null;

            string sql = $"SELECT * FROM Appointment " +
                         $"WHERE user_ID = '{user_ID}' " +
                         $"AND date = '{date}'";
            list_of_appointments = this.dc.loadAppointments(sql);

            return list_of_appointments;
        }
    }
}
