🔄 Project Update: Login, Signup, and Guest Flow Integration
✅ New Pages Added
SignupPage.xaml — user registration UI

SignupPage.xaml.cs — SQL insert logic to add new users

🛠 Modified Files
🔹 LoginPage.xaml
Styled form inputs using Frame

Added working LOG IN and SIGN UP buttons

Added Continue as Guest button at the bottom

🔹 LoginPage.xaml.cs
Connected login logic to SQL Server Users table

Added navigation to SignupPage

Added guest logic: sets Preferences.Set("UserId", -2) and redirects to MainPage

🔹 MainPage.xaml
Added Back to Login button (visible only if logged in as guest)

Fixed Clicked event bindings (e.g., goToSearchPage, goToBookingPage)

Cleaned up legacy or placeholder buttons

🔹 MainPage.xaml.cs
Pulled UserId from Preferences to show/hide guest UI

Restored navigation logic for:

goToSearchPage

goToBookingPage

OnBackToLoginClicked

🔹 AppShell.xaml
Updated ShellContent to use:

xmlns:view="clr-namespace:MediQ.MVC.View"

ContentTemplate="{DataTemplate view:MainPage}"

