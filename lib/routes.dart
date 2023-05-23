import 'package:flutter/cupertino.dart';
import 'package:todaydo_app/responsive_design.dart';
import 'package:todaydo_app/screens/login_screens/profile_screen.dart';
import 'package:todaydo_app/screens/login_screens/registration_screen.dart';
import 'package:todaydo_app/screens/login_screens/settings_screen.dart';
import 'package:todaydo_app/screens/login_screens/signin_screen.dart';
import 'package:todaydo_app/screens/login_screens/welcome_screen.dart';
import 'package:todaydo_app/screens/on_boarding_screens/onboarding_screen.dart';
import 'package:todaydo_app/screens/pageView/all_task_screen.dart';
import 'package:todaydo_app/screens/pageView/complete_task.dart';
import 'package:todaydo_app/screens/pageView/incomplete_tasks.dart';

Map<String, WidgetBuilder> get routes {
  return {
    WelcomeScreen.screenRoute: (context) => const WelcomeScreen(),
    SignInScreen.screenRoute: (context) => const SignInScreen(),
    RegistrationScreen.screenRoute: (context) => const RegistrationScreen(),
    AllTasksScreen.screenRoute: (context) => const AllTasksScreen(),
    CompleteTaskScreen.screenRoute: (context) => const CompleteTaskScreen(),
    InCompleteTasksScreen.screenRoute: (context) =>
        const InCompleteTasksScreen(),
    ResponsiveDesign.screenRoute: (context) => ResponsiveDesign(),
    ProfileScreen.screenRoute: (context) => const ProfileScreen(),
    SettingsScreen.screenRoute: (context) => const SettingsScreen(),
    OnboardingScreen.screenRoute: (context) => const OnboardingScreen(),
  };
}
