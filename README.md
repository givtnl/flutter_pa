# flutter_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



Installation instructions Flutter on Windhoos (Assuming you have already installed Android Studio)

// Install flutter
- Get following zip: https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_2.2.3-stable.zip
- Extract contents of zip into C:\Users\<your-user-name>\Documents
- Under User variables check if there is an entry called Path:
        - If the entry exists, append the full path to flutter\bin using ; as a separator from existing values.
        - If the entry doesn’t exist, create a new user variable named Path with the full path to flutter\bin as its value.

// Install Chocolatey
- Open adminstrative shell (I used Powershell as adminstrator)
        - Run this command: Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

// Install Darts
- Run this command: choco install dart-sdk

// Finalizing setup
- Lets check if we need any other platform dependencies
        - flutter doctor
- You might need to pin point the Android Studio directory for flutter.
        - Run this command: flutter config --android-studio-dir "C:\Program Files\Android\Android Studio"
- You might need to enable flutter for windows desktop.
        - Run this command: flutter config --enable-windows-desktop

// Project setup
- Open the Flutter project in Android Studio
        - Go to File > Settings > Language & Frameworks
                - Select Dart
                        - Enable Dart support for current project
                        - Enter the Dart SDK location: C:\Users\<your-user-name>\Documents\flutter\bin\cache\dart-sdk
                        - Enable Dart for the project's modules
                - Select Flutter
                        - Enter the Flutter SDK location: C:\Users\<your-user-name>\Documents\flutter


Happy Developing!
  __ _           _
 / _| |         | |
| |_| | __ _ ___| |__
|  _| |/ _` / __| '_ \
| | | | (_| \__ \ | | |
|_| |_|\__,_|___/_| |_|



