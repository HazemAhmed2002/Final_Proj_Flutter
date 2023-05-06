import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo_app/widgets/task_tile.dart';
import 'package:todaydo_app/widgets/tasks_list.dart';
import 'task.dart';


final firestore = FirebaseFirestore.instance;
class TaskData extends ChangeNotifier {

  List<TheTask> taskWidgets = [
    TheTask(name: 'go shopping'),
    TheTask(name: 'buy a gift'),
    TheTask(name: 'repair the car'),
  ];

  void addTask(String newTaskTitle) {
    taskWidgets.add(TheTask(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(TheTask task) {
    task.doneChange();
    notifyListeners();
  }

  void deleteTask(TheTask task) {
    taskWidgets.remove(task);
    notifyListeners();
  }
}


class TheTask {
  final String name;
  bool isDone;

  TheTask({required this.name, this.isDone = false});

    //   Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text(name),
    //     Padding(
    //       padding: const EdgeInsets.only(top: 8.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [ Material(
    //             elevation: 5,
    //             color:  Colors.white,
    //             borderRadius: const BorderRadius.only(
    //                 bottomRight: Radius.circular(15),
    //                 bottomLeft: Radius.circular(15),
    //                 topRight: Radius.circular(15)
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text(name,style: const TextStyle(color: Colors.black),),
    //             )),
    //
    //         ],
    //       ),
    //     )
    //   ],
    // );


  void doneChange() {
    isDone = !isDone;
  }
}

class StreamWidget extends StatelessWidget {
   StreamWidget({Key? key,}) : super(key: key);
   TaskData taskData = TaskData();
   List<TheTask> taskWidgets = [
     TheTask(name: 'go shopping'),
     TheTask(name: 'buy a gift'),
     TheTask(name: 'repair the car'),
   ];
   @override
   Widget build(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: firestore.collection('tasks').snapshots(),
    builder: (context,snapshot) {
      List<TheTask> taskWidgets = [
        TheTask(name: 'go shopping'),
        TheTask(name: 'buy a gift'),
        TheTask(name: 'repair the car'),
      ];
        if(!snapshot.hasData){
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }
          // final tasks = snapshot.data!.docs;
          // for(var task in tasks) {
          //   final taskText = task.get('task') as String;
          //   final isDone = task.get('isDone') as bool;
          //   final messageWidget = TheTask(name: taskText, isDone: isDone);
          //   taskWidgets.add(messageWidget);
          // }
          return Consumer<TaskData>(
            builder: (context, taskData, child) {
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
            },
          );
 }
   );
   }
}