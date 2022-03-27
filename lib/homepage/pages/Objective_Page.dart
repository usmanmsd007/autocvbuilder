import 'package:auto_cv_builder/controllers/buildnewcvctrl.dart';
// import 'package:auto_cv_builder/controllers/objectivecontroller/objectivesCtrl.dart';
import 'package:auto_cv_builder/mywidgets/mybtn.dart';
import 'package:auto_cv_builder/mywidgets/mytxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyObjective extends StatelessWidget {
  MyObjective({Key? key}) : super(key: key);
  BuildNewCvCtrl buildNewCvCtrl = Get.find<BuildNewCvCtrl>();

  // ObjectivesController objectivesController = Get.put(ObjectivesController());

  @override
  Widget build(BuildContext context) {
    // return GetX(
    //     init: Get.find<ObjectivesController>(),
    //     builder: (ObjectivesController ctrl) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Text(
                'Objectives',
                style: TextStyle(
                  color: Color(0xfff7892b),
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 50),
              Obx(() {
                return AppTextField(
                  controller: buildNewCvCtrl.objectiveC.value,
                  text: 'Objective',
                  keyboardtype: TextInputType.text,
                  geticon: Icons.calendar_today,
                  lines: 2,
                );
              }),
              MyButton(
                text: 'Next',
                myFunc: () {
                  // buildNewCvCtrl.totalDetails.value.obejctives =
                  //     objectivesController.objectiveC.value.text;

                  buildNewCvCtrl
                      .updateObjectives(buildNewCvCtrl.objectiveC.value.text);
                  // ctrl.tabController.index + 1;
                  buildNewCvCtrl.updateTabController();
                },
              ),
              // obj(),
              const SizedBox(height: 20),
              text()
            ],
          ),
        ),
      ),
    );
    // });
  }
}

Widget text() {
  return Container(
    height: 350,
    // margin: EdgeInsets.symmetric(
    //   vertical: 8,
    // ),
    child: Column(
      children: [
        Row(
          children: const <Widget>[
            Text(
              'HINT',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                color: Color(0xfff7892b),
                fontSize: 20,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.light_mode,
              color: Color(0xfff7892b),
            ),
          ],
        ),
        const Text(
          '\n\n1. To secure a challenging position in a reputable\norganization to expand my learning, knowledge and\nskills.',
          style: TextStyle(
            color: Color(0xfff7892b),
          ),
        ),
        const Text(
          '\n2. secure a reponsiable career opportunity to fully\n     utilize my traning, skills, while making a significant\n     contribution to the succes of the company.',
          style: TextStyle(
            color: Color(0xfff7892b),
          ),
        ),
        const Text(
          '\n3. Seeking an entry-level position to begin my career\n     in a heigh-level professional environment.',
          style: TextStyle(
            color: Color(0xfff7892b),
          ),
        ),
        const Text(
          '\n4. A highly organized and hard-working individual\n     looking for a reponsible position to gain practical\n     experience.',
          style: TextStyle(
            color: Color(0xfff7892b),
          ),
        ),
      ],
    ),
  );
}
