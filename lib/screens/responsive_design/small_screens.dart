import 'package:flutter/material.dart';
import 'package:todaydo_app/screens/login_screens/profile_screen.dart';
import 'package:todaydo_app/screens/login_screens/welcome_screen.dart';
import 'package:todaydo_app/screens/pageView/all_task_screen.dart';
import 'package:todaydo_app/screens/pageView/complete_task.dart';
import 'package:todaydo_app/screens/pageView/incomplete_tasks.dart';
import 'package:todaydo_app/screens/login_screens/settings_screen.dart';
import 'package:todaydo_app/widgets/list_tile_drawer.dart';
import '../../responsive_design.dart';
import '../add_task_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SmallScreen extends StatefulWidget {
  static const String screenRoute = 'small_screen';

  @override
  State<SmallScreen> createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
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
      drawer: Drawer(
        backgroundColor: Colors.teal[500],
        child: ListView(children: [
          Column(
            children: [
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.teal[900],
                  ),
                  currentAccountPicture: const CircleAvatar(
                    backgroundImage: AssetImage('images/hazem.jpg'),
                  ),
                  accountName: const Text("Hazem"),
                  accountEmail: const Text("ahmedhazeml734@gmail.com")),
              ListTileDrawer(
                name: "Home Page",
                icon: const Icon(Icons.home),
                subtitle: "Go to the Home page",
                nav: () {
                  Navigator.of(context).pushNamed(ResponsiveDesign.screenRoute);
                },
              ),
              ListTileDrawer(
                name: "Profile",
                subtitle: "Go to the Profile page",
                icon: const Icon(Icons.person),
                nav: () {
                  Navigator.of(context).pushNamed(ProfileScreen.screenRoute);
                },
              ),
              ListTileDrawer(
                name: "Settings",
                subtitle: "Go to the Settings page",
                icon: const Icon(Icons.settings),
                nav: () {
                  Navigator.of(context).pushNamed(SettingsScreen.screenRoute);
                },
              ),
              ListTileDrawer(
                name: "LogOut",
                subtitle: "Log out of the app",
                icon: const Icon(Icons.logout),
                nav: () {
                  Navigator.of(context).pushNamed(WelcomeScreen.screenRoute);
                },
              ),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal[400],
        selectedFontSize: 15,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        unselectedFontSize: 10,
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "All Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: "Complete Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel),
            label: "InComplete Tasks",
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTasksScreen((newTaskTitle) {}),
                ),
              ),
            );
          },
          backgroundColor: Colors.indigo[400],
          child: const Icon(Icons.add),
        ),
      ),
      backgroundColor: Colors.teal[400],
      body: _list.elementAt(pageIndex),
    );
  }
}
