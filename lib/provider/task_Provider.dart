import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:taskmanagmenet/model/task_model.dart';
import 'package:taskmanagmenet/provider/notification_service.dart';
// import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  bool _isDarkMode = false;

  TaskProvider() {
    tz.initializeTimeZones();
  }
  List<Task> get tasks => _tasks;

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await saveTasks();
    notifyListeners();
  }

  Future<void> editTask(int index, Task task) async {
    _tasks[index] = task;
    await saveTasks();
    notifyListeners();
  }

  Future<void> removeTask(int index) async {
    _tasks.removeAt(index);
    await saveTasks();
    notifyListeners();
  }

  Future<void> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tasksData = prefs.getString('tasks');
    if (tasksData != null) {
      List<dynamic> decodedData = jsonDecode(tasksData);
      _tasks = decodedData.map((task) => Task.fromMap(task)).toList();
    }
    notifyListeners();
  }

  Future<void> saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> tasksToSave =
        _tasks.map((task) => task.toMap()).toList();
    prefs.setString('tasks', jsonEncode(tasksToSave));
  }

  // Getter for fetching only completed tasks
  List<Task> get completedTasks {
    return _tasks.where((task) => task.isCompleted).toList();
  }

  bool get isDarkMode => _isDarkMode;

  void toggleTheme(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
  }

  Future<void> scheduleTaskNotifications() async {
    DateTime now = DateTime.now();

    for (var task in _tasks) {
      // ignore: unnecessary_null_comparison
      if (task.dueDate != null) {
        DateTime dueDate = task.dueDate;
        if (dueDate.isAfter(now) &&
            dueDate.isBefore(now.add(const Duration(hours: 1)))) {
          final DateTime reminderTime =
              dueDate.subtract(const Duration(hours: 1));

          await NotificationService().showNotification(
            1,
            'Task Reminder',
            'Your task "${task.title}" is due soon at ${dueDate.toLocal().toString()}',
            reminderTime,
          );
        }
      }
    }
  }
}
