# ChatBot 🤖

An AI-powered chatbot mobile application built with Flutter, integrating the **Gemini AI** API with production-grade architecture, automated testing, and CI/CD pipelines.

---

## Screenshots

 <img width="959" height="511" alt="chat bot" src="https://github.com/user-attachments/assets/8a586ca7-32be-4699-96ec-18826f277ecb" />  <img width="400" height="800" alt="show loading" src="https://github.com/user-attachments/assets/b811cbe0-b9e3-4536-af0b-2e4ff9ec69ff" />
<img width="400" height="800" alt="retry logic" src="https://github.com/user-attachments/assets/246541f0-cabe-464b-98c4-3295c1107fc0" />


---

## Features

- 💬 **AI Chat** — Conversational interface powered by Google Gemini AI
- 🔁 **Retry Logic** — Automatic retry mechanism for failed message requests
- 🏗️ **Clean Architecture** — Fully separated data, domain, and presentation layers
- 💉 **Dependency Injection** — Service locator pattern using GetIt
- 🧪 **Unit & Integration Tests** — Full test coverage with Mocktail
- 🚀 **CI/CD Pipeline** — Automated build and test workflows via GitHub Actions
- 🌍 **App Flavors** — Separate development and production environments
- 🔥 **Firebase Crashlytics** — Real-time crash monitoring and reporting
- 💾 **Local Storage** — Persistent preferences using SharedPreferences

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter & Dart |
| State Management | Bloc / Cubit |
| Architecture | Clean Architecture |
| Networking | Retrofit + JSON Serializable |
| Dependency Injection | GetIt |
| Local Storage | SharedPreferences |
| Error Handling | Dartz (Either) |
| Testing | Mocktail, Flutter Test, Integration Test |
| CI/CD | GitHub Actions |
| Monitoring | Firebase Crashlytics |

---

## Architecture

This project follows **Clean Architecture** with strict layer separation:

```
lib/
├── core/
│   ├── di/                  # Dependency injection setup (GetIt)
│   ├── error/               # Failures & exceptions
│   ├── network/             # Retrofit client, interceptors
│   └── utils/               # Constants, extensions
├── features/
│   └── chat/
│       ├── data/
│       │   ├── data_source/  # Remote data source (Gemini API)
│       │   ├── model/        # JSON models (json_serializable)
│       │   └── repository/   # Repository implementation
│       ├── domain/
│       │   ├── entity/       # Business entities
│       │   ├── repository/   # Repository interface
│       │   └── use_case/     # Send message use case
│       └── presentation/
│           ├── manager/      # Cubit + States
│           ├── screens/      # Chat screen
│           └── widgets/      # Message bubble, input field
└── main.dart
```

---

## Error Handling

Uses **Dartz** `Either` type for functional error handling across all layers:

```dart
// Repository returns Either<Failure, Response>
Future<Either<Failure, ChatResponse>> sendMessage(String message);
```

Retry logic is implemented at the data source level to handle transient network failures automatically.

---

## Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/
```

Tests are written using **Mocktail** for clean, type-safe mocking without code generation.

---

## CI/CD

GitHub Actions workflows automate:
- Running unit tests on every push
- Running integration tests on pull requests
- Building the app for release

Workflows are located in `.github/workflows/`.

---

## App Flavors

The project supports multiple flavors for environment separation:

| Flavor | Purpose |
|---|---|
| `development` | Local development & testing |
| `production` | Release build for distribution |

---

## Getting Started

### Prerequisites
- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0
- Gemini API key from [Google AI Studio](https://aistudio.google.com)

### Installation

```bash
# Clone the repository
git clone https://github.com/mans30hussein/chat_bot.git

# Navigate to project
cd chat_bot

# Install dependencies
flutter pub get

# Generate code (Retrofit & JSON models)
flutter pub run build_runner build --delete-conflicting-outputs

# Run development flavor
flutter run --flavor development
```

### Environment Setup

Add your Gemini API key to the appropriate flavor config file before running.

---

## Author

**Mohamed Hussein** — Flutter Developer

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://linkedin.com/in/mohamed-hussein-514ab1223)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?logo=github)](https://github.com/mans30hussein)

---

## License

This project is for portfolio and educational purposes.
