﻿namespace MediQ
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
        }

        protected override Window CreateWindow(IActivationState? activationState)
        {
            //return new Window(new AppShell()); //original
            //return new Window(new NavigationPage(new MainPage()));
            return new Window(new NavigationPage(new MediQ.MVC.View.LoginPage())); //test
        }
    }
}