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


