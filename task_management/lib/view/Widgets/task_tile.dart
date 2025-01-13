import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_management/model/todo_model.dart';
import 'package:task_management/view/Widgets/theam_manager.dart';

/// WIDGET FOR EACH TASK TILE
class TaskTile extends StatelessWidget {
  final TodoModel task;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggle;

  const TaskTile({
    required this.task,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: onEdit,
                child: CircleAvatar(
                  backgroundColor: ThemeManager.primaryColor,
                  child: const Icon(Icons.edit, color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: onDelete,
                child: CircleAvatar(
                  backgroundColor: ThemeManager.primaryColor,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 10),
        decoration: ThemeManager.cardDecoration(task.isDone == 1),
        child: Row(
          children: [
            Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeManager.cardColor,
                ),
                child: Image.asset("assets/todo.png")),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title, style: ThemeManager.listItemTitle),
                  const SizedBox(height: 8),
                  Text(task.priority, style: ThemeManager.listItemSubtitle),
                  const SizedBox(height: 8),
                  Text(task.date, style: ThemeManager.listItemDate),
                ],
              ),
            ),
            Checkbox(
              value: task.isDone == 1,
              activeColor: ThemeManager.checkboxActiveColor,
              shape: const CircleBorder(),
              onChanged: (value) => onToggle(),
            ),
          ],
        ),
      ),
    );
  }
}
