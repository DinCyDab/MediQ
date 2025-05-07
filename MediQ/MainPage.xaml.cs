using MediQ.MVC.Controller;
using MediQ.MVC.Models;
using MediQ.MVC.View;

namespace MediQ
{
    public partial class MainPage : ContentPage
    {
        int count = 0;

        public MainPage()
        {
            InitializeComponent();
        }

        private void OnCounterClicked(object sender, EventArgs e)
        {
            count++;

            if (count == 1)
                CounterBtn.Text = $"Clicked {count} time";
            else
                CounterBtn.Text = $"Clicked {count} times";

            SemanticScreenReader.Announce(CounterBtn.Text);
        }

        private async void GoToSearchPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SearchView());
        }

        private async void GoToHomePage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new HomePage());
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

    }

}
