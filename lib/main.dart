import 'package:flutter/material.dart';
import 'package:todaydo_app/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:todaydo_app/screens/login%20screens/registration_screen.dart';
import 'package:todaydo_app/screens/login%20screens/signin_screen.dart';
import 'package:todaydo_app/screens/login%20screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        // home: WelcomeScreen(),
        initialRoute: _auth.currentUser != null
            ? TasksScreen.screenRoute
            : WelcomeScreen.screenRoute,
        routes: {
          WelcomeScreen.screenRoute: (context) => const WelcomeScreen(),
          SignInScreen.screenRoute: (context) => const SignInScreen(),
          RegistrationScreen.screenRoute: (context) =>
              const RegistrationScreen(),
          TasksScreen.screenRoute: (context) => TasksScreen(),
        },
      ),
    );
  }
}
