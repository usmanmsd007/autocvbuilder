// ignore_for_file: unused_import

import 'package:auto_cv_builder/mywidgets/mybtn.dart';
import 'package:auto_cv_builder/mywidgets/mytitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xfffbb448),
              Color(0xffe46b10),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const MyTitle(),
            const SizedBox(
              height: 80,
            ),
            MyButton(
              myFunc: () {
                Get.toNamed('/signup');
              } // Navigator.push(
              , //     context, MaterialPageRoute(builder: (context) => RegisterPage()));

              text: 'Register Now',
              width: 370,
              textcolor: Color(0xfff79c4f),
              backcolor: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              myFunc: () {
                Get.toNamed('/signup');
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              text: 'Register Now',
              width: 370,
              textcolor: Color(0xfff79c4f),
              backcolor: Colors.white,
            ),
            // RegisterBtn(),
            const SizedBox(
              height: 20,
            ),
            const LoginAsGuestBtn(),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                'By: Sheikh',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterBtn extends StatelessWidget {
  RegisterBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyButton(
      myFunc: () {
        Get.toNamed('/signup');
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      text: 'Register Now',
      width: 370,
      textcolor: Color(0xfff79c4f),
      backcolor: Colors.white,
    );
  }
}

class LoginAsGuestBtn extends StatelessWidget {
  const LoginAsGuestBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyButton(
      myFunc: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Homepage()));
      },
      text: 'Visit as an Guest',
      width: 370,
      textcolor: Color(0xfff79c4f),
      backcolor: Colors.white,
    );
  }
}

class LoginBtn extends StatelessWidget {
  const LoginBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyButton(
      myFunc: () {
        Get.toNamed('/signin');
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      text: 'Login',
      width: 370,
      textcolor: const Color(0xfff79c4f),
      backcolor: Colors.white,
    );
  }
}
