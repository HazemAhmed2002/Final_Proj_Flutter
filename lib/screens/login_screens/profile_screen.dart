import 'package:flutter/material.dart';
import 'package:todaydo_app/main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'Profile_Screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[500],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Profile Screen",
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
                child: const Text("POP"))
          ],
        ),
      ),
    );
  }
}
