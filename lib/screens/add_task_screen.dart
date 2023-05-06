import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class AddTasksScreen extends StatelessWidget {
  final Function addTaskCallback;
  final firestore = FirebaseFirestore.instance;

   AddTasksScreen(this.addTaskCallback, {super.key});

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add Task', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.indigo[400], fontWeight: FontWeight.bold,),),
          TextField(autofocus: true, textAlign: TextAlign.center, onChanged: (newText) {
              newTaskTitle = newText;
              },
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle!);
              firestore.collection('tasks').add({
                'task': newTaskTitle ,
                'isDone': 'false' ,
              });
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
