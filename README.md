# 📱 Posts App (Flutter)

This Flutter app displays a list of posts fetched from an **API**. When there is no internet connection, the app retrieves **cached posts** from the **Isar database**, ensuring offline functionality. The project follows **Clean Architecture** and **SOLID principles** to maintain a modular and scalable codebase.

---

## ✨ Features
- Fetches posts from an API.  
- **Offline access** using Isar database caching.  
- **Network-aware**: Switches between API and cached data based on connectivity.  
- Implements **BLoC state management** for reactive UI updates.  
- Uses **Clean Architecture** for better maintainability and testability.

---

## 📂 Project Structure
- **Presentation Layer**: Handles the UI and state management using `flutter_bloc`.  
- **Domain Layer**: Contains business logic, including use cases and entities.  
- **Data Layer**: Manages API requests, database access, and data models.

---

## 📦 Dependencies Overview

| Dependency                         | Description |
|------------------------------------|-------------|
| **dartz**                          | Provides functional programming tools like `Either` and `Option` for error handling and data flow. |
| **ffi**                            | Supports interoperability with native code, required by **Isar** database. |
| **intl**                           | Handles internationalization, such as formatting dates and numbers. |
| **bloc**                           | Core library for implementing the BLoC pattern (Business Logic Component). |
| **flutter_bloc**                   | Integrates `bloc` with Flutter for state management. |
| **dio**                            | HTTP client used to make API calls. |
| **conditional_builder_null_safety**| Enables conditional rendering of widgets based on state changes. |
| **internet_connection_checker**    | Monitors network status to determine whether to fetch online or cached data. |
| **get_it**                         | Service locator for dependency injection, promoting modularity. |
| **timeago**                        | Displays time differences (e.g., "2 hours ago") in a human-readable format. |
| **isar**                           | NoSQL database used for caching posts locally. |
| **isar_flutter_libs**              | Provides Flutter bindings for the **Isar** database. |

---

## 🛠️ Development Dependencies

| Dependency         | Description |
|--------------------|-------------|
| **flutter_lints**  | Ensures code follows Dart and Flutter best practices. |
| **isar_generator** | Code generator for Isar models. |
| **build_runner**   | Runs code generation tasks (e.g., for Isar models). |
| **path_provider**  | Provides access to device directories for saving data and files. |

---

## 🛡️ How It Works
- **API Data Fetching:** The app uses Dio to fetch posts from a remote API.
- **Caching:** When online, posts are cached using the Isar database for offline access.
- **State Management:** The BLoC pattern handles communication between the UI and business logic.
- **Offline Mode:** If no internet is detected, the app loads cached posts from the local database.
- **Human-readable Dates:** Timeago displays timestamps in a user-friendly way (e.g., "5 minutes ago").

## 🤝 Contributing
We welcome contributions! Feel free to submit issues or pull requests to help improve the project.

