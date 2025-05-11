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
                NameEntry.Text = MainPage.user.first_name + " " + MainPage.user.last_name;
            }
        }

        private async void OnSaveClicked(object sender, EventArgs e)
        {
            // Retrieve the updated values from the Entry fields
            string newName = NameEntry.Text;
            string newPassword = PasswordEntry.Text;

            // Validate that the name and password are not empty
            if (string.IsNullOrWhiteSpace(newName) || string.IsNullOrWhiteSpace(newPassword))
            {
                await DisplayAlert("Error", "Please fill in all fields.", "OK");
                return;
            }

            // Split the name into first name and last name (you may want to refine this)
            string[] nameParts = newName.Split(' ');
            string newFirstName = nameParts[0];
            string newLastName = nameParts.Length > 1 ? nameParts[1] : "";

            // Update the user in the database using the UserController
            bool isUpdated = this.uc.updateUser(MainPage.user.user_ID, newFirstName, newLastName, newPassword);

            if (isUpdated)
            {
                // Update the values in MainPage.user if the database update was successful
                MainPage.user.first_name = newFirstName;
                MainPage.user.last_name = newLastName;
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
