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
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("📝 My Tasks"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          /// Task List
          Expanded(
            child: taskProvider.tasks.isEmpty
                ? const Center(
              child: Text(
                "No tasks yet. Add one!",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = taskProvider.tasks[index];
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      )
                    ],
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      activeColor: Colors.teal,
                      value: task.isDone,
                      onChanged: (_) => taskProvider.toggleTask(index),
                    ),
                    title: Text(
                      task.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        decoration: task.isDone
                            ? TextDecoration.lineThrough
                            : null,
                        color: task.isDone ? Colors.grey : Colors.black,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () => taskProvider.deleteTask(index),
                    ),
                  ),
                );
              },
            ),
          ),

          /// Task Input Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskCtrl,
                    decoration: InputDecoration(
                      hintText: "Enter new task",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Material(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    onTap: () {
                      if (taskCtrl.text.trim().isNotEmpty) {
                        taskProvider.addTask(taskCtrl.text.trim());
                        taskCtrl.clear();
                      }
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
