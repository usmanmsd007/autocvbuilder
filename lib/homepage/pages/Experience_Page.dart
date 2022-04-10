import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/buildnewcvctrl.dart';
import '../../mywidgets/mybtn.dart';
import '../../mywidgets/mytxtfield.dart';

class MyExperience extends StatelessWidget {
  MyExperience({Key? key}) : super(key: key);

  final BuildNewCvCtrl ctrl = Get.find<BuildNewCvCtrl>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: SingleChildScrollView(
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
              Obx(
                () {
                  return AppTextField(
                    controller: ctrl.experienceC.value,
                    text: 'Experience',
                    keyboardtype: TextInputType.text,
                    geticon: Icons.calendar_today,
                    lines: 2,
                  );
                },
              ),
              const SizedBox(height: 10),
              MyButton(
                text: 'Next',
                myFunc: () {
                  ctrl.updateExperience(ctrl.experienceC.value.text);
                  ctrl.updateTabController();
                },
              ),
              const SizedBox(height: 20),
              // text()
            ],
          ),
        ),
      ),
    );
  }
}
