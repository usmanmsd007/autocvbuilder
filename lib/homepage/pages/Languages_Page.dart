import 'package:auto_cv_builder/mywidgets/mytxtfield.dart';
import 'package:flutter/material.dart';

class MyLanguages extends StatelessWidget {
  const MyLanguages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          children: <Widget>[
            const Text(
              'Languages',
              style: TextStyle(
                color: Color(0xfff7892b),
                fontSize: 30,
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 50),
            language(),
            const SizedBox(height: 10),
            // add(),
          ],
        ),
      ),
    );
  }
}

Widget language() {
  var controller;
  return AppTextField(
    controller: controller,
    text: 'Language',
    keyboardtype: TextInputType.text,
    geticon: Icons.language,
  );
}
