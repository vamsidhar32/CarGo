# Auto #

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# CarGo # 
 **Steps to install Android Studio on Windows**

1. Download Android Studio:<br>
• Go to the official Android Studio website: https://developer.android.com/studio.<br>
• Click on the ”Download” button.<br>
• Download the version for Windows.<br>
2. Run the installer:<br>
• Locate the downloaded installer file (usually a .exe file).<br>
• Double-click on the installer to run it.<br>
3. Choose components:<br>
• Select “Custom” installation to customize the components or choose “Standard” for the
default components.<br>
• Ensure that “Android Virtual Device (AVD)” and “Performance (Intel ® HAXM)” are
selected.<br>
4. Choose install location:<br>
• Select the destination folder where you want to install Android Studio.<br>
• Click “Next”.<br>
5. Install type:<br>
• Choose the type of setup you want (Standard or custom).<br>
• Click “Next”.<br>
6. Complete Installation:<br>
• Click “Install” to start the installation process.<br>
7. Complete setup:<br>
• Once the installation is complete, click “Next” and then “Finish”.<br>
8. Run Android Studio:<br>
• Launch Android Studio by finding it in your Start Menu or desktop shortcuts.<br>
• The first time you run Android Studio, it will download and install the Android SDK
components.<br>
9. Configure SDK:<br>
• Follow the setup wizard to configure the Android SDK with the necessary packages.<br>
• Download the SDK components required for your development.<br>
10. Finish Setup:<br>
• Once the SDK components are downloaded and installed, you should be ready to start
Android development.<br>
11. Configure Android Virtual Device (AVD):<br>
• Create an Android Virtual Device to test your applications.<br>
• Go to “Tools” > “AVD Manager” and create a new virtual device<br>


**Creating a basic UI in Android Studio**

1. Create a new project:<br>
• Open Android Studio.<br>
• Click on “Start a new Android Studio project.”<br>
• Choose an appropriate template. For a basic UI, you can start with an “Empty Activity”
or “Basic Activity.”<br>
2. Configure your project:<br>
• Enter the name of your application in the “Name” field.<br>
• Set the “Save location” for your project.<br>
• Choose the language (Java or Kotlin).<br>
• Set the minimum API level. For a basic project, you can use a relatively low API level.<br>
3. Design the UI:<br>
• Open the ‘res’ folder in the ‘app/src/main directory’.<br>
• Navigate to the ‘res/layout folder’.<br>
• Open the ‘activity main.xml file’. This file defines the layout of your main activity.<br>
• You can use the visual editor or switch to the XML view to define your UI components.<br>
4. Add UI components:<br>
• Drag and drop UI components from the Palette (located on the left side) to the layout.<br>
• Common UI components include ‘TextView’ (for displaying text), ‘Button’ (for user
interaction), ‘EditText’ (for user input), etc.<br>
5. Adjust properties:<br>
• Customize the properties of each component using the Attributes panel. You can set
properties such as text, color, size, etc.<br>
6. Connect UI elements with code:<br>
• Open the corresponding Java or Kotlin file for your main activity (‘MainActivity.java’
or ‘MainActivity.kt’).<br>
• Define variables for the UI components by using ‘findViewById’.<br>
• Perform any necessary actions or logic in response to user interactions.<br>
7. Run your app:<br>
• Connect a physical Android device or use an emulator.<br>
• Click on the ”Run” button (green triangle) in the toolbar to build and run your app.<br>
8. Test your app:<br>
• Interact with your app on the emulator or device to ensure that the UI behaves as
expected.<br>


**Adding firebase to the android project**
1. Create a Firebase project<br>
2. Register your app with Firebase<br>
• Go to the Firebase console.<br>
• In the center of the project overview page, click the Android icon or Add app to launch
the setup workflow.<br>
• Enter your app’s package name in the Android package name field.<br>
• (Optional) Enter other app information: App nickname and Debug signing certificate
SHA-1.<br>
• Click Register app.<br>
3. Add a Firebase configuration file<br>
• Download and then add the Firebase Android configuration file (google-services.json) to
your app:<br>
(a) Click Download google-services.json to obtain your Firebase Android config file.<br>
(b) Move your config file into the module (app-level) root directory of your app<br>
• To make the values in your google-services.json config file accessible to Firebase SDKs,
you need the Google services Gradle plugin (google-services).<br>
(a) In your root-level (project-level) Gradle file (<project>/build.gradle.kts or
<project>/build.gradle), add the Google services plugin as a dependency<br>
(b) In your module (app-level) Gradle file (usually <project>/<app-module>
/build.gradle.kts or <project>/<app-module>/build.gradle), add the Google
services plugin.<br>
4. Add Firebase SDK’s to your app<br>
• In your module (app-level) Gradle file (usually <project>/<app-module>/build.gradle.kts
or <project>/<app-module>/build.gradle), add the dependencies for the Firebase
products that you want to use in your app.<br>
• After adding the dependencies for the products you want to use, sync your Android
project with Gradle files.<br>



