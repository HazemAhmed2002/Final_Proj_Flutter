import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todaydo_app/Shared/shared_preferences.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _textEmailEditingController;
  late TextEditingController _textPasswordEditingController;
  // late TextEditingController _textNameEditingController;
  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _textEmailEditingController = TextEditingController();
    _textPasswordEditingController = TextEditingController();
    //  _textNameEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _textEmailEditingController.dispose();
    _textPasswordEditingController.dispose();
    //   _textNameEditingController.dispose();
  }
  late SharedPref _sharedPref;
  late SharedPreferences _sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body: Column(
  children: [Text(_sharedPref.loggedIn.toString())],
),
    );
  }
}
