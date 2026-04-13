# GPS Location Tracker — Sentinel Tech

> Pre-screening test Submission | **Sambudi Sugya Putra**.

A Flutter-based GPS location tracker for Android and iOS. Tracks location with configurable intervals, runs in the background even when the app is closed, and shows full session history with route visualization on Google Maps.

---

## Key Features

- **Real-time GPS Tracking** — Records location at configurable intervals (5s, 10s, 30s, 1m)
- **Background Tracking** — Continues tracking when the app is minimized or closed
- **Auto-restore on Relaunch** — Automatically resumes active tracking session when the app is reopened
- **Location History** — Browse, view, and delete past tracking sessions
- **Route Visualization** — Displays tracked path as a polyline on Google Maps with start/end markers
- **Configurable Settings** — GPS accuracy level, tracking interval, and keep-screen-on toggle
- **Offline Storage** — All tracking data stored locally using SQLite, and all setting stored using Shared Preference

---

## Tech Stack

| Category | Technology |
|---|---|
| Framework | Flutter 3.32.1 |
| Language | Dart 3.8.1 |
| State Management | flutter_bloc + freezed |
| Navigation | go_router |
| Dependency Injection | get_it |
| Local Database | sqflite |
| Background Service | flutter_foreground_task |
| Location | geolocator |
| Maps | google_maps_flutter |
| Secure Storage (Shared Preference) | flutter_secure_storage |
| Animation | lottie, flutter_animate |
| Code Generation | freezed, json_serializable, build_runner |

---

## Architecture

This project follows **Clean Architecture** principles combined with the **BLoC** pattern for state management.

```
Presentation Layer  →  Pages, Widgets, BLoC
Domain Layer        →  Repositories (abstract), Failures
Data Layer          →  Repository Implementations, Datasources, Models
```

Each feature is self-contained :
- `core/` — feature-specific enums, helpers, and workers
- `data/` — datasources, models, and repository implementations
- `domain/` — abstract repository contracts
- `managers/` — BLoC (events, states)
- `pages/` — UI pages and widgets

Cross-feature utilities :
- `src/core/` — config, DB, DI, router, error codes, failures
- `src/shared/` — reusable components, constants, and extensions

### Why BLoC?
- **Separation of concerns** — Keeps UI, business logic, and data clearly separated so each layer stays easy to reason about.
- **Predictable state** — every state change is explicit and traceable, making debugging straightforward.
- **Scalability** — each feature has its own isolated Bloc, preventing state leakage between features.
- **Reactive** — `BlocBuilder` and `BlocListener` allow fine-grained control over when widgets rebuild via `buildWhen` and `listenWhen`.

---

## Trade-offs & Decisions

### Why SQLite?
- I chose `sqflite` for direct SQL control — no ORM overhead, no extra codegen.
- Raw SQL queries provide full flexibility without the overhead of an ORM.
- No additional code generation setup is required beyond what already exists in the project.

### Why ForegroundTask over WorkManager?
- WorkManager enforces a minimum interval of 15 minutes for background tasks, which does not meet the test requirement of a minimum 5-second tracking interval.
- Flutter ForegroundTask runs as a proper Foreground Service on Android and Background Mode on iOS, allowing flexible interval configuration down to seconds.

### Constraints & Edge Cases
- Background execution was the biggest challenge. WorkManager enforces a minimum interval of 15 minutes, which didn’t meet the requirement. Because of that, I switched to ForegroundTask
- A GPS interval that is too short can conflict with the location insert process, so I added a time limit to the location fetch. Additionally, GPS accuracy varies across devices — even when set to Best accuracy, the actual result may return Medium or even Low depending on the device and environment.
- Android and iOS handle notification permissions differently, requiring slightly different permission request handlers for each platform.
- Incorrect use of dependency injection for the database can cause state to be lost when the app is killed — using `registerFactory` instead of `registerLazySingleton` for the Bloc caused state to reset on every navigation.
- Although Google Maps was properly set up and working, the map tiles occasionally fail to render. Rerunning the app resolves the issue. This appears to be related to how the API key is read at build time.

### What was validated

- Location tracking starts, records, and stops correctly
- Data persists in SQLite across app restarts
- Background tracking continues after app is minimized and killed
- Active session restores correctly when app is reopened
- Location history displays correctly with map and polyline
- Delete single and delete all work correctly including edge cases
- Permission handling on both platforms (location, notification)
- Settings persist across app restarts
- Keep Screen On toggle works during active tracking
- Google Maps renders correctly with markers and polyline

### Known Limitations

- **iOS Background Tracking** — ForegroundTask on iOS is less reliable — the OS can suspend it unexpectedly.
- **Inconsistent GPS Accuracy** — even when configured to Best accuracy, the actual result may return Medium or Low depending on the device hardware and environment conditions.
- **Google Maps Occasional Render Failure** — map tiles occasionally fail to render on first load. Rerunning the app resolves the issue.
- **Indonesian Localization Not Implemented yet** — Indonesian translation has been fully prepared in `.arb` files but has not been activated in the app yet.
- **No Unit Tests** — the project currently has no test implementation.
- **No Latest Real iPhone Device** — this app hasn't tested yet on the real Latest/Newest iPhone device. App may need some adjustment for it.
- **Notification Permission Handling** — i should have handle Notification Permission globally, one for all platforms.

