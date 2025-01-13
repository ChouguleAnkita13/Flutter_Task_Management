# Task_management
## Overview
The Advanced To-Do App is a responsive and feature-rich task management application built using Flutter. Designed with a clean UI and intuitive navigation, it helps users organize their tasks efficiently. The app leverages the GetX state management library for reactive programming and follows the MVC (Model-View-Controller) pattern for maintainability and scalability.
## Screenshots
<div style="display: flex;;">
    <img src="https://github.com/user-attachments/assets/dde51082-4eaa-47c1-b68a-349f2bbc9e9d" alt="splash" style="margin-right: 10px;" width="300" height="600">
    <img src="https://github.com/user-attachments/assets/41188b05-9716-47d3-b862-7d622d3ff8e3" alt="Bookmark 2" style="margin-right: 10px;" width="300" height="600">
 <img src="https://github.com/user-attachments/assets/52651a7e-c5e7-44f4-89c8-404ac395ffed" alt="Bookmark 2" style="margin-right: 10px;" width="300" height="600">
 <br> <br><br><br>
 <img src="https://github.com/user-attachments/assets/4b718ce5-ed82-4b37-b7fb-8a0113582bae" alt="Bookmark 2" style="margin-right: 10px;" width="300" height="600">
 <img src="https://github.com/user-attachments/assets/5a79a5de-2959-4c61-9bd4-1e303fee7817" alt="Bookmark 2" style="margin-right: 10px;" width="300" height="600">
 <img src="https://github.com/user-attachments/assets/aefe3210-d2c5-4f09-bfdb-e58137d725e8" alt="Bookmark 2" style="margin-right: 10px;" width="300" height="600">
</div>

## Key Features

#### Task Management:
Create, edit, and delete tasks.
Mark tasks as completed or pending.
Assign priority levels to tasks (High, Medium, Low).
Set deadlines for tasks using a date picker.

#### UI/UX:
Clean and modern user interface.
Fully responsive design for mobile and tablet devices.
Dynamic greeting header based on the current time (e.g., Good Morning, Good Afternoon, Good Evening).

#### State Management:
Reactive updates with GetX, ensuring smooth and real-time interactions.

#### Data Persistence:
Local storage for tasks using SQLite via sqflite package.

#### Theming:
Custom themes for consistent styling across the app.
Differentiated task appearance based on completion status.

## Project Structure
The app follows a clean folder structure for scalability and maintainability:
```bash
lib/
├── controller/        # Business logic and state management (GetX controllers)
│   ├── db_controller.dart    # Handles database operations
│   └── getx_controller.dart  # Manages app states and interactions
├── model/             # Data models for the app
│   └── todo_model.dart
├── view/              # UI components and screens
│   ├── Widgets/       # Reusable widgets (e.g., task list, greeting header)
│   ├── bottomsheet_content.dart
│   ├── greetings_header.dart
│   ├── task_list.dart
│   └── theam_manager.dart  # Custom theme definitions
├── main.dart          # App entry point

```

## Flutter Version
```bash
flutter --version
  Flutter 3.22.3
  Dart 3.4.4
```
## Dependencies
```bash
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.3+1
  flutter_lints: ^3.0.0
  flutter_slidable: ^3.1.1
  intl: ^0.19.0
  path: ^1.9.0
  sqflite_common_ffi_web: ^0.4.4
  google_fonts: ^6.2.1
  get: ^4.6.6
```

## License
This project is licensed under the MIT License. See the [LICENSE](https://choosealicense.com/licenses/mit/) file for more details.
