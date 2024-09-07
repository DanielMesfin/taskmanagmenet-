# taskmanagmenet

A Task Managmenet Flutter project.

## Getting Started

# Task Management App

This is a simple **Task Management** mobile application built with Flutter. The app allows users to create, manage, and delete tasks. It also includes features like local storage, dark mode, task status tracking (completed/incomplete), motivational quotes, and local notifications for due tasks.

## Features

- Add, edit, and delete tasks
- Persist tasks using **SharedPreferences**
- Mark tasks as completed or incomplete
- Show a random motivational quote on the home screen using an external API
- Remind users of tasks due soon using **local notifications**
- Switch between light and dark themes
- Bottom navigation for easy access to Home, Completed Tasks, and Settings

## Screens

1. **Home Screen**: Displays a list of tasks (task title, description, due date, status)
2. **Add Screen**: Form to add or edit tasks
3. **Completed Tasks Screen**: Displays tasks that are marked as completed
4. **Settings**: Option to switch between light and dark modes
5. **Edit Task Screen** for editing tasks

## Dependencies

The app uses the following Flutter packages:

- `provider`: For state management
- `shared_preferences`: To persist tasks locally
- `http`: To fetch motivational quotes from an external API
- `flutter_local_notifications`: To trigger local notifications for tasks that are due soon before the one hour mark

## Requirements

- [Flutter SDK](https://flutter.dev/docs/get-started/install) >= 2.0.0
- Android Studio or Visual Studio Code for running the app
- Android/iOS device or emulator

## Setup and Installation

Follow these steps to run the app locally on your machine:

### Step 1: Clone the repository

```bash
git clone https://github.com/DanielMesfin/taskmanagmenet-.git
cd taskmanagement
