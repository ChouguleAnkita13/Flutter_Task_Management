import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/controller/getx_controller.dart';
import 'package:task_management/model/todo_model.dart';
import 'package:task_management/view/Widgets/task_tile.dart';

/// WIDGET FOR THE TASK LIST
class TaskList extends StatelessWidget {
  final TodoController todoController;
  final Function(TodoModel) onEdit;

  const TaskList({
    required this.todoController,
    required this.onEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: todoController.taskList.length,
        itemBuilder: (context, index) {
          final task = todoController.taskList[index];
          return TaskTile(
            task: task,
            onEdit: () => onEdit(task),
            onDelete: () => todoController.deleteTodoTask(task),
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