### What would I improve
- **Unit Testing** — add unit tests for BLoC and repository layers to ensure tracking logic behaves correctly under different states.
- **Better business process analysis** — improve logging and monitoring for background task execution.
- **Dark Mode** — implement a dark theme to complement the existing light UI.
- **Localization** — activate the Indonesian translation that has already been prepared in the `.arb` files.
- **Battery Optimization** — app doesn't have a best practice for battery optimization and I need to research more.
- **Research** — more research in Background Tracking especially on iOS.
- **Pause Button** — Add Pause Button for user so they can hold the location tracking temporarily.

---

### Testing Devices & Environments

| Platform | Device | OS Version |
|---|---|---|
| Android | Samsung Galaxy A52s | Android 14 |
| Android | Emulator | Android 16 |
| iOS | iPhone 7 | iOS 15 |
| iOS | Simulator iPhone 14 | Latest |

---

## Getting Started

### Prerequisites

- Flutter 3.32.1
- Dart 3.8.1
- Android SDK (min SDK 21 / Android 5.0)
- iOS 14.0+
- Google Maps API Key File (.env)

### 1. Clone the repository

```bash
git clone https://github.com/sambudisp/gps_location_tracker_sentinel_tech
cd gps_location_tracker_sentinel_tech
```

### 2. Install dependencies & base project

```bash
flutter pub get
```

### 3. Configure environment

Copy `.env` that has been sent by sambudisp@gmail.com to the project

```env
MAPS_API_KEY=make_sure_this_is_not_empty
```

### 4. Google Maps Setup

**Android** — The API key is automatically read from `.env` via `build.gradle`. No additional setup required.

**iOS** — Add Google Map API key to `ios/Flutter/Secret.xcconfig`by :
- Running the scripts/setup_ios_keys.sh
- Make sure Secret.xcconfig is generated
- Add #include "Secret.xcconfig" to Release.xcconfig and Debug.xcconfig

### 5. Run the app
```bash
flutter run -t lib/main.dart;
```
---

## Project Structure

```
assets/                         # Raw assets (fonts, icons, lottie, colors)
lib/
├── assets/                     # Generated assets via flutter_gen
├── l10n/                       # Localization files
└── src/
    ├── core/                   # App-wide infrastructure
    │   ├── config/             # GoRouter configuration
    │   ├── constants/          # App decorations & theme
    │   ├── db/                 # SQLite initiate, helper & schema
    │   ├── domain/             # Base failure classes
    │   ├── enums/              # Global enums
    │   ├── helpers/            # Global helpers
    │   └── injection/          # GetIt service locator
    ├── features/
    │   ├── location-tracker/
    │   │   ├── core/           # Feature-specific utilities
    │   │   │   ├── enums/      # LocationStatus
    │   │   │   ├── helpers/    # LocationPermissionHelper, TimeHelper
    │   │   │   └── workers/    # ForegroundService & ForegroundTask
    │   │   ├── data/           # Data layer
    │   │   │   ├── datasources/
    │   │   │   │   └── local/  # SQLite datasource
    │   │   │   ├── models/     # TrackedLocationDataModel, DetailModel
    │   │   │   └── repositories/ # Repository implementations
    │   │   ├── domain/         # Domain layer
    │   │   │   └── repositories/ # Abstract repository contracts
    │   │   ├── managers/       # BLoC (events, states)
    │   │   └── pages/          # UI pages
    │   │       └── widgets/    # Extracted specific UI as Widgets
    │   ├── setting/
    │   │   ├── core/           # Feature-specific utilities
    │   │   ├── data/           # Data layer
    │   │   │   ├── datasources/
    │   │   │   │   └── local/  # SecureStorage datasource
    │   │   │   └── repositories/ # Repository implementations
    │   │   ├── domain/         # Domain layer
    │   │   │   └── repositories/ # Abstract repository contracts
    │   │   ├── managers/       # BLoC (events, states)
    │   │   └── pages/          # UI pages
    │   │       └── widgets/    # Extracted specific UI as Widgets
    │   └── splash/             
    │       └── pages/          # UI pages
    │           └── widgets/    # Extracted specific UI as Widgets
    └── shared/                 # Shared folder for global needs
        ├── components/         # Reusable widgets
        │   ├── display/        # Display-only widgets (cards, labels, ...)
        │   ├── interactive/    # Interactive widgets (buttons, dialogs, ...)
        │   └── widgets/        # General shared widgets
        ├── constants/          # Shared UI constants
        └── utils/              # Shared extensions & utilities
```

---

## Development Commands

### Run

```bash
# Debug
flutter run -t lib/main.dart;

# Release
flutter run --release -t lib/main.dart;
```

### Build

```bash
# Android APK
flutter build apk -t lib/main.dart --obfuscate --split-debug-info=build/app/outputs/symbols ; 

# iOS IPA
flutter build ipa -t lib/main.dart --obfuscate --split-debug-info=build/app/outputs/symbols ; 
```

### Code Generation
Build using existing makefile :

```bash
make init
cd ios && pod install
```
---

## Code Style
- Use dart format for consistent formatting
- Follow the project's established patterns for BLoC, repositories, and services

### General

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `const` constructors wherever possible
- Prefer `final` over `var`
- Keep widgets small and focused — extract into separate widget classes

### State Management Pattern
```
RequestStatus.idle     → initial state/idle state
RequestStatus.loading  → async operation in progress
RequestStatus.success  → operation completed successfully
RequestStatus.error    → operation failed, errorCode set in state
RequestStatus.restored → active session restored from DB on app relaunch
```