# iOS Developer Interview Coding Exercise

## Requirements
- **Tools Required**: Apple Developer Account, macOS 15+, Xcode 16.2+, Git.
- **Provided Resources**: Xcode Project (skeleton code).
- **Submission**: Candidates must create a Pull Request with their completed changes then notify your contact when it is complete.

## Prerequisites
1. Git is installed and you have a GitHub account.
2. Xcode is installed on your machine. Note - *For comptability purposes it is recommended that you are using the same version of macOS and Xcode that the Rakuten iOS Team uses.*
3. Xcode is logged into an Apple Developer account for access to Xcode Cloud.
4. Xcode is provisioned with correct certificates/profiles so candidate can properly run the app on simulator and/or device.


## Project Setup
1. Using git, fork this repository to your GitHub account.
2. Clone the forked repository to your machine.
3. Checkout the `main` branch.	
4. Open the provided Xcode project: `RakutenShoppingBrowser/RakutenShoppingBrowser.xcodeproj`.

## Guidelines
1. Complete the tasks in order.
2. Use Swift language and SwiftUI for all UI.
3. Do not use any 3rd party libraries, packages, or APIs. *They should not be needed to successfully complete any of the tasks.*
4. Ensure clean and readable code.
5. Provide comments/markdown where it may be beneficial for other developers to understand the code.
6. Although you are allowed to use external resources to assist you, Google/StackOverflow/AI/Etc, you must be able to understand and explain your code:
	- What it does? 
	- How it works? 
	- Why you implemented it that way?
	- Alternative approaches and solutions?

## Tasks

### Part 1

