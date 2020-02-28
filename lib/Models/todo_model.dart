

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableName = "todo";
final String column_id = "id";
final String column_title = "title";
final String column_content = "content";

class TodoModel with ChangeNotifier {
  List<TaskModel> taskList = [];

  addTask(title, content) {
    final TaskModel taskModel = TaskModel(title: title, content: content);
    taskList.add(taskModel);
    notifyListeners();
  }
}

class TaskModel {
  String title;
  int id;
  String content;

  TaskModel({this.id, this.content, this.title});

  Map<String, dynamic> toMap() {
    return {
      column_id: this.id,
      column_title: this.title,
      column_content: this.content
    };
  }
}

class TodoHelper {
  Database db;

  TodoHelper() {
    initDatabase();
  }

  Future<void> initDatabase() async {
    db = await openDatabase(join(await getDatabasesPath(), "todo.db"),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE $tableName($column_id INTEGER PRIMARY KEY AUTOINCREMENT,$column_title TEXT,$column_content TEXT)");
    }, version: 1);
  }

  Future<void> insertTask(TaskModel task) async {
    db.insert(tableName, task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<TaskModel>> queryTask() async {
    final List<Map<String, dynamic>> tasks = await db.query(tableName);
    List.generate(tasks.length, (index) {
      return TaskModel(
          title: tasks[index][column_title],
          id: tasks[index][column_id],
          content: tasks[index][column_content]);
    });
  }
}
