import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskWidgets.length,
          itemBuilder: (context, index) {
            return TasksTile(
              isChecked: taskData.taskWidgets[index].isDone!,
              taskTile: taskData.taskWidgets[index].name!,
              checkboxChange: (newValue) {
                taskData.updateTask(taskData.taskWidgets[index]);
              },
              listTileDelete: () {
                taskData.deleteTask(taskData.taskWidgets[index]);
              },
            );
          },
        );
      },
    );
  }
}
