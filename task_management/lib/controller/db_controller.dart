import 'dart:developer';

// import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_management/model/todo_model.dart';

dynamic database;
Future<void> openDb() async {
  // databaseFactory = databaseFactoryFfiWeb;
  database = await openDatabase(join(await getDatabasesPath(), "todo5.db"),
      version: 1, onCreate: (db, version) {
    db.execute(
        '''create table task(taskId Integer Primary Key ,title Text,priority Text,date Text,isDone Integer)''');
    log("Table Created");
  });
  log(database.toString());

  log("${await getAllTask()}");
}

///INSERT TASKS
void insertTask(TodoModel todoObj) async {
  final db = await database;

  await db.insert("task", todoObj.todoMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
  log("Task inserted");
}

///FETCH TASKS
Future<List<TodoModel>> getAllTask() async {
  final db = await database;

  List<Map<String, dynamic>> getTasksList = await db.query("task");
  return List.generate(getTasksList.length, (idx) {
    return TodoModel(
        taskId: getTasksList[idx]['taskId'],
        title: getTasksList[idx]["title"],
        priority: getTasksList[idx]["priority"],
        date: getTasksList[idx]["date"],
        isDone: getTasksList[idx]["isDone"]);
  });
}

///DELETE TASK
void deleteTask(TodoModel todoObj) async {
  final db = await database;
  db.delete('task', where: 'taskId=?', whereArgs: [todoObj.taskId]);
  log("Task Deleted");
}

///DELETE TASK
Future<void> updateTask(TodoModel todoObj) async {
  final db = await database;
  await db.update('task', todoObj.todoMap(),
      where: 'taskId=?', whereArgs: [todoObj.taskId]);
  log("Task Updated");
}
