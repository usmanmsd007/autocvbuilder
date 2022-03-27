import 'package:auto_cv_builder/mywidgets/mytxtfield.dart';
import 'package:flutter/material.dart';

class MyProjets extends StatefulWidget {
  const MyProjets({Key? key}) : super(key: key);

  @override
  _MyProjetsState createState() => _MyProjetsState();
}

class _MyProjetsState extends State<MyProjets> {
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
              'Projects',
              style: TextStyle(
                color: Color(0xfff7892b),
                fontSize: 30,
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 50),
            check(),
            project(),
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
        activeColor: Color(0xfff7892b),
        side: BorderSide(color: Color(0xfff7892b)),
        value: this.value,
        onChanged: (bool? value) {
          setState(
            () {
              this.value = value!;
            },
          );
        },
      ),
    );
  }
}

Widget project() {
  var controller;
  return AppTextField(
    controller: controller,
    text: 'Language',
    keyboardtype: TextInputType.text,
    geticon: Icons.list_alt,
  );
}
