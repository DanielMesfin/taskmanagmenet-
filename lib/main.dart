import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:taskmanagmenet/provider/task_Provider.dart';
import 'package:taskmanagmenet/screens/home_screen.dart';
import 'package:taskmanagmenet/screens/splash_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return MaterialApp(
      title: 'My Task',
      debugShowCheckedModeBanner: false,
       theme: ThemeData.light(), 
      darkTheme: ThemeData.dark(), 
      themeMode: taskProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home:  SplashScreen(),
    );
  }
}
