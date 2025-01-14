import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:task_management/view/task_screen.dart';

void main() async {
  ///ENTRY POINT
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Task Management',
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
    );
  }
}
