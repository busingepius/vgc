# Prerequisite Guide (Flutter)

This guide will walk you through how to install and verify the required tools for the interview coding exercise. It will also confirm that you can run the exercise applications locally.

Please complete this guide prior to the interview. Total completion time is usually no more than one hour. This can vary based on how many tools are already installed on your machine.

You'll need to be able to run a **Flutter app** and a **backend API** (optional if applicable) on your local machine in order to complete the coding exercise.

Formatted `text like this` represents a command to run in your terminal.

## Install Tools/Languages

### 1) Install your preferred code editor or IDE
Flutter works well with many code editors and IDEs. Below are a few recommendations, but feel free to use whatever you prefer:

- [Android Studio](https://developer.android.com/studio) (Includes Flutter and Dart plugins)
- [Visual Studio Code (VSCode)](https://code.visualstudio.com) (With Flutter and Dart extensions)
- [IntelliJ IDEA](https://www.jetbrains.com/idea/) (Supports Flutter development with plugins)

Make sure to install the Flutter and Dart plugins/extensions for your chosen IDE.

### 2) Install Flutter SDK
#### Mac
1. Open your terminal and run:
    ```
    brew install --cask flutter
    ```
2. Add Flutter to your PATH:
    ```
    export PATH="$PATH:`flutter/bin`"
    ```

#### Windows
1. Download the Flutter SDK from [Flutter Dev](https://docs.flutter.dev/get-started/install/windows).
2. Extract the zip file and update your PATH environment variable to include the `flutter/bin` directory.

#### Linux
1. Follow the official installation guide here: [Flutter on Linux](https://docs.flutter.dev/get-started/install/linux).
2. Update your PATH:
    ```
    export PATH="$PATH:`flutter/bin`"
    ```

After installation, verify it by running:
```
flutter doctor
```
This will display any missing dependencies or configuration steps for your system.

### 3) Install NPM (if using a backend API)
If your Flutter app interacts with an API built using Node.js, you might need to install NPM to run the backend.

#### Mac
1. Install Homebrew: https://docs.brew.sh/Installation
2. Run the following commands:
    ```
    brew update
    brew doctor
    brew install node
    ```

#### Windows and Mac (Alternative)
1. Download and install Node.js: https://nodejs.org/en/download/
2. Follow the installation steps and accept the "Automatically install necessary tools" option.

### 4) Install Docker (optional, for backend API setup)
You may need Docker for running any backend API that the Flutter app might communicate with.

1. Download and install Docker from here: [Docker installation](https://docs.docker.com/get-docker/).

2. **For Windows Users:** You may need to install the Linux kernel update package to run Docker. Follow the steps here: https://docs.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package.

### 5) Run the Flutter App
1. Open your Flutter project in your chosen IDE (e.g., Android Studio or VSCode).
2. Ensure that a device (physical or emulator) is connected.
3. Run the following command in your terminal to start the app:
    ```
    flutter run
    ```

For further instructions, refer to the [README](./README.md) of your project.

------------------------------------------------------------------------------------------




# VGC Flutter Project

## Overview
This project is a Flutter application designed to demonstrate key features and implement a solution for the coding exercise. The app is built using Flutter SDK and can run on both iOS and Android platforms. It includes UI, state management, and interaction with optional backend services.

## Prerequisites

Before running the project, ensure you have the following installed on your machine:

1. **Flutter SDK**: Install the Flutter SDK from [Flutter Installation Guide](https://docs.flutter.dev/get-started/install).
2. **IDE**: Recommended IDEs include:
    - [Android Studio](https://developer.android.com/studio) (with Flutter & Dart plugins)
    - [VSCode](https://code.visualstudio.com) (with Flutter & Dart extensions)
    - [IntelliJ IDEA](https://www.jetbrains.com/idea/) (with Flutter & Dart support)
3. **Device/Emulator**: You will need an emulator or a physical device to run the app. Set up a device using Android Studio or Xcode (for iOS development).

If your project interacts with a backend API, ensure that you have the following installed:

4. **Node.js**: Download from [Node.js Official Site](https://nodejs.org/en/download/) (for running any backend services).
5. **Docker** (Optional): Download from [Docker Official Site](https://docs.docker.com/get-docker/) to run backend services inside containers.

## Setup Instructions

### 1. Clone the repository
```bash
git clone <repository_url>
cd <project_directory>
```

### 2. Install Flutter dependencies
Inside the project directory, run the following command to install the required dependencies:
```bash
flutter pub get
```

### 3. Verify Flutter installation
Run `flutter doctor` to ensure your Flutter installation is complete and to check for any missing dependencies:
```bash
flutter doctor
```

Resolve any issues reported by `flutter doctor` before proceeding.

### 4. Run the app

#### Running on Android
1. Open an Android emulator from Android Studio or connect a physical device.
2. In your terminal, run:
    ```bash
    flutter run
    ```

#### Running on iOS
1. Ensure you have Xcode installed (for macOS users).
2. Open an iOS simulator or connect a physical iPhone.
3. Run the following command in your terminal:
    ```bash
    flutter run
    ```

### 5. Running Backend API (Optional)

If the app interacts with an API, follow the API’s README instructions to run the backend services locally. Typically, the steps are as follows:

1. Navigate to the API directory:
    ```bash
    cd api
    ```
2. Install dependencies (if using Node.js):
    ```bash
    npm install
    ```
3. Run the API:
    ```bash
    npm start
    ```

You can also run the backend service inside a Docker container if applicable. Refer to the API’s documentation.

## Folder Structure

Here’s an overview of the folder structure:

```
/lib
                     # Main source code for the application
    /screens          # Screens for various views in the app
    /widgets          # Reusable UI components
    /models           # Data models
    /services         # API interaction or business logic services
    /utils            # Helper functions
/test                     # Unit and widget tests
/android                  # Android specific code and configuration
/ios                      # iOS specific code and configuration
```

## Testing

To run the tests for the project, use the following command:
```bash
flutter test
```

## Docker (For Backend, Optional)

If the project contains backend services running on Docker, follow these steps to start the services:

1. Navigate to the root of the project where the `docker-compose.yml` is located.
2. Run the following command to start the containers:
    ```bash
    docker-compose up
    ```

This will start the API and any other necessary services for the app.

## Troubleshooting

1. If the app does not run on a device/emulator, verify that the device is connected by running:
    ```bash
    flutter devices
    ```

2. If you encounter dependency issues, run:
    ```bash
    flutter clean
    flutter pub get
    ```

3. Ensure all prerequisites such as the SDK, emulators, and backend services are properly installed.

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Documentation](https://dart.dev/guides)
- [Official Node.js Guide](https://nodejs.org/en/docs/)
