import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todaydo_app/screens/register_screen.dart';
import 'package:todaydo_app/screens/tasks_screen.dart';

import '../Shared/shared_preferences.dart';
import '../firebase/firebase_controller.dart';
import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _prefs =  SharedPreferences.getInstance();
  Future<void>  _incrementCounter() async{
    final SharedPreferences pref =await _prefs;
    pref.setBool('launch', true);
  }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 165,
            left: 30,
            right: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("المهام اليومية", style: GoogleFonts.nunito(fontSize: 30, fontWeight: FontWeight.bold, color: const Color(0XFF23203F)),)),
              const SizedBox(height: 9,),
              Center(child: Text('تسجيل الدخول', style: GoogleFonts.roboto(fontSize: 18, color: const Color(0XFF716F87),),)),
              const SizedBox(height: 36,),
            //  TextField(controller: _textNameEditingController, keyboardType: TextInputType.name, decoration: InputDecoration(errorText: _emailError, border: const OutlineInputBorder(),),),
         //     const SizedBox(height: 30,),
              Text('البريد الالكتروني', style: GoogleFonts.roboto(fontSize: 18, color: const Color(0XFF716F87),),),
              TextField(controller: _textEmailEditingController, keyboardType: TextInputType.emailAddress, decoration: InputDecoration(errorText: _emailError, border: const OutlineInputBorder(),),),
              const SizedBox(height: 30,),
              Text('كلمة المرور', style: GoogleFonts.roboto(fontSize: 18, color: const Color(0XFF716F87),),),
              TextField(controller: _textPasswordEditingController, keyboardType: TextInputType.visiblePassword, cursorHeight: 30, cursorWidth: 10, obscureText: true, obscuringCharacter: '*', decoration: InputDecoration(errorText: _passwordError, border: const OutlineInputBorder(),),),
              const SizedBox(height: 30,),
              Center(child: ElevatedButton(
                onPressed: ()async {
                  await login();
                },
                child: const Text('تسجيل الدخول'),
              )
                  // TextButton(onPressed: (){
                  //   Navigator.pushNamed(context, '/home_screen');
                  // }, child: Text('Sign in') , style: TextButton.styleFrom(
                  //     backgroundColor: Colors.limeAccent,
                  //     primary: Colors.red
                  // ),
                  // ),
                  ),
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>  RegisterScreen(),
                      ));                    },
                    child: const Text('إنشاء حساب')),
              ),
            ],
          ),
        ),
      ),
    );
  }




  Future<void> login()async {
    await SharedPref().saveData(user: user());
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login Sucsess')));
    bool loggeIn = await FBController().login(email: _textEmailEditingController.text, password: _textPasswordEditingController.text);
    if(loggeIn){
      _incrementCounter();
      Navigator.pushReplacementNamed(context, '/home_screen');
    }
  }
  User user(){
    User user =User();
    user.email = _textEmailEditingController.text;
    user.password = _textPasswordEditingController.text;
    //   user.name = _textNameEditingController.text;
    return user;
  }
}


