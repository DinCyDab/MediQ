using System;
using Microsoft.Maui.Controls;
using System.Data.SqlClient;
using Microsoft.Maui.Storage;
using MediQ.MVC.Models;
using MediQ.MVC.Controller;

namespace MediQ.MVC.View;

public partial class LoginPage : ContentPage
{
    public LoginPage()
    {
        //if (MainPage.user.user_ID != -1)
        //{
        //    Navigation.PopToRootAsync();
        //    Navigation.PushAsync(new HomePage());
        //}

        MainPage.user.user_ID = -1;

        InitializeComponent();
        loginButton.Clicked += OnLoginClicked;

        // Navigate to SignupPage when Sign Up button is clicked
        signupButton.Clicked += async (s, e) =>
        {
            await Navigation.PushAsync(new SignupPage());
        };

    }

    private async void OnLoginClicked(object sender, EventArgs e)
    {
        string email = emailEntry.Text?.Trim();
        string password = passwordEntry.Text;

        if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
        {
            await DisplayAlert("Error", "Please enter both email and password.", "OK");
            return;
        }

        try
        {
            string connectionString = "Server=localhost;Database=MediQ;Trusted_Connection=True;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                await conn.OpenAsync();

                string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email AND Password = @Password";

                password = PasswordHash.Hash(password);
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    int count = (int)await cmd.ExecuteScalarAsync();

                    if (count > 0)
                    {
                        UserController uc = new();
                        MainPage.user = uc.loadUser(email, password);
                        //User user = new User();
                        //int id = (int)reader["user_ID"];
                        //email = (string)reader["email"];
                        //string first_name = (string)reader["first_name"];
                        //string last_name = (string)reader["last_name"];

                        //user.user_ID = id;
                        //user.email = email;
                        //user.first_name = first_name;
                        //user.last_name = last_name;

                        //MainPage.user = user;
                        Preferences.Set("UserId", 999); // Replace 999 with the actual ID if needed
                        Application.Current.MainPage = new NavigationPage(new HomePage());

                        //await Navigation.PushAsync(new HomePage());
                        // TODO: Navigate to homepage or dashboard
                    }
                    else
                    {
                        await DisplayAlert("Error", "Invalid email or password.", "OK");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("DB Error", ex.Message, "OK");
        }
    }
    private async void OnGuestClicked(object sender, EventArgs e)
    {
        // Simulate setting user ID as -2 for guest

        Preferences.Set("UserId", -2);
        await Navigation.PushAsync(new SearchView());

        // TODO: Replace this with actual navigation to home/dashboard
        // await Navigation.PushAsync(new HomePage());
    }

}
