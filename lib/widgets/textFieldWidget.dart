// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    required this.hint,
    required this.tet,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);
  String hint;
  TextInputType tet;
  TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: tet,
      // maxLines:30 ,
      maxLength: 30,
      decoration: InputDecoration(
          counterText: '',
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.limeAccent))),
      controller: textEditingController,
    );
  }
}
