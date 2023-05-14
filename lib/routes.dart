import 'package:flutter/cupertino.dart';
import 'package:todaydo_app/screens/login_screens/registration_screen.dart';
import 'package:todaydo_app/screens/login_screens/signin_screen.dart';
import 'package:todaydo_app/screens/login_screens/welcome_screen.dart';
import 'package:todaydo_app/screens/pageView/all_task_screen.dart';
import 'package:todaydo_app/screens/pageView/complete_task.dart';
import 'package:todaydo_app/screens/pageView/incomplete_tasks.dart';
import 'package:todaydo_app/screens/tasks_screen.dart';

import 'main.dart';

Map<String, WidgetBuilder> get routes {
    return {
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
      };
  }