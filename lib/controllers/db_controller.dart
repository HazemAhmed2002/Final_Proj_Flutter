import 'package:flutter/material.dart';
import 'package:todaydo_app/models/task.dart';

import '../models/db_helper.dart';

class DbController extends ChangeNotifier {
  DbController() {
    getAllTasks();
  }
  List<Task> tasks = [];
  bool isLoading = false;
  flipIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  getAllTasks() async {
    flipIsLoading();
    tasks = await DbHelper.dbHelper.getAllTask();
    flipIsLoading();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController gpaController = TextEditingController();
  bool isDone = false;
  insertNewTask(String? name) async {
    Task task = Task(
      name: name,
      isDone: isDone,
    );
    await DbHelper.dbHelper.insertNewTask(task);
    getAllTasks();
  }

  updateTask(Task task) async {
    await DbHelper.dbHelper.updateTask(task);
    task.doneChange();
    notifyListeners();
  }

  deleteTask(int id) async {
    await DbHelper.dbHelper.deleteTask(id);
    tasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
