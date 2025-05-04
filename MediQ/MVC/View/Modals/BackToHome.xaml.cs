using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.View.Modals
{
    public partial class BackToHome : ContentPage
    {
        public BackToHome()
        {
            InitializeComponent();
        }

        public void goToMainPage(object sender, EventArgs e)
        {
            Navigation.PopToRootAsync();
        }
    }
}
