import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todaydo_app/screens/tasks_screen.dart';

import '../firebase/firebase_controller.dart';
import '../widgets/textFieldWidget.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
    TextEditingController? _textNameEditingController;
    TextEditingController? _textEmailEditingController;
    TextEditingController? _textPasswordEditingController;
    String em ="email";

  String? _emailError;

  String? _passwordError;

  void initState() {
    _textEmailEditingController = TextEditingController();
    _textPasswordEditingController = TextEditingController();
      _textNameEditingController = TextEditingController();
  }

  void dispose() {
    _textEmailEditingController?.dispose();
    _textPasswordEditingController?.dispose();
       _textNameEditingController?.dispose();
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
              Text(
                'تسجيل',
                style: GoogleFonts.nunito(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color(0XFF23203F)),
              ),
              const SizedBox(height: 9,),
              Text(
                'قم بإنشاء حساب لبدء استخدام التطبيق', style: GoogleFonts.roboto(
                  fontSize: 18, color: const Color(0XFF716F87),),),
              const SizedBox(height: 36,),
              TextFieldWidget(hint: 'الاسم', tet: TextInputType.name,textEditingController: _textNameEditingController, ),
              const SizedBox(height: 30,),
              TextFieldWidget(hint: 'البريد الالكتروني', tet: TextInputType.emailAddress,textEditingController: _textEmailEditingController),
              const SizedBox(height: 30,),
              TextFieldWidget(hint: 'كلمة المرور', tet: TextInputType.visiblePassword,textEditingController: _textPasswordEditingController),
              const SizedBox(height: 30,),
              Center(
                child: TextButton(onPressed: (){
                  setState(() {
                    em =_textEmailEditingController as String;
                  });
                  signUp();

                }, style: TextButton.styleFrom(
                    backgroundColor: Colors.limeAccent,
                    primary: Colors.red
                ), child: const Text('تسجيل') ,
                ),
              ),
              Text(em ,style: TextStyle(fontSize: 20),)

            ],
          ),
        ),
      ),
    );
  }

   Future<void> signUp() async {
     bool createAccount = await FBController().createAccount(email: _textEmailEditingController!.text.toString(), password: _textPasswordEditingController!.text.toString());
     if(createAccount){
       Navigator.of(context as BuildContext).pushReplacement(MaterialPageRoute(
         builder: (context) => TasksScreen(),
       ));
     }else{
       DiagnosticsNode.message('not Sign up');
     }
   }
}
