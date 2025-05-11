using MediQ.MVC.View;

namespace MediQ
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            //InitializeComponent();
            Routing.RegisterRoute(nameof(LoginPage), typeof(MediQ.MVC.View.LoginPage)); //tester

        }
    }
}
