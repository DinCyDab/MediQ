using MediQ.MVC.Controller;
using MediQ.MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.View.Modals
{
    public partial class AppointmentConfirmation : ContentPage
    {
        Doctors doctor = new Doctors();
        Schedule schedule = new Schedule();
        AppointmentController ac = new AppointmentController();
        SearchController search_c = new SearchController();
        ScheduleController sched_c = new ScheduleController();
        public AppointmentConfirmation(int selected_schedule_ID)
        {
            InitializeComponent();
            initializeSchedule(selected_schedule_ID);
        }

        public AppointmentConfirmation()
        {
            InitializeComponent();
        }

        public void goBack(object sender, EventArgs e)
        {
            Navigation.PopAsync();
        }

        public void createAppointment(object sender, EventArgs e)
        {
            ac.createAppointment(MainPage.user.user_ID, doctor.doctor_ID, schedule.date, schedule.time);
            Navigation.PushAsync(new BackToHome());
        }

        public void initializeSchedule(int selected_schedule_ID)
        {
            this.schedule = this.sched_c.loadConfirmationSchedule(selected_schedule_ID);
            this.doctor = this.search_c.loadDoctor(this.schedule.doctor_ID);

            string date = this.schedule.date.Date.ToString("MMM d");
            string time = DateTime.Today.Add(this.schedule.time).ToString("h:00 tt");

            text_output.Text = $"Send an appointment to Dr. {doctor.first_name} {doctor.last_name} on {date} at {time}?";
        }
    }
}
