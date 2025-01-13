class TodoModel {
  int? taskId;
  String title;
  String priority;
  String date;
  int isDone;

  TodoModel(
      {this.taskId,
      required this.title,
      required this.priority,
      required this.date,
      this.isDone = 0});

  ///TO CONVERT THE TODOMODEL OBJECT INTO MAP
  Map<String, dynamic> todoMap() {
    return {
      'taskId': taskId,
      'title': title,
      'priority': priority,
      'date': date,
      'isDone': isDone
    };
  }

  ///CONVERT INSTANCE OF MODEL INTO STRING
  @override
  String toString() {
    return 'taskId:$taskId, title:$title, priority: $priority, date: $date, isDone:$isDone';
  }
}
