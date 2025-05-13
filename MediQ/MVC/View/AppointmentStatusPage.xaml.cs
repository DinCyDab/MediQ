using System;
using Microsoft.Maui.Controls;

namespace MediQ.MVC.View
{
    public partial class AppointmentStatusPage : ContentPage
    {
        public AppointmentStatusPage()
        {
            InitializeComponent();
        }

        private async void OnBackTapped(object sender, EventArgs e)
        {
            // Option 1: Go back in the navigation stack
            await Navigation.PopAsync();

            // Option 2: Force going to CalendarPage (uncomment if you prefer this instead)
            // await Navigation.PushAsync(new CalendarPage());
        }
    }
}
