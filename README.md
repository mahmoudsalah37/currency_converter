# Currency Converter

A modern currency converter application built with Flutter, following Clean Architecture principles and implementing the BLoC pattern for state management.

## Build Instructions

1. Install Flutter SDK (version 3.0.0 or higher)
2. Clone the repository:
   ```sh
   git clone <repository-url>
   cd currency_converter
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run code generation for DI, routing, and freezed models:
   ```sh
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
5. Run the app:
   ```sh
   flutter run
   ```

## Architecture

This project implements **Clean Architecture** with three distinct layers:

1. **Data Layer**:
   - Handles data operations from both API and local storage
   - Contains repository implementations and data sources
   - Manages data caching and offline-first functionality

2. **Domain Layer**:
   - Core business logic layer
   - Contains entities, repository interfaces, and use cases
   - Pure Dart code with no external dependencies

3. **Presentation Layer**:
   - UI implementation using Material Design
   - BLoC pattern for state management
   - Handles user interactions and state updates

### Why Clean Architecture?
- Clear separation of concerns
- Highly testable due to layer independence
- Easy to maintain and scale
- Dependencies point inwards, making the domain layer completely independent

## Image Loading

The app uses Flutter's built-in `Image.network` widget for loading flag images from flagcdn.com. Reasons for this choice:

1. **Simplicity**: Native Flutter solution without additional dependencies
2. **Performance**: Built-in caching mechanism
3. **Error Handling**: Easy to implement loading and error states
4. **Memory Management**: Automatic image cache management by Flutter

## Database

The app uses **Hive** as the local database. Reasons for choosing Hive:

1. **Performance**: Fast, lightweight NoSQL database
2. **Cross-Platform**: Works seamlessly on all platforms
3. **Type Safety**: Strong typing with code generation
4. **No Native Dependencies**: Pure Dart implementation
5. **Easy to Use**: Simple API with minimal setup
6. **Offline Support**: Perfect for implementing offline-first architecture

## Testing

Unit tests are implemented for:
- API integration
- Business logic
- Repository layer
- Use cases

(Note: Unit tests need to be implemented)

## Dependencies

- **State Management**: flutter_bloc
- **Dependency Injection**: get_it + injectable
- **API Client**: dio
- **Local Database**: hive
- **Navigation**: auto_route
- **Charts**: fl_chart
- **Loading Effects**: shimmer