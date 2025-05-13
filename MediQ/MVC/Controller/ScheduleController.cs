using MediQ.MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.Controller
{
    class ScheduleController
    {
        DatabaseController dc = new DatabaseController();

        public List<Schedule> loadNext4DaysSchedule(int doctor_ID)
        {
            List<Schedule> list_of_schedule = new List<Schedule>();

            //Returns a list of the next 4 days available date for the doctor
            string sql = $"SELECT TOP 4 schedule_date " +
                         $"FROM Schedule " +
                         $"WHERE doctor_ID = {doctor_ID} AND schedule_date > GETDATE() " +
                         $"GROUP BY schedule_date";

            list_of_schedule = this.dc.loadDateOnlySchedule(sql);

            return list_of_schedule;
        }

        public List<Schedule> loadSchedule(int doctor_ID, string date)
        {
            List<Schedule> list_of_schedule = new List<Schedule>();

            string sql = $"SELECT * FROM Schedule " +
                         $"WHERE schedule_date = '{date}' AND doctor_ID = {doctor_ID} AND schedule_status = 'Available'" +
                         $"ORDER BY schedule_time ASC";

            list_of_schedule = this.dc.loadSchedule(sql);

            return list_of_schedule;
        }

        public Schedule loadConfirmationSchedule(int schedule_ID)
        {
            Schedule s = new Schedule();

            string sql = $"SELECT * FROM Schedule " +
                         $"WHERE schedule_ID = {schedule_ID}";

            s = this.dc.loadSingleSchedule(sql);
            return s;
        }
    }
}
