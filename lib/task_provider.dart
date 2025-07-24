// providers/task_provider.dart
import 'package:flutter/material.dart';
import 'package:intership_cycle_two/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
