// ignore_for_file: unused_import

import 'package:auto_cv_builder/controllers/authctrl.dart';
import 'package:auto_cv_builder/mywidgets/mybackbtn.dart';
import 'package:auto_cv_builder/mywidgets/mybtn.dart';
import 'package:auto_cv_builder/mywidgets/mytxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Registerpage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  AuthenticationCtrl ctrl = Get.find<AuthenticationCtrl>();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: Container()),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  // MyTitle(),
                  const SizedBox(height: 50),
                  //       email(),
                  AppTextField(
                      controller: emailCtrl,
                      text: 'Email',
                      geticon: Icons.password,
                      keyboardtype: TextInputType.text),
                  const SizedBox(height: 20),
                  AppTextField(
                      controller: passwordCtrl,
                      text: 'Password',
                      geticon: Icons.password,
                      keyboardtype: TextInputType.text),
                  const SizedBox(height: 20),
                  // submitButton(),
                  MyButton(
                    myFunc: () {
                      emailCtrl.text.toString();
                      passwordCtrl.text.toString();
                      ctrl.signInWithEmailandPassword(
                          emailCtrl.text, passwordCtrl.text);

                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (context) => Homepage()));
                    },
                    text: 'Login',
                    width: 370,
                    textcolor: Colors.white,
                    backcolor: const Color(0xfff79c4f),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: const Text('Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  divider(),
                  facebookButton(),
                  SizedBox(height: height * .055),
                  // createAccountLabel(),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/signup');
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => RegisterPage()));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            'Don\'t have an account ?',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Register',
                            style: TextStyle(
                                color: Color(0xfff79c4f),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(top: 40, left: 0, child: MyBackButton()),
        ],
      ),
    ));
  }

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
  //       keyboardtype: TextInputType.text);
  // }

  Widget submitButton() {
    return MyButton(
      myFunc: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Homepage()));
      },
      text: 'Login',
      width: 370,
      textcolor: Colors.white,
      backcolor: const Color(0xfff79c4f),
    );
  }

  Widget createAccountLabel() {
    return InkWell(
      onTap: () {
        Get.toNamed('signup');
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: const <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget facebookButton() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: const Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: const Text('Log in with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}
