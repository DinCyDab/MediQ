using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.ApplicationModel.Search;

namespace MediQ.MVC.View
{
    public partial class HomePage : ContentPage
    {
        public HomePage()
        {
            InitializeComponent();
        }

        private async void OnArrowTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SearchView());
        }

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
            await Navigation.PushAsync(new ProfilePage());
        }
        private async void OnNotificationsTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new NotificationsPage());
        }
    }
}
