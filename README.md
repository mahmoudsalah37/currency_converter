<div align="center">
  <h1>💱 Currency Converter</h1>
  
  [![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
  [![BLoC](https://img.shields.io/badge/BLoC-5BB9A2?style=for-the-badge&logo=bloc&logoColor=white)](https://bloclibrary.dev/)
  
  A modern, feature-rich currency conversion app built with Flutter that provides real-time exchange rates and seamless conversion between 170+ world currencies.
  
  [![GitHub stars](https://img.shields.io/github/stars/yourusername/currency_converter?style=social)](https://github.com/yourusername/currency_converter/stargazers)
  [![GitHub license](https://img.shields.io/github/license/yourusername/currency_converter)](https://github.com/yourusername/currency_converter/blob/main/LICENSE)
  [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
</div>

## ✨ Features

- **Real-time Exchange Rates**: Get the latest currency rates
- **Wide Currency Support**: Convert between 170+ world currencies
- **Clean UI**: Intuitive and responsive user interface
- **Offline Support**: View recent conversions when offline
- **Light/Dark Theme**: Choose your preferred theme
- **Quick Convert**: Fast and accurate conversions
- **Favorites**: Save frequently used currency pairs
- **Historical Data**: View exchange rate history (coming soon)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / Xcode (for emulator/simulator)
- An internet connection (for fetching exchange rates)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/currency_converter.git
   cd currency_converter
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run code generation for DI, routing, and models:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## 🏗️ Project Architecture

This project follows Clean Architecture with three distinct layers:

### 1. Data Layer
- **Repositories**: Implement domain interfaces
- **Data Sources**: Handle API and local storage operations
- **Models**: Data transfer objects (DTOs) and Hive models
- **Mappers**: Convert between domain and data models

### 2. Domain Layer
- **Entities**: Core business objects
- **Repositories**: Abstract interfaces for data operations
- **Use Cases**: Business logic components
- **Failures**: Custom error types

### 3. Presentation Layer
- **BLoCs**: Business Logic Components for state management
- **Screens**: UI pages
- **Widgets**: Reusable UI components
- **Theme**: App theming and styling

## 🛠️ Technical Stack

| Category           | Technology                          |
|--------------------|-------------------------------------|
| **Framework**      | Flutter                            |
| **Language**       | Dart                               |
| **State Management**| BLoC Pattern                       |
| **Dependency Injection** | GetIt + Injectable         |
| **Networking**     | Dio                                |
| **Local Storage**  | Hive                               |
| **Routing**        | auto_route                         |
| **Testing**        | Mockito, Bloc Test                 |
| **CI/CD**          | GitHub Actions (coming soon)       |

## 📱 Screenshots

| Light Theme | Dark Theme |
|-------------|------------|
| <img src="screenshots/light_theme.png" width="300"> | <img src="screenshots/dark_theme.png" width="300"> |
| Conversion Screen | Favorites |
| <img src="screenshots/conversion.png" width="300"> | <img src="screenshots/favorites.png" width="300"> |

## 🧪 Testing

The app includes comprehensive test coverage for:
- Unit tests for use cases and business logic
- Widget tests for UI components
- Integration tests for critical user flows

Run tests with:
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/feature/convert_currency_test.dart

# Run tests with coverage
flutter test --coverage
```

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

## 🙏 Acknowledgments

- [ExchangeRate-API](https://exchangerate.host/) for providing the currency exchange rates
- [Flutter](https://flutter.dev/) for the amazing cross-platform framework
- [BLoC Library](https://bloclibrary.dev/) for state management
- All contributors who have helped shape this project

## 📬 Contact

Your Name - [@yourtwitter](https://twitter.com/yourtwitter) - your.email@example.com

Project Link: [https://github.com/yourusername/currency_converter](https://github.com/yourusername/currency_converter)

---

<div align="center">
  Made with ❤️ using Flutter
</div>