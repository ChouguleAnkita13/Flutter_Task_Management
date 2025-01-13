import 'package:flutter/material.dart';
import 'package:task_management/controller/getx_controller.dart';
import 'package:task_management/view/Widgets/theam_manager.dart';

/// WIDGET FOR GREETING HEADER (MESSAGE, NAME)
class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key, required this.todoController});
  final TodoController todoController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 20),
          child: Text(todoController.greeting.value,
              style: ThemeManager.headlineMedium),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 40),
          child: Text("Ankita", style: ThemeManager.headlineLarge),
        ),
      ],
    );
  }
}
