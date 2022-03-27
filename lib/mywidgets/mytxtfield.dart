// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// class MyTextField extends StatefulWidget {
//   const MyTextField({Key key}) : super(key: key);

//   @override
//   _MyTextFieldState createState() => _MyTextFieldState();
// }

// class _MyTextFieldState extends State<MyTextField> {
//   TextEditingController controller = TextEditingController();

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    required this.controller,
    required this.text,
    // this.readOnly = false,
    required this.keyboardtype,
    required this.geticon,
    this.lines = 1,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  // bool readOnly;
  int lines;
  final IconData geticon;
  final TextInputType keyboardtype;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: lines,
      controller: controller,
      keyboardType: keyboardtype,
      cursorColor: const Color(0xfff79c4f),
      style: const TextStyle(
        color: Color(0xfff79c4f),
        fontSize: 14,
      ),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xfff79c4f))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff79c4f))),
        labelText: text,
        labelStyle: const TextStyle(color: Color(0xfff79c4f)),
        prefixIcon: Icon(
          geticon,
          color: const Color(0xfff79c4f),
        ),
      ),
    );
  }
}
