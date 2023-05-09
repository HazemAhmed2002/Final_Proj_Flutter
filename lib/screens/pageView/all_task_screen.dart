import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/task_data.dart';
import '../../widgets/tasks_list.dart';

class AllTasksScreen extends StatefulWidget {
    static const String screenRoute = 'all_tasks_screen';

  const AllTasksScreen({super.key});

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return MyWidget();
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[400],
      body: Container(
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
                child:  StreamWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
