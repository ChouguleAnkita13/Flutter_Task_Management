import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/controller/getx_controller.dart';
import 'package:task_management/model/todo_model.dart';
import 'package:task_management/view/Widgets/bottomsheet_content.dart';
import 'package:task_management/view/Widgets/greetings_header.dart';
import 'package:task_management/view/Widgets/task_list.dart';
import 'package:task_management/view/Widgets/theam_manager.dart';

/// MAIN SCREEN FOR ADVANCED TO DO LIST
class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  /// INSTANCE OF TO DO CONTROLLER FOR STATE MANAGEMENT
  final TodoController todoController = Get.put(TodoController());

  /// SHOWS THE BOTTOM SHEET FOR CREATING OR EDITING A TASK
  /// [isEdit] - FLAG TO IDENTIFY IF THE TASK IS BEING EDITED
  /// [todoObj] - EXISTING TASK OBJECT (OPTIONAL)
  void bottomSheet(bool isEdit, [TodoModel? todoObj]) {
    Get.bottomSheet(
      BottomSheetContent(
        isEdit: isEdit,
        todoObj: todoObj,
        todoController: todoController,
      ),
      backgroundColor: ThemeManager.cardColor,
      isDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// DISPLAYS GREETING HEADER WITH NAME AND MESSAGE
          GreetingHeader(
            todoController: todoController,
          ),
          Expanded(
            child: Container(
              /// BACKGROUND DECORATION FOR THE MAIN CONTAINER
              decoration: ThemeManager.containerDecoration,
              child: Column(
                children: [
                  /// HEADER TEXT FOR TO DO LIST SECTION
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "CREATE TO DO LIST",
                      style: ThemeManager.listItemTitle,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        color: ThemeManager.cardColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),

                      /// DISPLAYS THE LIST OF TASKS
                      child: TaskList(
                        todoController: todoController,
                        onEdit: (todo) => bottomSheet(true, todo),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// OPENS THE BOTTOM SHEET TO CREATE A NEW TASK
          bottomSheet(false);
        },
        backgroundColor: ThemeManager.backgroundColor,
        child: Icon(Icons.add, color: ThemeManager.cardColor),
      ),
    );
  }
}
