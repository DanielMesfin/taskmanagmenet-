import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanagmenet/model/task_model.dart';
import 'package:taskmanagmenet/provider/task_Provider.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Completed Tasks')),
      body: ListView.builder(
        itemCount: taskProvider.completedTasks.length,
        itemBuilder: (context, index) {
          Task task = taskProvider.completedTasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Icon(
              task.isCompleted ? Icons.check : Icons.close,
              color: task.isCompleted ? Colors.green : Colors.red,
            ),
          );
        },
      ),
    );
  }
}
