# College Management App

This College Management App is developed using **Flutter** and **GetX** state management, designed to streamline the management of daily activities in a college environment. The app is divided into three main sections: **Admin**, **Faculty (Teacher)**, and **Student**. Each section has its unique features that help manage and track attendance, leave requests, subject-specific attendance, fees, and more.

## Features

### Admin Panel
- **Approve Leave Requests:** Admins can view and approve leave requests made by faculty members.
- **Manage Faculty Salaries:** Admin can access and manage faculty salaries, ensuring smooth payroll management.
- **Attendance Reports:** Admin can access overall attendance reports for all faculty and students.
- **Approve Student Requests:** Admin can manage various student-related requests, such as fee payments or leave approvals.

### Faculty (Teacher) Panel
- **Mark Attendance:** Faculty can mark the attendance for students for each subject.
- **Apply Leave:** Teachers can apply for leave with a reason, and admins can approve or reject these requests.
- **View Attendance:** Faculty can view their own attendance records and the attendance records of students in their classes.

### Student Panel
- **View Attendance:** Students can view their attendance records, including the attendance for each subject.
- **View Subject-wise Attendance:** Students can get a subject-wise breakdown of their attendance.
- **View Fees:** Students can check their fee status, including outstanding dues.

## Technologies Used
- **Flutter**: The mobile framework used to build this app.
- **GetX**: A powerful and lightweight state management library for Flutter.
- **SQLite**: Used for local data storage to manage attendance, leave applications, and other records.
- **Floor Database**: A library for SQLite in Flutter, enabling object-oriented database operations.

## Getting Started

### Prerequisites
1. **Flutter**: Install Flutter SDK from [here](https://flutter.dev/docs/get-started/install).
2. **Dart**: Dart is bundled with Flutter, but ensure you have it installed and properly set up.
3. **Android Studio / VSCode**: Use any code editor such as Android Studio or VSCode for Flutter development.