**Google authentication using Firebase**

1. Enable Google Sign-In in Firebase Console:<br>
• In the Firebase Console, navigate to ”Authentication” ”Sign-in method.”<br>
• Enable Google as a sign-in provider.<br>
2. Update Dependencies:<br>
• Open your app-level build.gradle file.<br>
• Add the dependencies<br>
• Click “Sync Now” in Android Studio to sync your project with the updated dependencies.<br>
3. Implement Google Sign-In in Your Android App:<br>
• In your ‘MainActivity’ or another relevant activity, initialize Firebase Authentication<br>
• Configure Google Sign-In options<br>
• Initialize ‘GoogleSignInClient’ using the configured options<br>
• Trigger Google Sign-In when the user taps on a button or performs a relevant action<br>
• Override ‘onActivityResult’ to handle the result of the sign-in activity<br>
• Implement the ‘handleSignInResult’ method to process the sign-in result<br>
• After obtaining the GoogleSignInAccount, authenticate with Firebase<br>


**Email authentication using Firebase**
1. Set Up Firebase Authentication:<br>
• In the Firebase Console, go to the “Authentication” section.<br>
• Enable the “Email/Password” sign-in method.<br>
2. Add Firebase SDK to your Android Studio Project:<br>
• Open your Android Studio project.<br>
• Add the Firebase SDK by adding the dependencies to your ‘build.gradle’ files.<br>
3. Initialize Firebase in your App:<br>
• In your ‘Application’ class or the main activity, initialize Firebase<br>
4. Create a Registration Activity:<br>
• Create a new activity for user registration.<br>
• Design a layout with input fields for email and password, along with a registration
button.<br>
5
5. Implement Firebase Email Registration:<br>
• In the registration activity, get references to the email and password fields.<br>
• Use the Firebase Authentication API to create a new user account with the entered
email and password.<br>
6. Create a Login Activity:<br>
• Create a new activity for user login.<br>
• Design a layout with input fields for email and password, along with a login button.<br>
7. Implement Firebase Email Login:<br>
• In the login activity, get references to the email and password fields.<br>
• Use the Firebase Authentication API to sign in the user with the entered email and
password.<br>
8. Handle User Authentication State:<br>
• You may want to check the user’s authentication state when your app starts. If the
user is already authenticated, you can skip the login/registration screens and take them
directly to the main app screen.<br>
9. Add Sign Out Functionality:<br>
• Implement a sign-out button.<br>


**Connecting to real time database using Firebase**
1. Create a Database<br>
• Navigate to the Realtime Database section of the Firebase console. You’ll be prompted
to select an existing Firebase project. Follow the database creation workflow.<br>
• Select a starting mode for your Firebase Security Rules:<br>
(a) Test mode<br>
– Good for getting started with the mobile and web client libraries, but allows
anyone to read and overwrite your data.<br>
(b) Locked mode<br>
– Denies all reads and writes from mobile and web clients. Your authenticated
application servers can still access your database.<br>
• Choose a location for the database.<br>
(a) Depending on the location of the database, the URL for the new database will be
in one of the following forms:<br>
– DATABASE NAME.firebaseio.com (for databases in us-central1)<br>
– DATABASE NAME.REGION.firebasedatabase.app (for databases in all other locations)<br>
• Click done.<br>
2. Add the Realtime Database SDK to your app<br>
• In your module (app-level) Gradle file (usually <project>/<app-module>/build.gradle.kts
or <project>/<app-module>/build.gradle), add the dependency for the Realtime
Database library for Android.<br>
3. Configure Realtime Database Security Rules<br>
• The Realtime Database provides a declarative rules language that allows you to define
how your data should be structured, how it should be indexed, and when your data can
be read from and written to.<br>
4. Write to your database.<br>
5. Read from your database.<br>







