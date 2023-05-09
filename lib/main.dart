import 'package:flutter/material.dart';
import 'package:todaydo_app/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:todaydo_app/screens/login%20screens/registration_screen.dart';
import 'package:todaydo_app/screens/login%20screens/signin_screen.dart';
import 'package:todaydo_app/screens/login%20screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todaydo_app/screens/pageView/all_task_screen.dart';
import 'package:todaydo_app/screens/pageView/complete_task.dart';
import 'package:todaydo_app/screens/pageView/incomplete_tasks.dart';
import 'package:todaydo_app/screens/responsive_design/larg_screens.dart';
import 'package:todaydo_app/screens/responsive_design/small_screens.dart';
import 'package:todaydo_app/screens/tasks_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: ResponsiveDesign(),
        initialRoute: _auth.currentUser != null
            ? ResponsiveDesign.screenRoute
            : WelcomeScreen.screenRoute,
        routes: {
          WelcomeScreen.screenRoute: (context) => const WelcomeScreen(),
          SignInScreen.screenRoute: (context) => const SignInScreen(),
          RegistrationScreen.screenRoute: (context) =>
              const RegistrationScreen(),
          TasksScreen.screenRoute: (context) => TasksScreen(),
          AllTasksScreen.screenRoute: (context) => const AllTasksScreen(),
          CompleteTaskScreen.screenRoute: (context) =>
              const CompleteTaskScreen(),
          InCompleteTasksScreen.screenRoute: (context) =>
              const InCompleteTasksScreen(),
          ResponsiveDesign.screenRoute: (context) => ResponsiveDesign(),
        },
      ),
    );
  }
}

class ResponsiveDesign extends StatelessWidget {
  static const String screenRoute = 'Responsive_design';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.of(context).size.width > 500
            ? LargeScreen()
            : SmallScreen());
  }
}
