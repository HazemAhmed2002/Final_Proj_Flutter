import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todaydo_app/widgets/tasks_list.dart';

import '../../models/task_data.dart';
import '../../widgets/task_tile.dart';
import '../add_task_screen.dart';

class CompleteTaskScreen extends StatefulWidget {
    static const String screenRoute = 'complete_task_screen';

  const CompleteTaskScreen({super.key});

  @override
  State<CompleteTaskScreen> createState() => _CompleteTaskScreenState();
}

class _CompleteTaskScreenState extends State<CompleteTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
        bottom: 45,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${Provider.of<TaskData>(context).taskWidgets.length} Tasks',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Consumer<TaskData>(
                  builder: (context, taskData, child) {
                    return ListView.builder(
                      itemCount: taskData.taskWidgets
                          .where((element) => element.isDone)
                          .length,
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
                  },
                )),
          ),
        ],
      ),
    );
  }
}
