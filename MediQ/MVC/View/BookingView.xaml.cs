using MediQ.MVC.Controller;
using MediQ.MVC.Models;
using MediQ.MVC.View.Modals;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.View
{
    public partial class BookingView : ContentPage
    {
        ScheduleController sched_c = new ScheduleController();
        SearchController search_c = new SearchController();
        Doctors doctor = new Doctors();
        int selected_schedule_ID = -1;
        public BookingView()
        {
            InitializeComponent();
        }
        public BookingView(int doctor_ID)
        {
            if (MainPage.user.user_ID == -1)
            {
                Navigation.PopToRootAsync();
                Navigation.PushAsync(new LoginPage());
                return;
            }
            InitializeComponent();

            loadDoctorName(doctor_ID);
            createSchedule(doctor_ID);
        }

        public void openConfirmation(object sender, EventArgs e)
        {
            if(selected_schedule_ID == -1)
            {
                DisplayAlert("Wait", "Please select one of the schedule", "OK");
                return;
            }

            Navigation.PushAsync(new AppointmentConfirmation(selected_schedule_ID));
        }
        public void goBack(object sender, EventArgs e)
        {
            Navigation.PopAsync();
        }
        public void setSelectedSchedule(int schedule_ID)
        {
            this.selected_schedule_ID = schedule_ID;
        }

        public void createSchedule(int doctor_ID)
        {
            List<Schedule> available_sched = this.sched_c.loadNext4DaysSchedule(doctor_ID);
            int i = 0;
            
            foreach(Schedule sched in available_sched)
            {
                string date = sched.date.ToString();
                List<Schedule> list_of_schedule = this.sched_c.loadSchedule(doctor_ID, date);
                Border border = createBorder();
                VerticalStackLayout v_layout = createVLayout();
                Label out_label = createOutLabel(sched.date.ToString("MMM d - ddd"));
                Grid grid = createGrid();
                int j = 0;
                int k = 0;

                foreach(Schedule s in list_of_schedule)
                {
                    Frame f = createFrame();
                    string format = DateTime.Today.Add(s.time).ToString("h tt");
                    Label inner_label = createInnerLabel(format);

                    var tap = new TapGestureRecognizer();
                    tap.Tapped += (sender, e) =>
                    {
                        setSelectedSchedule(s.schedule_ID);
                    };

                    f.GestureRecognizers.Add(tap);

                    f.Content = inner_label;
                    grid.Children.Add(f);
                    grid.SetRow(f, k);
                    grid.SetColumn(f, j);

                    j++;
                    if (j > 3)
                    {
                        k++;
                        j = 0;
                    }
                }

                v_layout.Add(out_label);
                v_layout.Add(grid);

                border.Content = v_layout;
                data_holder.Children.Add(border);
                data_holder.SetRow(border, i);
                i++;
            }
        }

        public void loadDoctorName(int doctor_ID)
        {
            this.doctor = this.search_c.loadDoctor(doctor_ID);
            doctor_name.Text = $"Dr. {doctor.first_name} {doctor.last_name} - {doctor.category.category_name}";
        }

        public void testBook(object sender, EventArgs e)
        {

        }

        public Border createBorder()
        {
            Border border = new Border
            {
                Stroke = Colors.Transparent
            };

            return border;
        }

        public VerticalStackLayout createVLayout()
        {
            VerticalStackLayout v = new VerticalStackLayout();
            return v;
        }

        public Label createOutLabel(string text)
        {
            Label l = new Label
            {
                Text = text,
                Margin = new Thickness(0, 0, 0, 10),
                FontAttributes = FontAttributes.Bold
            };
            return l;
        }

        public Grid createGrid()
        {
            Grid g = new Grid
            {
                RowDefinitions =
                {
                    new RowDefinition(), new RowDefinition(), new RowDefinition(), new RowDefinition()
                },
                ColumnDefinitions =
                {
                    new ColumnDefinition(), new ColumnDefinition(), new ColumnDefinition(), new ColumnDefinition(),
                },
                ColumnSpacing = 5,
                RowSpacing = 5
            };
            return g;
        }
        public Frame createFrame()
        {
            Frame f = new Frame
            {
                Padding = 0,
                HeightRequest = 30,
                BackgroundColor = Colors.LightBlue,
                CornerRadius = 8,
                BorderColor = Colors.Transparent
            };
            return f;
        }

        public Label createInnerLabel(string text)
        {
            Label l = new Label
            {
                Text = text,
                VerticalOptions = LayoutOptions.Center,
                HorizontalOptions = LayoutOptions.Center,
                FontSize = 12,
                TextColor = Color.FromArgb("#095D7E"),
                FontAttributes = FontAttributes.Bold
            };
            return l;
        }
    }
}
