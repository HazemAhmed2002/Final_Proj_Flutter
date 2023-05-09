import 'package:flutter/material.dart';
import 'package:todaydo_app/screens/login%20screens/welcome_screen.dart';
import 'package:todaydo_app/screens/pageView/all_task_screen.dart';
import 'package:todaydo_app/screens/pageView/complete_task.dart';
import 'package:todaydo_app/screens/pageView/incomplete_tasks.dart';
import 'package:todaydo_app/screens/login%20screens/settings_screen.dart';
import 'package:todaydo_app/widgets/list_tile_drawer.dart';
import '../add_task_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../tasks_screen.dart';

class LargeScreen extends StatefulWidget {
  static const String screenRoute = 'tasks_screen';

  @override
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      late User signedInUser;

      @override
      void initState() {
        super.initState();
        getCurrentUser();
      }

      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  int pageIndex = 0;

  final List<Widget> _list = [
    const AllTasksScreen(),
    const CompleteTaskScreen(),
    const InCompleteTasksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 60,
          backgroundColor: Colors.teal[900],
          title: const Text(
            'ToDayDo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.teal[500],
        body: Row(
          children: [
            Expanded(
                child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.teal[800],
                  ),
                  currentAccountPicture: const CircleAvatar(
                    backgroundImage: AssetImage('images/hazem.jpg'),
                  ),
                  accountName: const Text("Hazem"),
                  accountEmail: const Text("ahmedhazeml734@gmail.com"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, AllTasksScreen.screenRoute);
                  },
                  title: const Text("All Tasks"),
                  subtitle: const Text("Go To All Tasks"),
                  leading: const Icon(Icons.list),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                        context, CompleteTaskScreen.screenRoute);
                  },
                  title: const Text("Complete Tasks"),
                  subtitle: const Text("Go To Complete Tasks"),
                  leading: const Icon(Icons.done),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                        context, InCompleteTasksScreen.screenRoute);
                  },
                  title: const Text("InComplete Tasks"),
                  subtitle: const Text("Go To InComplete Tasks"),
                  leading: const Icon(Icons.cancel),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            )),
            Expanded(
              child: _list.elementAt(pageIndex),
            ),
          ],
        ));
  }
}
