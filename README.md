# GPS Location Tracker — Sentinel Tech

> A pre-screening test submission | **Sambudi Sugya Putra**.

A cross-platform GPS location tracking application built with Flutter for Android and iOS. The app records the user's GPS location with configurable intervals, supports continuous background tracking even when the app is closed, and provides a full history of past tracking sessions with route visualization on Google Maps.

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
flutter run -t lib/main.dart;\
```

---

## Project Structure

```
assets/
lib/
├── assets/
├── l10n/
└── src/
    ├── core/                          
    ├── features/
    │   ├── location-tracker/
    │   │   ├── core/
    │   │   │   ├── enum/
    │   │   │   ├── helpers/
    │   │   │   ├── workers/
    │   │   │   ├── models/
    │   │   │   └──  repositories/
    │   │   ├── data/
    │   │   │   ├── datasources/
    │   │   │   │   └── local/
    │   │   │   ├── models/
    │   │   │   └── repositories/
    │   │   ├── domain/
    │   │   │   └── repositories/
    │   │   ├── managers/
    │   │   └── pages/
    │   │       └── widgets/
    │   ├── setting/
    │   │   ├── core/
    │   │   ├── data/
    │   │   │   ├── datasources/
    │   │   │   │   └── local/
    │   │   │   └── repositories/
    │   │   ├── domain/
    │   │   │   └── repositories/
    │   │   ├── managers/
    │   │   └── pages/
    │   │       └── widgets/
    │   └── splash/
    │   │   └── pages/
    │   │       └── widgets/
    └── shared/                        
    │   ├── components/   
    │   │   ├── display/
    │   │   ├── interactive/
    │   │   └── widgets/            
    │   ├── constants/                
    │   └── utils/                    
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