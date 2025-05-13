using MediQ.MVC.Controller;
using MediQ.MVC.Models;
using Microsoft.Maui.Controls.Shapes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.View
{
    public partial class CalendarPage : ContentPage
    {
        AppointmentController ac = new();
        public CalendarPage()
        {
            if (MainPage.user.user_ID == -1)
            {
                Application.Current.MainPage = new NavigationPage(new LoginPage());
                return;
            }

            InitializeComponent();

            TodayDateLabel.Text = DateTime.Today.ToString("dddd, MMMM d, yyyy"); // e.g. Tuesday, May 13, 2025

            initializeAppointmentsToday();
            initializeAppointmentStatus();
        }
        private void initializeAppointmentsToday()
        {
            List<Appointment> list_of_app = this.ac.loadAppointmentsDefault(MainPage.user.user_ID);

            if(list_of_app.Count == 0)
            {
                Border border = createBorder();
                Label label = createLabel("No Appointments For Today");
                label.HorizontalTextAlignment = TextAlignment.Center;
                border.Content = label;
                appointments_today.Children.Add(border);
                return;
            }

            foreach(Appointment app in list_of_app)
            {
                Border border = createBorder();
                Label label = createLabel($"{DateTime.Today.Add(app.time).ToString("h tt")} Dr. {app.doctor.last_name}");
                border.Content = label;
                appointments_today.Children.Add(border);
            }

        }
        
        private void initializeAppointmentStatus()
        {
            List<Appointment> list_of_app = this.ac.loadAppointmentsStatus(MainPage.user.user_ID);

            if (list_of_app.Count == 0)
            {
                Border border = createBorder();
                Label label = createLabel("No Appointments");
                label.HorizontalTextAlignment = TextAlignment.Center;
                border.Content = label;
                appointment_status.Children.Add(border);
                return;
            }

            int i = 0;

            foreach(Appointment app in list_of_app)
            {
                Border border = createBorderStatus(app.status);
                VerticalStackLayout v_layout = createVLayout();
                Label label_out = createOuterLabel($"Dr. {app.doctor.last_name}");
                HorizontalStackLayout h_layout = createHLayout();
                Label label_in = createInnerLabel($"{app.date.ToString("MMM d")} - {DateTime.Today.Add(app.time).ToString("h tt")} - {app.status}");

                h_layout.Children.Add(label_in);

                v_layout.Children.Add(label_out);
                v_layout.Children.Add(h_layout);

                border.Content = v_layout;
                appointment_status.Children.Add(border);

                if(i > 2)
                {
                    break;
                }

                i++;
            }
        }

        private Border createBorderStatus(string status)
        {
            string color = "#FFFFFF";
            if (status == "Approved")
            {
                color = "#2AA97D";
            }
            else if (status == "Rejected")
            {
                color = "#FF4D4D";
            }
            else
            {
                color = "#FFA726";
            }

            Border border = new Border
            {
                BackgroundColor = Color.FromArgb(color),
                StrokeThickness = 0,
                StrokeShape = new RoundRectangle { CornerRadius = 10 },
                Padding = new Thickness(15)
            };
            return border;
        }

        private VerticalStackLayout createVLayout()
        {
            VerticalStackLayout vLayout = new VerticalStackLayout();
            return vLayout;
        }

        private Label createOuterLabel(string text)
        {
            Label label = new Label
            {
                Text = text,
                TextColor = Colors.White,
                FontSize = 14
            };
            return label;
        }

        private HorizontalStackLayout createHLayout()
        {
            HorizontalStackLayout hLayout = new HorizontalStackLayout();
            hLayout.Children.Add(createImage());
            return hLayout;
        }

        private Image createImage()
        {
            Image image = new Image
            {
                Source = "clock_icon.png",
                WidthRequest = 16,
                HeightRequest = 16
            };
            return image;
        }

        private Label createInnerLabel(string text)
        {
            Label label = new Label
            {
                Text = text,
                FontSize = 12,
                TextColor = Colors.White
            };
            return label;
        }
        private Border createBorder()
        {
            Border border = new Border
            {
                BackgroundColor = Color.FromArgb("#005F79"),
                StrokeThickness = 0,
                StrokeShape = new RoundRectangle { CornerRadius = 10 },
                Padding = new Thickness(15)
            };
            return border;
            
        }
        private Label createLabel(string Text)
        {
            Label l = new Label
            {
                Text = Text,
                TextColor = Colors.White,
                FontSize = 14
            };
            return l;
        }

        private async void OnHomeTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new HomePage());
        }

        private async void OnSearchTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SearchView());
        }

        private async void OnProfileTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new UserProfileView());
        }

        private async void OnViewAllTapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new AppointmentStatusPage());
        }
    }
}
