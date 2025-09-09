# Currency Converter

A modern, production-ready Currency Converter application built with Flutter, showcasing Clean Architecture, BLoC for state management, and a stunning Glassmorphism UI.

## Architecture

This project follows the principles of **Clean Architecture** to ensure a scalable, maintainable, and testable codebase. The code is organized into three distinct layers:

-   **Domain Layer**: The core of the application. It contains the business logic, entities, and abstract repository definitions. This layer is pure Dart and has no dependencies on Flutter or any external packages.
-   **Data Layer**: Responsible for all data operations. It contains repository implementations that fetch data from remote (API) and local (database) sources.
-   **Presentation Layer**: The UI of the application. It uses the BLoC pattern to manage state and renders widgets based on the current state.

## Features

-   Real-time currency conversion.
-   Searchable list of all available currencies.
-   7-day historical data chart for selected currency pairs.
-   Offline-first experience with robust API caching.
-   Stunning Glassmorphism UI with smooth animations.

## Getting Started

### 1. Prerequisites

-   Flutter SDK (version 3.0.0 or higher)
-   Dart SDK

### 2. Installation

1.  **Clone the repository:**
    ```sh
    git clone <repository-url>
    cd currency_converter
    ```

2.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

### 3. Code Generation

This project uses code generation for dependency injection, routing, and data models. Run the following command to generate the necessary files:

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Run the App

```sh
flutter run
```