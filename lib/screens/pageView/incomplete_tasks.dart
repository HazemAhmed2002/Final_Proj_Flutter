import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo_app/controllers/db_controller.dart';
import '../../widgets/task_tile.dart';

class InCompleteTasksScreen extends StatefulWidget {
  static const String screenRoute = 'in_complete_tasks_screen';

  const InCompleteTasksScreen({super.key});

  @override
  State<InCompleteTasksScreen> createState() => _InCompleteTasksScreenState();
}

class _InCompleteTasksScreenState extends State<InCompleteTasksScreen> {
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
            '${Provider.of<DbController>(context).tasks.length} Tasks',
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
              child: Consumer<DbController>(
                builder: (context, taskData, child) {
                  return ListView.builder(
                    itemCount: taskData.tasks
                        .where((element) => !element.isDone!)
                        .length,
                    itemBuilder: (context, index) {
                      return TasksTile(
                        isChecked: taskData.tasks
                            .where((element) => !element.isDone!)
                            .toList()[index]
                            .isDone!,
                        taskTile: taskData.tasks
                            .where((element) => !element.isDone!)
                            .toList()[index]
                            .name!,
                        checkboxChange: (newValue) {
                          taskData.updateTask(taskData.tasks
                              .where((element) => !element.isDone!)
                              .toList()[index]);
                        },
                        listTileDelete: () {
                          taskData.deleteTask(taskData.tasks
                              .where((element) => !element.isDone!)
                              .toList()[index] as int);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
