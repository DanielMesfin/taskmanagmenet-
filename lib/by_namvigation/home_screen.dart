import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:taskmanagmenet/model/task_model.dart';
import 'package:taskmanagmenet/pallete.dart';
import 'package:taskmanagmenet/provider/task_Provider.dart';
import 'package:taskmanagmenet/screens/drawer_screen.dart';
import 'package:taskmanagmenet/screens/main_screen.dart';
import 'dart:convert';
import 'package:taskmanagmenet/screens/manage_task.dart';
import 'package:taskmanagmenet/screens/settings_screen.dart';
import 'package:taskmanagmenet/style/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String randomQuote = "Loading motivational quote...";
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    AddEditTaskScreen(),
    SettingsScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Task",
          style: Styles.titleStyle,
        ),
        actions: <Widget>[
          Image.asset('assets/images/signin_balls.png'),
        ]
      ),
      drawer: const DrawerScreen(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task),
            label: 'Add Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
