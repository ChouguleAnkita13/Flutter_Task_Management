import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_management/model/todo_model.dart';
import 'package:task_management/view/Widgets/theam_manager.dart';

/// WIDGET FOR DISPLAYING EACH TASK AS A TILE
class TaskTile extends StatelessWidget {
  /// TASK DATA MODEL TO DISPLAY INFORMATION ABOUT THE TASK
  final TodoModel task;

  /// CALLBACK FUNCTION TO HANDLE TASK EDIT
  final VoidCallback onEdit;

  /// CALLBACK FUNCTION TO HANDLE TASK DELETION
  final VoidCallback onDelete;

  /// CALLBACK FUNCTION TO TOGGLE TASK COMPLETION STATUS
  final VoidCallback onToggle;

  /// CONSTRUCTOR TO INITIALIZE THE TASK TILE
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
      /// SLIDABLE ACTION PANE FOR EDITING AND DELETING TASKS
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          /// COLUMN CONTAINING EDIT AND DELETE ACTIONS
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /// EDIT BUTTON
              GestureDetector(
                onTap: onEdit,
                child: CircleAvatar(
                  backgroundColor: ThemeManager.primaryColor,
                  child: Icon(Icons.edit, color: ThemeManager.cardColor),
                ),
              ),

              /// DELETE BUTTON
              GestureDetector(
                onTap: onDelete,
                child: CircleAvatar(
                  backgroundColor: ThemeManager.primaryColor,
                  child: Icon(Icons.delete, color: ThemeManager.cardColor),
                ),
              ),
            ],
          ),
        ],
      ),

      /// MAIN CONTENT OF THE TASK TILE
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 10),
        decoration: ThemeManager.cardDecoration(task.isDone == 1),
        child: Row(
          children: [
            /// ICON OR IMAGE FOR THE TASK
            Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ThemeManager.borderColor,
              ),
              child: Image.asset("assets/todo.png"),
            ),
            const SizedBox(width: 12),

            /// TASK DETAILS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TASK TITLE
                  Text(task.title, style: ThemeManager.listItemTitle),
                  const SizedBox(height: 8),

                  /// TASK PRIORITY
                  Text(task.priority, style: ThemeManager.listItemSubtitle),
                  const SizedBox(height: 8),

                  /// TASK DATE
                  Text(task.date, style: ThemeManager.listItemDate),
                ],
              ),
            ),

            /// CHECKBOX TO TOGGLE TASK COMPLETION
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
