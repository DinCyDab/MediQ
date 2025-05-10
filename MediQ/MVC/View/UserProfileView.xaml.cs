using MediQ.MVC.Controller;
using MediQ.MVC.Models;
using Microsoft.Maui.Controls.PlatformConfiguration.AndroidSpecific.AppCompat;
using Microsoft.Maui.Controls.Shapes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.View
{
    public partial class UserProfileView : ContentPage
    {
        public UserProfileView()
        {
            InitializeComponent();
        }

        private async void OnSettingsClicked(object sender, EventArgs e)
        {
            await DisplayAlert("Settings", "Settings clicked.", "OK");
        }

        private async void OnHelpCenterClicked(object sender, EventArgs e)
        {
            await DisplayAlert("Help Center", "Help Center clicked.", "OK");
        }

        private async void OnSendFeedbackClicked(object sender, EventArgs e)
        {
            await DisplayAlert("Feedback", "Send us feedback clicked.", "OK");
        }

        private async void OnRateAppClicked(object sender, EventArgs e)
        {
            await DisplayAlert("Rate Us", "Rate our app clicked.", "OK");
        }

        private async void OnSignOutClicked(object sender, EventArgs e)
        {
            bool confirm = await DisplayAlert("Sign Out", "Are you sure you want to sign out?", "Yes", "No");
            if (confirm)
            {
                // Navigate to login page or root page
                await Navigation.PopToRootAsync();
            }
        }
    }
}
