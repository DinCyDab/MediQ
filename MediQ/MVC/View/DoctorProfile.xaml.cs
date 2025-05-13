using MediQ.MVC.Controller;
using MediQ.MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.View
{
    public partial class DoctorProfile : ContentPage
    {
        SearchController search_c = new();
        Doctors doctor = new();
        public DoctorProfile()
        {
            InitializeComponent();
        }

        public DoctorProfile(Doctors doctor)
        {
            InitializeComponent();
            this.doctor = doctor;
            if(MainPage.user.user_ID != -1)
            {
                addToHistory();
            }
            initializePage();
        }

        public void backToPage(object sender, EventArgs e)
        {
            Navigation.PopAsync();
        }

        public void setAppointment(object sender, EventArgs e)
        {
            Navigation.PushAsync(new BookingView(this.doctor.doctor_ID));
        }

        private void initializePage()
        {
            doctor_name.Text = $"Dr. {this.doctor.first_name} {this.doctor.last_name}";
            doctor_location.Text = this.doctor.location;
            doctor_category.Text = this.doctor.category.category_name;
            doctor_profile.Source = this.doctor.image_link;
        }

        private void addToHistory()
        {
            this.search_c.addToHistory(MainPage.user.user_ID, this.doctor.doctor_ID);
        }
    }
}
