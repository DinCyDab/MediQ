using MediQ.MVC.Controller;

namespace MediQ.MVC.View.Modals
{
    public partial class SettingsModal : ContentPage
    {
        // Assuming this is your user controller for interacting with the database
        private UserController uc = new UserController();

        public SettingsModal()
        {
            InitializeComponent();
            // Set initial values to the fields
            if (MainPage.user != null)
            {
                FirstName.Text = MainPage.user.first_name;
                LastName.Text = MainPage.user.last_name;
            }
        }

        private async void OnSaveClicked(object sender, EventArgs e)
        {
            // Retrieve the updated values from the Entry fields
            string firstName = FirstName.Text;
            string lastName = LastName.Text;
            string newPassword = PasswordEntry.Text;
            string currentPassword = (string)CurrentPassword.Text;

            if (string.IsNullOrWhiteSpace(currentPassword))
            {
                await DisplayAlert("Error", "Please fill in the current password field.", "OK");
                return;
            }

            string email = MainPage.user.email;
            var user = this.uc.loadUser(email, PasswordHash.Hash(currentPassword));
           
            // Validate that the name and password are not empty
            if (string.IsNullOrWhiteSpace(firstName) ||
                string.IsNullOrWhiteSpace(lastName) ||
                string.IsNullOrWhiteSpace(currentPassword))
            {
                await DisplayAlert("Error", "Please fill in all fields.", "OK");
                return;
            }

            if (user == null)
            {
                await DisplayAlert("Error", "Failed to update your information. Please try again.", "OK");
                return;
            }

            bool isUpdated = false;

            if (!string.IsNullOrWhiteSpace(newPassword))
            {
                newPassword = PasswordHash.Hash(newPassword);
                // Update the user in the database using the UserController
                isUpdated = this.uc.updateUser(MainPage.user.user_ID, firstName, lastName, newPassword);
            }
            else
            {
                isUpdated = this.uc.updateUser(MainPage.user.user_ID, firstName, lastName);
            }

            if (isUpdated)
            {
                // Update the values in MainPage.user if the database update was successful
                MainPage.user.first_name = firstName;
                MainPage.user.last_name = lastName;
                MainPage.user.password = newPassword;

                // Display a confirmation message
                await DisplayAlert("Saved", "Your information has been updated.", "OK");

                // Close the modal
                await Navigation.PopModalAsync();
            }
            else
            {
                // If the update failed
                await DisplayAlert("Error", "Failed to update your information. Please try again.", "OK");
            }
        }

        private async void OnCancelClicked(object sender, EventArgs e)
        {
            // Close the modal without saving
            await Navigation.PopModalAsync();
        }
    }
}
