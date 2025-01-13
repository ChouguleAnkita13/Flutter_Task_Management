import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/controller/db_controller.dart';
import 'package:task_management/model/todo_model.dart';

class TodoController extends GetxController {
  /// OBSERVABLE LIST OF TASKS
  var taskList = <TodoModel>[].obs;

  /// SELECTED PRIORITY VALUE (DEFAULT: MEDIUM)
  var selectedPriority = "Medium".obs;

  /// LIST OF PRIORITIES
  final priorityList = ["High", "Low", "Medium"];

  /// TITLE AND DATE CONTROLLERS
  var titleController = TextEditingController().obs;
  var dateController = TextEditingController().obs;

  /// OBSERVABLE GREETING MESSAGE
  var greeting = "Good Morning".obs;

  @override
  void onInit() {
    super.onInit();

    /// INITIALIZE DATABASE AND FETCH TASK LIST ON STARTUP
    Future.delayed(const Duration(seconds: 0), () async {
      await openDb();
      await getAllTaskList();
    });
    updateGreeting();
  }

  /// UPDATES THE GREETING BASED ON THE CURRENT TIME
  void updateGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      greeting.value = "Good Morning";
    } else if (hour < 17) {
      greeting.value = "Good Afternoon";
    } else {
      greeting.value = "Good Evening";
    }
  }

  /// FETCH ALL TASKS FROM THE DATABASE AND UPDATE THE TASK LIST
  Future<void> getAllTaskList() async {
    List<TodoModel> todoList = await getAllTask();
    taskList.assignAll(todoList);
  }

  /// ADD A NEW TASK TO THE TASK LIST AND DATABASE
  void addTask(TodoModel task) {
    taskList.add(task);
    insertTask(task); // INSERT TO DATABASE
  }

  /// UPDATE AN EXISTING TASK IN THE TASK LIST AND DATABASE
  void updateTodoTask(TodoModel task) {
    taskList[taskList.indexWhere((t) => t.taskId == task.taskId)] = task;
    updateTask(task); // UPDATE IN DATABASE
  }

  /// DELETE A TASK FROM THE TASK LIST AND DATABASE
  void deleteTodoTask(TodoModel task) {
    taskList.remove(task);
    deleteTask(task); // DELETE FROM DATABASE
  }

  /// HANDLE TASK SUBMISSION (ADD OR UPDATE)
  void submitTask({required bool isEdit, TodoModel? todoObj}) {
    if (titleController.value.text.trim().isNotEmpty &&
        dateController.value.text.trim().isNotEmpty) {
      if (isEdit) {
        /// UPDATE EXISTING TASK
        todoObj!.title = titleController.value.text;
        todoObj.priority = selectedPriority.value;
        todoObj.date = dateController.value.text;
        updateTodoTask(todoObj);
      } else {
        /// ADD A NEW TASK
        addTask(TodoModel(
          title: titleController.value.text,
          priority: selectedPriority.value,
          date: dateController.value.text,
        ));
        getAllTaskList();
      }

      /// CLEAR INPUT CONTROLLERS AND CLOSE THE BOTTOM SHEET
      clearController();
      Get.back();
    }
  }

  /// CLEAR THE TEXT CONTROLLERS AND RESET PRIORITY
  void clearController() {
    titleController.value.clear();
    dateController.value.clear();
    selectedPriority.value = "Medium";
  }
}
