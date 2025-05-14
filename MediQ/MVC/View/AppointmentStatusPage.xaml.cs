using System;
using MediQ.MVC.Controller;
using MediQ.MVC.Models;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls.Shapes;

namespace MediQ.MVC.View
{
    public partial class AppointmentStatusPage : ContentPage
    {
        AppointmentController ac = new();
        public AppointmentStatusPage()
        {
            InitializeComponent();
            initializeAppointmentStatus();
        }

        private void filterAppointments(object sender, EventArgs e)
        {
            var picker = sender as Picker;
            if(picker.SelectedIndex >= 0)
            {
                string filter = picker.Items[picker.SelectedIndex];
                appointment_status.Clear();
                getFilteredAppointments(filter);
            }
        }

        private Picker createPicker()
        {
            Picker picker = new Picker
            {
                Title = "Select an option",
                SelectedIndex = 0,
                BackgroundColor = Color.FromArgb("#005F79"),
                TextColor = Colors.White,
                TitleColor = Color.FromArgb("#005F79"),
            };

            picker.Items.Add("All Items");
            picker.Items.Add("Approved");
            picker.Items.Add("Pending");
            picker.Items.Add("Rejected");
            picker.SelectedIndexChanged += filterAppointments;

            return picker;
        }

        private void getFilteredAppointments(string filter)
        {
            List<Appointment> list_of_app = new();
            if (filter != "All Items")
            {
                list_of_app = this.ac.loadAppointmentsStatus(MainPage.user.user_ID, filter);
            }
            else
            {
                list_of_app = this.ac.loadAppointmentsStatus(MainPage.user.user_ID);
            }

            if (list_of_app.Count == 0)
            {
                Border border = createBorder();
                Label label = createLabel("No Appointments");
                label.HorizontalTextAlignment = TextAlignment.Center;
                border.Content = label;
                appointment_status.Children.Add(border);
                return;
            }

            foreach (Appointment app in list_of_app)
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

            foreach (Appointment app in list_of_app)
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

        private async void OnBackTapped(object sender, EventArgs e)
        {
            // Option 1: Go back in the navigation stack
            await Navigation.PopAsync();

            // Option 2: Force going to CalendarPage (uncomment if you prefer this instead)
            // await Navigation.PushAsync(new CalendarPage());
        }
    }
}
