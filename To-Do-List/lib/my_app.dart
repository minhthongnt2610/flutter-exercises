import 'package:flutter/material.dart';
import 'package:lesson_5/screens/home/create_new_task/create_new_task_screen.dart';
import 'package:lesson_5/screens/home/create_new_task/model/new_tasks_screen_argument.dart';
import 'package:lesson_5/screens/home_screen.dart';
import 'package:lesson_5/screens/main/main_screen.dart';
import 'package:lesson_5/screens/screen_all_task/screen_all_task.dart';
import 'package:lesson_5/screens/screen_all_task/widgets/all_tasks_screen_argument.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "to do list",
      initialRoute: MainScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case MainScreen.routeName:
            return MaterialPageRoute(builder: (context) => const MainScreen());
          case HomeScreen.routeName:
            return MaterialPageRoute(builder: (context) => const HomeScreen());
          case CreateNewTaskScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => CreateNewTaskScreen(
                arguments: settings.arguments as NewTasksScreenArgument,
              ),
            );
          case ScreenAllTask.routeName:
            return MaterialPageRoute(
              builder: (context) => ScreenAllTask(
                arguments: settings.arguments as AllTasksScreenArgument,
              ),
            );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
