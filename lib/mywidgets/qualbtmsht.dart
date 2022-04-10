import 'package:auto_cv_builder/controllers/buildnewcvctrl.dart';
// import 'package:auto_cv_builder/models/qualification.dart';
import 'package:auto_cv_builder/mywidgets/mybtn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QualBottomSheet extends StatelessWidget {
  QualBottomSheet({Key? key}) : super(key: key);
  final BuildNewCvCtrl ctrl = Get.find<BuildNewCvCtrl>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'degree/Certeficate',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              controller: ctrl.degreeC.value,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Institute',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              controller: ctrl.instituteC.value,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Marks/gpa',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              controller: ctrl.marksC.value,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Year',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              controller: ctrl.yearC.value,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  ctrl.addQual();
                  Get.back();
                },
                child: Text(
                  'ADD',
                  style: TextStyle(fontSize: 16, color: Colors.orange),
                ))
          ],
        ),
      ),
    );
  }
}
