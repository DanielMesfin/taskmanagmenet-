import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taskmanagmenet/model/task_model.dart';
import 'package:taskmanagmenet/provider/task_Provider.dart';
import 'package:taskmanagmenet/screens/manage_task.dart';
import 'package:taskmanagmenet/style/style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String randomQuote = "Loading motivational quote...";

  @override
  void initState() {
    super.initState();
    _fetchQuote();
  }

  Future<void> _fetchQuote() async {
    final response = await http.get(Uri.parse('https://type.fit/api/quotes'));
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      List quotes = jsonDecode(response.body);
      setState(() {
        randomQuote = quotes[Random().nextInt(quotes.length)]['text'];
      });
    } else {
      setState(() {
        randomQuote = "Failed to fetch quote!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            child: Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  randomQuote,
                  style: const TextStyle(
                      fontSize: 18, fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<TaskProvider>(
              builder: (context, taskProvider, child) {
                // taskProvider.loadTasks();
                return ListView.builder(
                  itemCount: taskProvider.tasks.length,
                  itemBuilder: (context, index) {
                    Task task = taskProvider.tasks[index];
                    return Dismissible(
                      key: Key(task.title),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        // Remove task from list and SharedPreferences
                        taskProvider.removeTask(index);

                        // Show a snackbar after removal
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${task.title} dismissed')),
                        );
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      child: Card(
                        elevation: 8,
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task.title,
                                style: Styles.titleStyle,
                              ),
                              Text(
                                task.description,
                                style: Styles.taskDescriptionStyle,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    task.isCompleted
                                        ? "Completed"
                                        : "Not Completed",
                                    style: task.isCompleted
                                        ? Styles.completedTaskStyle
                                        : Styles.incompleteTaskStyle,
                                  ),
                                  Text(
                                    DateFormat('yyyy-MM-dd').format(
                                      task.dueDate,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          trailing: Checkbox(
                            value: task.isCompleted,
                            onChanged: (bool? value) {
                              setState(() {
                                task.isCompleted = value ?? false;
                                taskProvider.editTask(index, task);
                              });
                            },
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddEditTaskScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
