using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;

namespace MediQ.MVC.View;

public partial class MainPage : ContentPage
{
    int count = 0;

    public MainPage()
    {
        int count = 0;
        UserController uc = new();
        public static User user = new User();
        InitializeComponent();

        int userId = Preferences.Get("UserId", -1);
        if (userId == -2)
        {
            backToLoginButton.IsVisible = true;
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
        Preferences.Remove("UserId");
        await Navigation.PopToRootAsync(); // returns to login page
    }
}
