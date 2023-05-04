import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todaydo_app/screens/tasks_screen.dart';

import '../widgets/textFieldWidget.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
  late TextEditingController _textEmailEditingController;
  late TextEditingController _textPasswordEditingController;
   late TextEditingController _textNameEditingController;
  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    _textEmailEditingController = TextEditingController();
    _textPasswordEditingController = TextEditingController();
      _textNameEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEmailEditingController.dispose();
    _textPasswordEditingController.dispose();
       _textNameEditingController.dispose();
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
              SizedBox(height: 9,),
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => TasksScreen(),
                  ));
                }, child: Text('تسجيل') , style: TextButton.styleFrom(
                    backgroundColor: Colors.limeAccent,
                    primary: Colors.red
                ),
                ),
              ),

            ],
          ),
        ),
      ),
    );  }
}
