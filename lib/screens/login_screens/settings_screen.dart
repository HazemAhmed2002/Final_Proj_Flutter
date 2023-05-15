import 'package:flutter/material.dart';
import 'package:todaydo_app/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'Settings_Screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[500],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Settings Screen",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.teal[800]),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(ResponsiveDesign.screenRoute);
                },
                child: Text("POP"))
          ],
        ),
      ),
    );
  }
}
