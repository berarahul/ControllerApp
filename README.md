# Controller App for College Management

## Overview
The Controller App is designed exclusively for the College Controller to manage various administrative tasks, including teacher management, department management, HOD assignments, and holiday schedules. This app provides a streamlined interface with card view tabs for easy navigation and control. The app is developed using the Flutter framework and is available on Android.

## Features

### Login
- **Controller Login:**
    - The Controller logs in using their credentials.
    - Only the Controller has access to this app.

### Main Tabs
After logging in, the Controller can see four card view tabs:

1. **Teacher Controller**
2. **Department**
3. **Change HOD**
4. **Holiday**

### Teacher Controller Tab
When the Controller clicks the Teacher Controller card view, they see the following features:
- **Pending Teacher Request:** View and manage pending teacher requests.
- **Remove Teacher From Department:** Remove a teacher from a department.
- **Add Teacher To Another Department:** Assign a teacher to a different department.

### Department Tab
When the Controller clicks the Department card view, they see the following features:
- **Create Department:** Create new departments.
- **Delete Department:** Remove existing departments.

### Change HOD Tab
When the Controller clicks the Change HOD card view, they see the following feature:
- **Change HOD for Department:** Assign a new HOD for a specific department.

### Holiday Tab
When the Controller clicks the Holiday card view, they see the following features:
- **Create Holiday:** Create new holiday schedules.
- **Update Holiday:** Update existing holiday information.
- **Delete Holiday:** Remove holiday entries.

### Logout
- **Logout Button:** Allows the Controller to log out of the app securely.

## User Interface
### Login Page
- Fields: Username, Password
- Login button to access the app.

### Main Interface
- **Card View Tabs:**
    - **Teacher Controller:** Manage teacher-related actions.
    - **Department:** Manage department creation and deletion.
    - **Change HOD:** Manage HOD assignments.
    - **Holiday:** Manage holiday schedules.

- **Logout Button:** Accessible from the main interface to log out.

## Technology Stack
- **Framework:** Flutter
- **Platform:** Currently available for Android

## Functionality
1. **Login:**
    - The Controller enters credentials and logs in.
    - Only the Controller is authenticated to access the app.

2. **Teacher Management:**
    - View and manage pending teacher requests.
    - Remove teachers from departments.
    - Add teachers to different departments.

3. **Department Management:**
    - Create new departments.
    - Delete existing departments.

4. **HOD Management:**
    - Assign new HODs for specific departments.

5. **Holiday Management:**
    - Create, update, and delete holiday schedules.

6. **Logout:**
    - Securely log out of the app using the logout button.

## Conclusion
The Controller App for College Management provides a comprehensive and efficient solution for managing teacher requests, department creation and deletion, HOD assignments, and holiday schedules. With exclusive access, the Controller can oversee and control these administrative tasks effectively. Built with Flutter, the app is currently available for Android users.
