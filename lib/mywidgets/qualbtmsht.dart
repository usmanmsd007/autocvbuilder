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
            const Text('degree/Certeficate'),
            TextField(
              controller: ctrl.degreeC.value,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Institute'),
            TextField(
              controller: ctrl.instituteC.value,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Marks/gpa'),
            TextField(
              controller: ctrl.marksC.value,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Year'),
            TextField(
              controller: ctrl.yearC.value,
            ),
            const SizedBox(
              height: 10,
            ),
            MyButton(
              text: 'Add',
              myFunc: () {
                ctrl.addQual();
                // yearC.dispose();
                // instituteC.dispose();
                // degreeC.dispose();
                // marksC.dispose();
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }
}
