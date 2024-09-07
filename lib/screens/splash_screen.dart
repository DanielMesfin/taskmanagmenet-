import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanagmenet/provider/task_Provider.dart';
import 'package:taskmanagmenet/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    await taskProvider.loadTasks();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Add animation at here
    return const Scaffold(
      body: Center(
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
