


# Task_management
## Overview
The Advanced To-Do App is a responsive and feature-rich task management application built using Flutter. Designed with a clean UI and intuitive navigation, it helps users organize their tasks efficiently. The app leverages the GetX state management library for reactive programming and follows the MVC (Model-View-Controller) pattern for maintainability and scalability.
## Screenshots
<div style="display: flex;;">
    <img src="https://github.com/user-attachments/assets/cb54bf90-c99d-4a30-b727-f88cc3d448ed" alt="splash" style="margin-right: 10px;" width="300" height="600">
    <img src="https://github.com/user-attachments/assets/96fbb66c-89c3-4941-8886-315c20614060" alt="Bookmark 2" style="margin-right: 10px;" width="300" height="600">
 <img src="https://github.com/user-attachments/assets/3052f336-0f9a-4ecc-aeb9-7ce8a0590570" alt="Bookmark 2" style="margin-right: 10px;" width="300" height="600">
 <br> <br><br><br>
 <img src="https://github.com/user-attachments/assets/cab3bf2c-6d67-478e-8a07-49aae914463d" alt="Bookmark 2" style="margin-right: 10px;" width="300" height="600">
 <img src="https://github.com/user-attachments/assets/697d15f9-523d-4a33-b49f-881470abf09b" alt="Bookmark 2" style="margin-right: 10px;" width="300" height="600">
 <img src="https://github.com/user-attachments/assets/c731fa92-7246-412d-a90c-95ed28f297fb" alt="Bookmark 2" style="margin-right: 10px;" width="300" height="600">
 <br> <br><br><br>
 <img src="https://github.com/user-attachments/assets/b41ce435-81f6-4d57-a268-6fdf13278a8b" alt="Bookmark 2" style="margin-right: 10px;" width="300" height="600">
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
