// ignore_for_file: unused_import

import 'package:auto_cv_builder/controllers/authctrl.dart';
import 'package:auto_cv_builder/mywidgets/mybackbtn.dart';
import 'package:auto_cv_builder/mywidgets/mybtn.dart';
import 'package:auto_cv_builder/mywidgets/mytitle.dart';
import 'package:auto_cv_builder/mywidgets/mytxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  var ctrl = Get.find<AuthenticationCtrl>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: Container(), // child: BezierContainer(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    const MyTitle(),
                    SizedBox(height: 50),
                    // AppTextField(controller: usernameCtrl, text: 'Username', keyboardtype: Tex, geticon: geticon)
                    SizedBox(height: 50),
                    AppTextField(
                        controller: emailCtrl,
                        text: 'Eamil ID',
                        geticon: Icons.email,
                        keyboardtype: TextInputType.text),
                    SizedBox(height: 50),
                    AppTextField(
                        controller: passwordCtrl,
                        text: 'Password',
                        geticon: Icons.email,
                        keyboardtype: TextInputType.text),
                    SizedBox(height: 20),
                    // register(),
                    MyButton(
                      myFunc: () {
                        ctrl.signUpWithEmailandPassword(
                            emailCtrl.text.toString(),
                            passwordCtrl.text.toString());
                        // Navigator.push(
                        //     context, MaterialPageRoute(builder: (context) => Homepage()));
                      },
                      text: 'Register Now',
                      width: 370,
                      textcolor: Colors.white,
                      backcolor: Color(0xfff79c4f),
                    ),
                    SizedBox(height: height * .14),
                    loginAccountLabel()
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: MyBackButton())
          ],
        ),
      ),
    );
  }

  // Widget username() {
  //   var controller;
  //   return AppTextField(
  //       controller: controller,
  //       text: 'Username',
  //       geticon: Icons.person_add,
  //       keyboardtype: TextInputType.text);
  // }

  // Widget email() {
  //   var controller;
  //   return AppTextField(
  //       controller: controller,
  //       text: 'Eamil ID',
  //       geticon: Icons.email,
  //       keyboardtype: TextInputType.text);
  // }

  // Widget password() {
  //   var controller;
  //   return AppTextField(
  //       controller: controller,
  //       text: 'Password',
  //       geticon: Icons.password,
  //       keyboardtype: TextInputType.visiblePassword);
  // }

  Widget register() {
    return MyButton(
      myFunc: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Homepage()));
      },
      text: 'Register Now',
      width: 370,
      textcolor: Colors.white,
      backcolor: Color(0xfff79c4f),
    );
  }

  Widget loginAccountLabel() {
    return InkWell(
      onTap: () {
        Get.to('/signin');
        // Navigator.push(
        //   ,
        //   MaterialPageRoute(
        //     builder: (context) => LoginPage(),
        //   ),
        // );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 10),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
