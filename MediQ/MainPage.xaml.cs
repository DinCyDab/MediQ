using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;

namespace MediQ.MVC.View;

public partial class MainPage : ContentPage
{
    int count = 0;

    public MainPage()
    {
        InitializeComponent();

        int userId = Preferences.Get("UserId", -1);
        if (userId == -2)
        {
            backToLoginButton.IsVisible = true;
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
