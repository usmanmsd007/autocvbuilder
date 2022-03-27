import 'package:auto_cv_builder/mywidgets/mytxtfield.dart';

import 'package:flutter/material.dart';

class MyExperience extends StatefulWidget {
  const MyExperience({Key? key}) : super(key: key);

  @override
  _MyExperienceState createState() => _MyExperienceState();
}

class _MyExperienceState extends State<MyExperience> {
  bool value = false;
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
              'Experience',
              style: TextStyle(
                color: Color(0xfff7892b),
                fontSize: 30,
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 50),
            check(),
            reference(),
            // add(),
          ],
        ),
      ),
    );
  }

  Widget check() {
    return Container(
      alignment: Alignment.topRight,
      child: Checkbox(
        activeColor: const Color(0xfff7892b),
        side: const BorderSide(color: Color(0xfff7892b)),
        value: value,
        onChanged: (bool? v) {
          setState(
            () {
              this.value = v!;
            },
          );
        },
      ),
    );
  }
}

Widget reference() {
  var controller;
  return AppTextField(
    controller: controller,
    text: 'Experience',
    keyboardtype: TextInputType.text,
    geticon: Icons.poll_outlined,
  );
}
