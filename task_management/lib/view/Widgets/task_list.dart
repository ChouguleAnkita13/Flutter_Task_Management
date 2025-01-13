import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/controller/getx_controller.dart';
import 'package:task_management/model/todo_model.dart';
import 'package:task_management/view/Widgets/task_tile.dart';

/// WIDGET FOR DISPLAYING THE TASK LIST
class TaskList extends StatelessWidget {
  /// INSTANCE OF THE TODO CONTROLLER TO MANAGE STATE
  final TodoController todoController;

  /// CALLBACK FUNCTION TO HANDLE EDITING OF A TASK
  final Function(TodoModel) onEdit;

  /// CONSTRUCTOR TO INITIALIZE THE TASK LIST WIDGET
  const TaskList({
    required this.todoController,
    required this.onEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      /// BUILDS A DYNAMIC LIST VIEW BASED ON THE TASK LIST
      () => ListView.builder(
        /// TOTAL NUMBER OF TASKS IN THE LIST
        itemCount: todoController.taskList.length,

        /// BUILDER FUNCTION TO GENERATE TASK ITEMS
        itemBuilder: (context, index) {
          final task = todoController.taskList[index];

          /// DISPLAYS EACH TASK AS A TILE
          return TaskTile(
            task: task,

            /// CALLBACK FOR EDITING THE TASK
            onEdit: () => onEdit(task),

            /// CALLBACK FOR DELETING THE TASK
            onDelete: () => todoController.deleteTodoTask(task),

            /// TOGGLES THE TASK COMPLETION STATUS
            onToggle: () {
              task.isDone = task.isDone == 0 ? 1 : 0;
              todoController.updateTodoTask(task);
            },
          );
        },
      ),
    );
  }
}
