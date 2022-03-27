// ignore_for_file: unused_import, constant_identifier_names

import 'package:auto_cv_builder/bindings/buildNewCvBindings.dart';
import 'package:auto_cv_builder/homepage/New.dart';
import 'package:auto_cv_builder/mywidgets/mybackbtn.dart';
import 'package:auto_cv_builder/mywidgets/mybtn.dart';
import 'package:auto_cv_builder/mywidgets/mytitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// SOME PUBLIC VARIABLES FOR LATER USE.

// its used in the onpressed buttons of homescreen.
const NEWCV = '/newcv';
const LETTER = '/letter';
const SAVEDCV = 'savedcv';
const GETTOCVTEMPLATES = 'gettocvtemplates';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Auto CV Builder'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: 360,
          // padding: EdgeInsets.symmetric(horizontal: 13),
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyButton(
                  myFunc: () {
                    BuildNewCvBindings().dependencies();
                    Get.to(
                      () => NewCV(),
                    );
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => NewCV()));
                  },
                  text: 'Build New CV',
                  width: 370,
                  textcolor: const Color(0xfff79c4f),
                  backcolor: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                createLetters(),
                const SizedBox(
                  height: 20,
                ),
                templates(),
                const SizedBox(
                  height: 20,
                ),
                savedcv(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildnewcv() {
    return MyButton(
      myFunc: () {
        BuildNewCvBindings().dependencies();
        Get.to(
          () => NewCV(),
        );
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => NewCV()));
      },
      text: 'Build New CV',
      width: 370,
      textcolor: const Color(0xfff79c4f),
      backcolor: Colors.white,
    );
  }

  Widget createLetters() {
    return MyButton(
      myFunc: () {
        print("Get.to(LETTER)");
        // Get.to(LETTER);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Letter()));
      },
      text: 'Create Latters',
      width: 370,
      textcolor: Color(0xfff79c4f),
      backcolor: Colors.white,
    );
  }

  Widget templates() {
    return MyButton(
      myFunc: () {
        print("Get.to(GETTOCVTEMPLATES)");

        // Get.to(GETTOCVTEMPLATES);
        // Navigator.pus.comMaterialPageRoute(builder: (context) => CvTemplates()));
      },
      text: 'CV Templates',
      width: 370,
      textcolor: Color(0xfff79c4f),
      backcolor: Colors.white,
    );
  }

  // String SSAVEDCV = 'savedcv';
  Widget savedcv() {
    return MyButton(
      myFunc: () {
        // Navigator.push(
        // context, MaterialPageRoute(builder: (context) => SavedCV()));.
        print('Get.to(SAVEDCV)');
      },
      text: 'Saved CV',
      width: 370,
      textcolor: Color(0xfff79c4f),
      backcolor: Colors.white,
    );
  }
}
