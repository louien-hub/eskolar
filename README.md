# Flutter Installation Guide

![Flutter Logo](https://storage.googleapis.com/cms-storage-bucket/6a07d8a62f4308d2b854.svg)

A comprehensive guide to installing and setting up Flutter on your system.

---

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## Installation

### Prerequisites

Before you begin, ensure you have met the following requirements:
- Operating System: Windows, macOS, or Linux
- Disk Space: 2.8 GB (does not include disk space for IDE/tools)
- Tools: Git for version control

### Steps

1. **Clone the Flutter repository**
    ```bash
    git clone https://github.com/flutter/flutter.git -b stable
    ```
2. **Add Flutter to your PATH**
    - On macOS and Linux:
        ```bash
        export PATH="$PATH:`pwd`/flutter/bin"
        ```
    - On Windows:
        ```cmd
        set PATH=%PATH%;C:\path\to\flutter\bin
        ```

3. **Run Flutter Doctor**
    ```bash
    flutter doctor
    ```

    Follow the instructions provided by `flutter doctor` to complete the setup, including installing any missing dependencies (e.g., Android Studio).

4. **Install Android Studio (for Android development)**
    - Download and install [Android Studio](https://developer.android.com/studio).
    - Open Android Studio, go to `Preferences > Appearance & Behavior > System Settings > Android SDK`.
    - Install the SDK platforms and tools required for Flutter development.

5. **Set up the iOS simulator (for macOS)**
    - Install Xcode from the App Store.
    - Open Xcode, go to `Preferences > Locations` and select the latest Xcode version in the `Command Line Tools` dropdown.

6. **Run your first Flutter app**
    - Navigate to the Flutter directory:
        ```bash
        cd flutter
        ```
    - Create a new Flutter project:
        ```bash
        flutter create eskolar
        ```
    - Navigate to your new project directory:
        ```bash
        cd eskolar
        ```
    - Run the app:
        ```bash
        flutter run
        ```

---

## Usage

### Basic Usage

Once Flutter is installed, you can start a new Flutter project using the following command:

```bash
flutter create eskolar
cd eskolar
flutter run
