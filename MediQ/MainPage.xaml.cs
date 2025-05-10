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

        private async void goToSearchPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SearchView());
        }
        private async void goToProfilePage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new UserProfileView());
        }

        private async void goToBookingPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new BookingView());
        }
    }

}
