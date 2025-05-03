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
        public SearchView()
        {
            InitializeComponent();
            testCreate();
        }
        public async void goToMainPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MainPage());
        }
        public void testCreate()
        {
            var frame = new Frame
            {
                CornerRadius = 10,
                Margin = 10,
                BackgroundColor = Color.FromArgb("#CCECCE"),
                BorderColor = Colors.Transparent
            };

            var tapGesture = new TapGestureRecognizer();
            tapGesture.Tapped += goToMainPage;
            frame.GestureRecognizers.Add(tapGesture);

            var grid = new Grid
            {
                RowDefinitions = { new RowDefinition() },
                ColumnDefinitions = { new ColumnDefinition(), new ColumnDefinition(), new ColumnDefinition()}
            };

            frame.Content = grid;
            stack_layout.Add(frame);
        }
    }
}
