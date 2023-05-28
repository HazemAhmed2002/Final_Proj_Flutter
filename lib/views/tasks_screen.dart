import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../controllers/db_controller.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return NewTaskScreen(getAllTasks);
              // }));
            }),
        appBar: AppBar(
          title: Text('Tasks screen'),
        ),
        body: Consumer<DbController>(

          builder: (context, controller, x) {
            return controller.isLoading?
           const Center(child: CircularProgressIndicator(),):
            
            
            controller.tasks.isEmpty?
             Center(child: Lottie.asset('assets/animations/empty.json') ):
            ListView.builder(
                itemCount: controller.tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          controller.deleteTask(controller.tasks[index].id!);
                        
                        },
                        icon: Icon(Icons.delete)),
                    title: Text(controller.tasks[index].name ?? ''),
                  );
                });
          },
        ));
  }
}
