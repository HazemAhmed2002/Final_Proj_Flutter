import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo_app/widgets/task_tile.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> taskWidgets = [
    Task(name: 'go shopping'),
    Task(name: 'buy a gift'),
    Task(name: 'repair the car'),
  ];

  void addTask(String newTaskTitle) {
    taskWidgets.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.doneChange();
    notifyListeners();
  }

  void deleteTask(Task task) {
    taskWidgets.remove(task);
    notifyListeners();
  }
}

class StreamWidget extends StatelessWidget {
  StreamWidget({
    Key? key,
  }) : super(key: key);
  TaskData taskData = TaskData();
  List<Task> taskWidgets = [
    Task(name: 'go shopping'),
    Task(name: 'buy a gift'),
    Task(name: 'repair the car'),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.taskWidgets.length,
        itemBuilder: (context, index) {
          return TasksTile(
            isChecked: taskData.taskWidgets[index].isDone,
            taskTile: taskData.taskWidgets[index].name,
            checkboxChange: (newValue) {
              taskData.updateTask(taskData.taskWidgets[index]);
            },
            listTileDelete: () {
              taskData.deleteTask(taskData.taskWidgets[index]);
            },
          );
        },
      );
    });
  }
}
