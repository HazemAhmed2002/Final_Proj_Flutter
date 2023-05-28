import 'package:flutter/material.dart';
import 'package:todaydo_app/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:todaydo_app/responsive_design.dart';
import 'package:todaydo_app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todaydo_app/screens/on_boarding_screens/onboarding_screen.dart';

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
        initialRoute: _auth.currentUser != null
            ? ResponsiveDesign.screenRoute
            : OnboardingScreen.screenRoute,
        routes: routes,
      ),
    );
  }
}
