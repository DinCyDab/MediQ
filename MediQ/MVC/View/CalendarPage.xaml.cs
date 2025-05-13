using MediQ.MVC.Controller;
using MediQ.MVC.Models;
using System;
using Microsoft.Maui.Controls;

namespace MediQ.MVC.View
{
    public partial class CalendarPage : ContentPage
    {
        public CalendarPage()
        {
            InitializeComponent();
        }

        private async void OnHomeTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new HomePage());
        }

        private async void OnSearchTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SearchView());
        }

        private async void OnProfileTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new ProfilePage());
        }

        private async void OnViewAllTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new AppointmentStatusPage());
        }
    }
}
