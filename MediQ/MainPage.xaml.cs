using MediQ.MVC.Controller;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;
using MediQ.MVC.Models;
using MediQ.MVC.View;

namespace MediQ
{

    public partial class MainPage : ContentPage
    {
        int count = 0;
        UserController uc = new();
        public static User user = new User();
        public MainPage()
        {
            InitializeComponent();
            MainPage.user.user_ID = -1;
            //Dispatcher.Dispatch(() =>
            //{
            //    Application.Current.MainPage = new LoginPage();
            //});
            //Application.Current.MainPage = new LoginPage();
        }
        private async void GoToCalendarPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new CalendarPage());
        }

        private async void GoToBookingPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new BookingPage());
        }

        private async void GoToProfilePage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new ProfilePage());
        }

        private async void GoToNotificationsPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new NotificationsPage());
        }

        private void GoToLoginPage()
        {
            Application.Current.MainPage = new LoginPage();
        }

        // || used just for testing, feel free to remove ||

        //private async void goToSearchPage(object sender, EventArgs e)
        //{
        //    await DisplayAlert("Search", "Search page coming soon!", "OK");
        //}

        //private async void goToBookingPage(object sender, EventArgs e)
        //{
        //    await DisplayAlert("Booking", "Booking page coming soon!", "OK");
        //}

        private async void goToSearchPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SearchView());
        }

        private async void goToBookingPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new BookingView());
        }

        private async void OnBackToLoginClicked(object sender, EventArgs e)
        {
            //Preferences.Remove("UserId");
            await Navigation.PopToRootAsync(); // returns to login page
        }
    }
}

