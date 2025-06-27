# balanced_meal

Food Ordering App - Test Project

## Features

- **Responsive Design**: Designed to work across both Android and iOS devices.

## Screenshots



## Setup Instructions

### Prerequisites

1. **Flutter SDK**: Ensure you have Flutter installed on your machine. If not, follow the [installation guide](https://flutter.dev/docs/get-started/install).
2. **Android Studio/VS Code**: Install an IDE of your choice (Android Studio or Visual Studio Code) for Flutter development.
3. **Xcode (for iOS)**: If you are developing for iOS, make sure you have Xcode installed.

### Steps to Run

**Clone the repository:**
```bash
git clone https://github.com/Israela608/balanced_meal.git
```

```bash
cd balanced_meal
```

**Install dependencies:**
```bash
flutter pub get
```
Run the app:

```bash
flutter run
```
For iOS, ensure that you have Xcode installed and use:
```bash
flutter run --ios
```

For Android, make sure you have an Android emulator or physical device connected, then use:
```bash
flutter run --android

```

## Code Structure
```
lib/common/: Custom widgets like text fields, buttons, and loading indicators.

lib/core/: Utility functions, including validators, app styles, colors and helpers.

lib/data/: Contains models used for user data and API responses, services, repos.

lib/modules/: Contains the main screens and View architecture.
```

## Dependencies
**flutter_screenutil:** Responsive UI.

**hooks_riverpod:** For state management.

**cloud_firestore:** Firebase database Integration.

**http:** HTTP requests.

**flutter_spinkit:** Custom Loading widget.

## License
This project is licensed under the MIT License - see the LICENSE file for details
