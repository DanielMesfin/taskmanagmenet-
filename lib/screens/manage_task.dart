import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskmanagmenet/model/task_model.dart';
import 'package:provider/provider.dart';
import 'package:taskmanagmenet/provider/task_Provider.dart';
import 'package:taskmanagmenet/style/style.dart';
import 'package:taskmanagmenet/widget/gradient_button.dart';

class AddEditTaskScreen extends StatefulWidget {
  final Task? task;
  final int? index;

  const AddEditTaskScreen({super.key, this.task, this.index});

  @override
  // ignore: library_private_types_in_public_api
  _AddEditTaskScreenState createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  final DateTime _dueDate = DateTime.now();
  bool _isCompleted = false;
  DateTime? selectedDate;
  // Method to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Add or Edit Task',
                style: Styles.largeBoldText,
              ),
              TextFormField(
                initialValue: widget.task?.title ?? '',
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Enter a title' : null,
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                initialValue: widget.task?.description ?? '',
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) => _description = value!,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    selectedDate == null
                        ? 'No Due Date Chosen!'
                        : 'Due Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: const Text('Select Due Date'),
                  ),
                ],
              ),
              SwitchListTile(
                title: const Text('Completed'),
                value: _isCompleted,
                onChanged: (value) => setState(() {
                  _isCompleted = value;
                }),
              ),
              GradientButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (widget.task == null) {
                      taskProvider.addTask(Task(
                        title: _title,
                        description: _description,
                        dueDate: _dueDate,
                        isCompleted: _isCompleted,
                      ));
                    } else {
                      taskProvider.editTask(
                          widget.index!,
                          Task(
                            title: _title,
                            description: _description,
                            dueDate: _dueDate,
                            isCompleted: _isCompleted,
                          ));
                    }
                  }
                },
                text: "Add Task",
              )
            ],
          ),
        ),
      ),
    );
  }
}
