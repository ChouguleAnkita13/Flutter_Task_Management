import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_management/controller/getx_controller.dart';
import 'package:task_management/model/todo_model.dart';
import 'package:task_management/view/Widgets/theam_manager.dart';

/// WIDGET FOR DISPLAYING CONTENT INSIDE THE BOTTOM SHEET
class BottomSheetContent extends StatelessWidget {
  /// FLAG TO CHECK IF THE BOTTOM SHEET IS IN EDIT MODE
  final bool isEdit;

  /// TO DO OBJECT TO BE EDITED (NULL IF CREATING A NEW TASK)
  final TodoModel? todoObj;

  /// CONTROLLER FOR MANAGING TASK DATA AND STATE
  final TodoController todoController;

  /// CONSTRUCTOR TO INITIALIZE BOTTOM SHEET CONTENT
  const BottomSheetContent({
    required this.isEdit,
    required this.todoObj,
    required this.todoController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      /// WRAPS CONTENT TO HANDLE BOTTOM INSETS FOR KEYBOARD
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
            /// HEADER TITLE
            Center(
              child: Text(
                "Create Task",
                style:
                    ThemeManager.headlineMedium.copyWith(color: Colors.black),
              ),
            ),
            const SizedBox(height: 25),

            /// TITLE INPUT FIELD
            Text("Title", style: ThemeManager.subHeadline),
            TextField(
              controller: todoController.titleController.value,
              decoration: ThemeManager.textFieldDecoration,
              cursorColor: ThemeManager.primaryColor,
            ),
            const SizedBox(height: 15),

            /// PRIORITY DROPDOWN SELECTION
            Text("Priority", style: ThemeManager.subHeadline),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Obx(
                () => DropdownButton<String>(
                  value: todoController.selectedPriority.value,
                  onChanged: (String? newValue) {
                    todoController.selectedPriority.value = newValue!;
                  },
                  items: ["High", "Low", "Medium"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 15),

            /// DATE INPUT FIELD WITH DATE PICKER
            Text("Date", style: ThemeManager.subHeadline),
            TextField(
              controller: todoController.dateController.value,
              onTap: () async {
                /// OPENS THE DATE PICKER TO SELECT A DATE
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2025),
                  lastDate: DateTime(2027),
                );
                if (pickedDate != null) {
                  /// FORMATS AND SETS THE SELECTED DATE
                  String formattedDate =
                      DateFormat("d MMMM yyyy").format(pickedDate);
                  todoController.dateController.value.text = formattedDate;
                }
              },
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.calendar_month,
                  color: ThemeManager.backgroundColor,
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

            /// SUBMIT BUTTON
            GestureDetector(
              onTap: () {
                /// CALLS THE SUBMIT FUNCTION BASED ON MODE (CREATE OR EDIT)
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
