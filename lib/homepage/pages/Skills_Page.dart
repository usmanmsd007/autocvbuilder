// ignore_for_file: unused_import

import 'package:auto_cv_builder/mywidgets/mytxtfield.dart';
// import 'package:auto_cv_builder/src/Reference_Page.dart';
import 'package:flutter/material.dart';

class MySkills extends StatelessWidget {
  const MySkills({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          children: <Widget>[
            const Text(
              'Skills',
              style: TextStyle(
                color: Color(0xfff7892b),
                fontSize: 30,
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 50),
            skill(),
            // add(),
          ],
        ),
      ),
    );
  }
}

Widget skill() {
  var controller;
  return AppTextField(
    controller: controller,
    text: 'Skill',
    keyboardtype: TextInputType.text,
    geticon: Icons.computer,
  );
}
