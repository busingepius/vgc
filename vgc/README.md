

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
