import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:todaydo_app/models/task.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  late Database database;
  initDatabase() async {
    String appPath = await getDatabasesPath();
    String dbPath = appPath + '/flutter_course.db';
    database = await openDatabase(dbPath, version: 2, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, isMale INTEGER');
    });
  }

  insertNewTask(Task task) async {
    try {
      int rowNumber = await database.insert('tasks', task.toMap());
      log(rowNumber.toString());
    } catch (e) {
      log("row has not been inserted");
    }
  }

  Future<List<Task>> getAllTask() async {
    await Future.delayed(const Duration(seconds: 3));
    List<Map> results = await database.query('tasks');
    List<Task> tasks = results.map((e) => Task.fromMap(e)).toList();
    return tasks;
  }

  Future<Task> getTaskById(int id) async {
    List<Map> results = await database.query('tasks', where: 'id=$id');
    return Task.fromMap(results.first);
  }

  deleteTask(int id) async {
    await database.delete('tasks', where: 'id=$id');
  }

  updateTask(Task task) async {
    await database.update('tasks', task.toMapUpdata(),
        where: 'id=${task.id}');
  }
}
