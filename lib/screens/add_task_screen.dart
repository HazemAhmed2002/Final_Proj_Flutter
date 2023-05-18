import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class AddTasksScreen extends StatelessWidget {
  final Function addTaskCallback;

  AddTasksScreen(this.addTaskCallback, {super.key});

  final _firestore = FirebaseFirestore.instance;

  // void getTasks() async {
  //   final tasks = await _firestore.collection('tasks').get();
  //   for (var task in tasks.docs) {
  //     print(task.data());
  //   }
  // }

  void tasksSreams() async {
    await for (var snapshot in _firestore.collection('tasks').snapshots()) {
      for (var task in snapshot.docs) {
        print(task.data());
      }
    }
  }

  String? name;
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.indigo[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              name = newText;
              newTaskTitle = newText;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              tasksSreams();
              _firestore.collection('tasks').add({
                'name': name,
                'isDone': isDone,
              });

              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle!);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal[400]),
            child: const Text('Add'),
          )
        ],
      ),
    );
  }
}
