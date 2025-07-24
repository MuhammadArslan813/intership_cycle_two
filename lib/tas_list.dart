// screens/task_list_screen.dart
import 'package:flutter/material.dart';
import 'package:intership_cycle_two/task_provider.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatelessWidget {
  TaskListScreen({super.key});

  final TextEditingController taskCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Task Manager")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = taskProvider.tasks[index];
                return ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (_) => taskProvider.toggleTask(index),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => taskProvider.deleteTask(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskCtrl,
                    decoration: const InputDecoration(hintText: "Add new task"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (taskCtrl.text.trim().isNotEmpty) {
                      taskProvider.addTask(taskCtrl.text);
                      taskCtrl.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
