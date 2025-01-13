import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_management/controller/getx_controller.dart';
import 'package:task_management/model/todo_model.dart';
import 'package:task_management/view/Widgets/theam_manager.dart';

/// WIDGET FOR THE BOTTOM SHEET CONTENT
class BottomSheetContent extends StatelessWidget {
  final bool isEdit;
  final TodoModel? todoObj;
  final TodoController todoController;

  const BottomSheetContent({
    required this.isEdit,
    this.todoObj,
    required this.todoController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("Create Task",
                  style: ThemeManager.headlineMedium
                      .copyWith(color: Colors.black)),
            ),
            const SizedBox(height: 25),
            Text("Title", style: ThemeManager.subHeadline),
            TextField(
              controller: todoController.titleController.value,
              decoration: ThemeManager.textFieldDecoration,
              cursorColor: ThemeManager.primaryColor,
            ),
            const SizedBox(height: 15),
            Text("Priority", style: ThemeManager.subHeadline),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DropdownButton<String>(
                value: todoController.selectedPriority.value,
                onChanged: (String? newValue) {
                  todoController.selectedPriority.value = newValue!;
                },
                items: todoController.priorityList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 15),
            Text("Date", style: ThemeManager.subHeadline),
            TextField(
              controller: todoController.dateController.value,
              onTap: () async {
                /// SELECTS A DATE USING DATE PICKER
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2025),
                  lastDate: DateTime(2027),
                );
                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat("d MMMM yyyy").format(pickedDate);
                  todoController.dateController.value.text = formattedDate;
                }
              },
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.calendar_month,
                  color: ThemeManager.borderColor,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  borderSide:
                      BorderSide(color: ThemeManager.primaryColor, width: 0.5),
                ),
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                /// SUBMITS THE TASK (CREATE OR EDIT BASED ON isEdit)
                if (isEdit) {
                  todoController.submitTask(isEdit: isEdit, todoObj: todoObj);
                } else {
                  todoController.submitTask(isEdit: isEdit);
                }
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 45,
                alignment: Alignment.center,
                decoration: ThemeManager.buttonDecoration,
                child: Text(
                  "Submit",
                  style: ThemeManager.buttonTextStyle,
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
