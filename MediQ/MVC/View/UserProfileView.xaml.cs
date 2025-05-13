using MediQ.MVC.Controller;
using MediQ.MVC.Models;
using Microsoft.Maui.Controls.PlatformConfiguration.AndroidSpecific.AppCompat;
using Microsoft.Maui.Controls.Shapes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MediQ.MVC.View.Modals;
namespace MediQ.MVC.View
{
    public partial class UserProfileView : ContentPage
    {
        public UserProfileView()
        {
            InitializeComponent();
            if (MainPage.user != null)
            {
                string fullName = $"{MainPage.user.first_name} {MainPage.user.last_name}";
                UserNameLabel.Text = fullName;
            }
            else
            {
                UserNameLabel.Text = "Guest";
            }
        }

        private async void OnSettingsClicked(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new SettingsModal());
        }

        private async void OnHelpCenterClicked(object sender, EventArgs e)
        {
            string faq = "Frequently Asked Questions:\n\n" +
                         "Q: How do I reset my password?\nA: Go to settings and choose 'Change Password'.\n\n" +
                         "Q: How do I contact support?\nA: Use the 'Send Feedback' button.";

            await DisplayAlert("Help Center", faq, "OK");
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
        // nav bad funcs
        private async void OnHomeTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new HomePage());
        }

        private async void OnSearchTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SearchView());
        }

        private async void OnCalendarTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new CalendarPage());
        }

        private async void OnProfileTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new UserProfileView());
        }
        private async void OnNotificationsTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new NotificationsPage());
        }
    }
}