1. **Add Sample Files**:
	- Add all the sample files and directories from the repository to the Xcode project:
	- `API/`
	- `Extensions/`
	- `Images/` _(Note: Add the images to the Xcode project's Asset Catalog)_
	- `JSON/`
	- `Models/`
	- `Views/`
	- Any others in the repository...
	
2. **Authentication Screen**
	- In the `AuthenticationView.swift` file add the following UI elements:
		- Rakuten Logo
		- Email Input - _Should allow input for email address._
		- Password Input - _Should allow input for secured password._
		- Sign In Button - _When pressed this should print the email address and password textfield values in the console log._
		- Sign In with Apple Button - _Should utilize the Apple API for displaying the button but should not actually be functional._
		- Background Color - Set the bacgkround color to Purple.
3. **Navigation Stack**:
	- Update the app to use a `NavigationStack` and set the `AuthenticationView` as the root view. 
4. **Data Models**:
	- In the `Deal.swift` data model file, add a new function that will parse the `JSON` data from `JSON/deals.json` file into an array of `Deal` objects.
5. **Deals List Screen**:
	- Create a new SwiftUI View: `DealsList`.
	- Update the `AuthenticationView` so that when the Sign In Button is pressed it navigates to the `DealsList` screen.
	- Create a SwiftUI list to display all of the `Deal` objects created from the previous parsing function.
	- Create the UI so that each row displays:
		-  Store Logo
		-  Store Name
		-  Deal Title.

---

### Part 2

1. **Error Handling**:
   - Gracefully handle missing or corrupt data so that the deal is not displayed in the Deals List screen when any of these items are missing: Store Name, Store Logo Image Name/URL, Deal Title, Deal Terms.
2. **Deal Details Screen**:
   - Add a new view that displays a specifc deals detailed information, `DealDetails.swift`.
   - Update the `DealsList` view so that when you tap on a deal it navigates to `DealDetails`.
   - Create the UI in `DealDetails` so that it displays the deal's store logo image, store name, deal title and deal terms. Make sure to vertically center all the UI elements.
   - Add a "Shop Now" button at the bottom of the view. When tapped, it should open the deal's URL in the Safari app.
3. **Asynchronous Image Loading**:
   - Use Swift's `AsyncImage` or custom logic to load the store logo images from a URL. _NOTE: Sample URLs are provided in the JSON but may no longer be available. If that is the case you should find a similar image online and use that URL instead._
4. **Search Functionality**:
   - Allow users to filter deals using a search bar. Results should be displayed directly in the Deals List and match for Store name or Deal title. _Note: You can use any method available such as SwiftUI `.searchable(...)` view modifier or creating your own custom Search Bar view._

---

### Part 3

1. **MVVM**
	- Update the `DealList` and `DealDetails` views to use MVVM.
	- Move all appropriate logic to the view model.
	- Ensure the view model is an observable object and the view updates when the model changes.
2. **Caching**:
   - Cache deal data using your choice of storage: `UserDefaults`, `SwiftData`, etc.
   - Update the app so that when the `DealList` loads the deals it first checks for and uses the cache before attempting to parse the JSON files.
   - Add the ability to clear the cache when the device is shaken. It should also present an alert informing the user that the cache has been cleared.
3. **Settings Screen**
    - Create a new Settings screen with the following items:
        - Top Toolbar
            - Title: Settings
            - Dismiss Button
        - List
            - Clear Cache: Clears the cache and alerts the user the cache has been cleared.
            - Logout: Takes the user back to the Authentication screen.
    - Add a button that uses the `gear` icon from SF Symbols to the Deals List and Deals Details screens so when it is pressed it displays the Settings screen as a full sheet.
4. **Persistent State**:
   - Update the app so that when you tap the `Sign In` button in the `AuthenticationView` it sets a property, `isAuthenticated`, that can persist across app lifecycles.
   - Update the app to then check `isAuthenticated` and do the following based on it's value:
   		- **False**: The app should use the `AuthenticationView` as the root view.
   		- **True**: The app should bypass the `AuthenticationView` and use the `DealList` as the root view. 
5. **Pull-to-Refresh**
    - Add a Pull-to-Refresh control to the `DealsList` screen so that when the list is pulled from the top it reloads the data from the JSON file. _Note: This should clear the cache and reload the data directly from the original JSON file._

---

### Part 4

1. **Shopping Browser**:
    - Create a new `ShoppingBrowser` view that we can use as a browser directly in the app.
    - The browser should have the following:
        - Top Toolbar that displays the Store Name as the title, the current URL as the subtitle and a button for dismissing the browser.
        - Progress Bar for displaying and animating the current progress of the url request.
        - A WKWebView for displaying the URL page.
        - Bottom Toolbar that displays navigation controls:
            - Back - Loads the previous URL if available. Should be visible but disabled if no previous URL is available.
            - Forward - Loads the next URL if available. Should be visible but disabled if no next URL is available.
            - Reload - Reloads the current URL.
    - Update the Deal Details screen so that when the "Shop Now" button is pressed it opens the deal url in the `ShoppingBrowser` view as a sheet instead of the Safari app.
2. **Localization**:
   - Add Localization support by using the Xcode Localization Catalog for these languages: English (US), English (UK), and Spanish (Latin America).
   - Copy the translations from the `Localizations/` files for each of the languages.
   - Update the app to use the localized strings where applicable.
   - Test the localizations work by running the app and toggling the language setting.
3. **Theming**:
   - Add a new item in the Settings screen: Dark Mode.
   - Add a toggle to this item that toggles the app between Light and Dark mode.
   - Update the app with the following items:
    - Light Mode:
        - Authentication screen
            - Background = Purple
            - Text = Black
        - Deals List screen
            - Background = Gray
            - Text = Black
        - Settings screen
            - Background = Gray
            - Text = Black
    - Dark Mode:
        - Authentication screen
            - Background = Black
            - Text = White
        - Deals List screen
            - Background = Black
            - Text = White
        - Settings screen
            - Background = Black
            - Text = White

---

### Part 5

1. **Protocols***
	- Create a new protocol for reporting events: `EventReportingDelegate`.
	- Add a function to the protocol called `didViewDeal`.
	- Add conformance to the new protocol to `DealList` and have it print to the console something like "User did view deal: 123" with the deal's id whenever the function is triggered.
	- Add a new property, `eventReportingDelegate`, to the `DealDetails` view to act as the `EventReportingDelegate`.
	- Update the "Shop Now" button so that when it is tapped, it triggers the `didViewDeal` protocol function and provides the deal id.
2. **Asynchronous Networking**:
   - Use Charles Proxy to mock an API call to `http://rakuten.com/ios-coding-exercise`. Set Charles to return the JSON provided in the `JSON/mock-api-response.json` file.
   - Update the app to make a URL request for the Charles Proxy URL and parse the JSON response provided to be used as it's source of Deals data.
3. **Integrate Xcode Cloud CI/CD**:
   - In Xcode, create an Xcode Cloud workflow that builds and tests the app on commits to the `main` merges.

---

### Part 6

1. **Swift Packages**:
   - Create a reusable Swift Package, `FeatureFlags`, that will act as a simple Feature Flag system.
   - Create the following Feature Flags in the package:
   		- `isDarkModeEnabled`
   		- `isAppleSignInEnabled`
	- Include in the package a view, `FeatureFlagList`, that will display a list of the feature flags along with a switch that can toggle each of them on and off.
   - Add the swift package to the app.
   - Update the `SettingsView` to include a new section for displaying the `FeatureFlagList` view so that feature flags can be controlled directly in the app.
   - Update the `AuthenticationView` to use the `isAppleSignInEnabled` Feature Flag to determine if the "Sign in with Apple" button should be displayed or not.
   - Update the app to use the `isDarkModeEnabled` Feature Flag to determine if Dark Mode is supported.
   - Confirm that toggling the feature flags value from the `SettingsView` updates the app's state correctly without requiring app relaunch.

---
