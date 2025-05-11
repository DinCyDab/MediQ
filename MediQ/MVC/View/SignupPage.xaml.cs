using System;
using Microsoft.Maui.Controls;
using System.Data.SqlClient;

namespace MediQ.MVC.View;

public partial class SignupPage : ContentPage
{
    public SignupPage()
    {
        InitializeComponent();
        signupButton.Clicked += OnSignupClicked;
    }

    private async void OnSignupClicked(object sender, EventArgs e)
    {
        string firstName = firstNameEntry.Text?.Trim();
        string lastName = lastNameEntry.Text?.Trim();
        string email = emailEntry.Text?.Trim();
        string password = passwordEntry.Text;

        if (string.IsNullOrWhiteSpace(firstName) ||
            string.IsNullOrWhiteSpace(lastName) ||
            string.IsNullOrWhiteSpace(email) ||
            string.IsNullOrWhiteSpace(password))
        {
            await DisplayAlert("Missing Info", "Please fill in all fields.", "OK");
            return;
        }

        try
        {
            string connectionString = "Server=localhost;Database=MediQ;Trusted_Connection=True;";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                await conn.OpenAsync();

                // Optional: check if email already exists
                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@Email", email);
                    int exists = (int)await checkCmd.ExecuteScalarAsync();

                    if (exists > 0)
                    {
                        await DisplayAlert("Account Exists", "An account with this email already exists.", "OK");
                        return;
                    }
                }

                string insertQuery = @"INSERT INTO Users (email, password, first_name, last_name) 
                                       VALUES (@Email, @Password, @FirstName, @LastName)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);

                    int rows = await cmd.ExecuteNonQueryAsync();

                    if (rows > 0)
                    {
                        await DisplayAlert("Success", "Account created successfully!", "OK");
                        await Navigation.PopAsync(); // go back to login page
                    }
                    else
                    {
                        await DisplayAlert("Error", "Sign-up failed. Try again.", "OK");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Database Error", ex.Message, "OK");
        }
    }
}
