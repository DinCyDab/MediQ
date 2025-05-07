using MediQ.MVC.Controller;
using MediQ.MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.View
{
    public partial class HomePage : ContentPage
    {
        SearchController search_c = new SearchController();
        public HomePage()
        {
            InitializeComponent();
            initializeUser();
            loadHistory();

            //Better if it would suggest dynamically
            createSuggestion("Neurologist");
            createSuggestion("Dermatologist");
            createSuggestion("Cardiologist");
            
            createArrowFrame();
        }

        private void initializeUser()
        {
            user_name.Text = $"Hello, {MainPage.user.first_name}";
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

        private void OnDoctorClick(Doctors doctor)
        {
            Navigation.PushAsync(new DoctorProfile(doctor));
        }

        private void OnClickSearchSuggestion(string text)
        {
            Navigation.PushAsync(new SearchView(text));
        }

        private void loadHistory()
        {
            List<History> list_of_history = this.search_c.loadHistory(MainPage.user.user_ID);
            foreach(History history in list_of_history)
            {
                Frame frame = createDoctorFrame();
                Image image = createImage(history.doctor.image_link, history.doctor);

                frame.Content = image;

                history_list.Add(frame);
            }
        }

        private Frame createDoctorFrame()
        {
            Frame frame = new Frame
            {
                WidthRequest = 60,
                HeightRequest = 60,
                CornerRadius = 30,
                Padding = 0,
                HasShadow = false,
                IsClippedToBounds = true,
                BorderColor = Colors.Transparent
            };
            return frame;
        }

        private Image createImage(string source, Doctors doctor)
        {
            Image image = new Image
            {
                Source = source,
                Aspect = Aspect.AspectFill,
                WidthRequest = 60,
                HeightRequest = 60
            };

            var tap = new TapGestureRecognizer();
            tap.Tapped += (s, e) =>
            {
                OnDoctorClick(doctor);
            };
            image.GestureRecognizers.Add(tap);

            return image;
        }

        private Frame createSuggestionFrame(string text)
        {
            Frame frame = new Frame
            {
                Padding = new Thickness(12, 4),
                CornerRadius = 15,
                BackgroundColor = Color.FromArgb("#095D7E"),
                HasShadow = false,
                BorderColor = Color.FromArgb("#095D7E")
            };

            var tap = new TapGestureRecognizer();
            tap.Tapped += (s, e) =>
            {
                OnClickSearchSuggestion(text);
            };

            frame.GestureRecognizers.Add(tap);
            return frame;
        }

        private Label createSuggestionLabel(string text)
        {
            Label label = new Label
            {
                Text = text,
                FontSize = 12,
                TextColor = Colors.White,
                HorizontalOptions = LayoutOptions.Center,
                VerticalOptions = LayoutOptions.Center
            };
            return label;
        }
        private void createSuggestion(string text)
        {
            Frame frame = createSuggestionFrame(text);
            Label label = createSuggestionLabel(text);
            frame.Content = label;
            suggestion.Add(frame);
        }
        private void createArrowFrame()
        {
            Frame frame = new Frame
            {
                Padding = new Thickness(12, 4),
                CornerRadius = 15,
                BackgroundColor = Color.FromArgb("#E0E0E0"),
                HasShadow = false,
                BorderColor = Color.FromArgb("#B0B0B0"),
                HorizontalOptions = LayoutOptions.Center,
                VerticalOptions = LayoutOptions.Center
            };

            var image = new Image
            {
                Source = "arrow_right.png",
                WidthRequest = 20,
                HeightRequest = 20
            };

            var tapGestureRecognizer = new TapGestureRecognizer();
            tapGestureRecognizer.Tapped += OnArrowTapped;

            image.GestureRecognizers.Add(tapGestureRecognizer);

            frame.Content = image;

            suggestion.Add(frame);
        }
    }
}
