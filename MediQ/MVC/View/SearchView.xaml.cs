using MediQ.MVC.Controller;
using MediQ.MVC.Models;
using Microsoft.Maui.Controls.PlatformConfiguration.AndroidSpecific.AppCompat;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.View
{
    public partial class SearchView : ContentPage
    {
        SearchController dc = new SearchController();
        List<Doctors> doctors = new List<Doctors>();
        public SearchView()
        {
            InitializeComponent();
        }
        public async void goToMainPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MainPage());
        }

        public void goToBookingPage(int doctor_ID)
        {
            Navigation.PushAsync(new BookingView(doctor_ID));
        }

        public void searchForDoctor(object sender, EventArgs e)
        {
            stack_layout.Clear();
            var input = search_box.Text;
            if (input == "")
            {
                var err_label = new Label
                {
                    Text = "Try searching for a doctor. The list will appear here.",
                    HorizontalOptions = LayoutOptions.Center,
                    TextColor = Color.FromArgb(""),
                    Margin = 20
                };
                stack_layout.Add(err_label);

                return;
            }

            this.doctors = this.dc.findDoctors(input);
            if(doctors.Count == 0)
            {
                var err_label = new Label
                {
                    Text = "Oops! We couldn't find any matching doctors.",
                    HorizontalOptions = LayoutOptions.Center,
                    TextColor = Color.FromArgb(""),
                    Margin = 20
                };
                stack_layout.Add(err_label);
                return;
            }

            foreach(Doctors doctor in this.doctors)
            {
                testCreate(doctor);
            }
        }

        public void testCreate(Doctors doctor)
        {
            var frame = createFrame();
            var grid = createGrid();
            var doctor_image = createImage("user.png");
            var v_layout = createVerticalLayout("Dr. " + doctor.first_name + " " + doctor.last_name, doctor.category.category_name);
            var h_layout = createHorizontalLayout(doctor.doctor_ID);

            grid.Children.Add(doctor_image);
            grid.Children.Add(v_layout);
            grid.Children.Add(h_layout);

            grid.SetColumn(doctor_image, 0);
            grid.SetColumn(v_layout, 1);
            grid.SetColumn(h_layout, 2);

            frame.Content = grid;
            stack_layout.Add(frame);
        }

        public Frame createFrame()
        {
            var frame = new Frame
            {
                CornerRadius = 10,
                Margin = 10,
                BackgroundColor = Color.FromArgb("#CCECCE"),
                BorderColor = Colors.Transparent
            };

            var tap_gesture = new TapGestureRecognizer();
            tap_gesture.Tapped += goToMainPage;
            frame.GestureRecognizers.Add(tap_gesture);

            return frame;
        }
        public Image createImage(string profile_url)
        {
            var doctor_image = new Image
            {
                Source = profile_url,
                Aspect = Aspect.AspectFit,
                WidthRequest = 50,
                HeightRequest = 50,
                VerticalOptions = LayoutOptions.Center,
                HorizontalOptions = LayoutOptions.Center
            };

            return doctor_image;
        }
        public Grid createGrid()
        {
            var grid = new Grid
            {
                RowDefinitions = { new RowDefinition() },
                ColumnDefinitions = { new ColumnDefinition(), new ColumnDefinition(), new ColumnDefinition() }
            };

            return grid;
        }

        public VerticalStackLayout createVerticalLayout(string doctor_name, string location)
        {
            var v_layout = new VerticalStackLayout
            {
                Spacing = 2,
                VerticalOptions = LayoutOptions.Center
            };

            var doctor_label_name = new Label
            {
                Text = doctor_name,
                TextColor = Color.FromArgb("#095D7E"),
                FontSize = 10
            };

            var doctor_label_location = new Label
            {
                Text = location,
                TextColor = Color.FromArgb("#095D7E"),
                FontSize = 8
            };

            v_layout.Add(doctor_label_name);
            v_layout.Add(doctor_label_location);

            return v_layout;
        }

        public HorizontalStackLayout createHorizontalLayout(int doctor_ID)
        {
            var h_layout = new HorizontalStackLayout
            {
                VerticalOptions = LayoutOptions.Center,
                HorizontalOptions = LayoutOptions.End
            };

            var border1 = createBorder("send.png",doctor_ID);
            h_layout.Add(border1);

            var border2 = createBorder("person.png", doctor_ID);
            h_layout.Add(border2);

            return h_layout;
        }

        public Border createBorder(string image_link, int doctor_ID)
        {
            var border = new Border
            {
                WidthRequest = 20,
                HeightRequest = 20,
                Stroke = Colors.Transparent
            };

            var image_option_send = new Image
            {
                Source = image_link
            };

            var tap_recognizer = new TapGestureRecognizer();
            tap_recognizer.Tapped += (s, e) =>
            {
                goToBookingPage(doctor_ID);
            };
            image_option_send.GestureRecognizers.Add(tap_recognizer);

            border.Content = image_option_send;

            return border;
        }
    }
}
