import 'package:auto_cv_builder/controllers/buildnewcvctrl.dart';
import 'package:auto_cv_builder/mywidgets/mybtn.dart';
import 'package:auto_cv_builder/mywidgets/mytxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAchievements extends StatelessWidget {
  MyAchievements({Key? key}) : super(key: key);
  final BuildNewCvCtrl ctrl = Get.find<BuildNewCvCtrl>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const Text(
                    'Achievements',
                    style: TextStyle(
                      color: Color(0xfff7892b),
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  // const SizedBox(height: 50),
                  SizedBox(
                    height: 200,
                    child: Obx(() {
                      return ctrl.acheivements.value.length > 0
                          ? CustomScrollView(
                              slivers: [
                                SliverGrid(
                                  delegate: SliverChildBuilderDelegate((c, i) {
                                    return Text(
                                      ctrl.acheivements.value[i]!,
                                    );
                                  },
                                      childCount:
                                          ctrl.acheivements.value.length),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 1,
                                          crossAxisCount: 1,
                                          crossAxisSpacing: 1,
                                          mainAxisSpacing: 3,
                                          mainAxisExtent: 40),
                                ),
                              ],
                            )
                          : const Text('No Acheivements Yet');
                    }),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: ctrl.acheivementsC.value,
                          text: 'Achievemsnts',
                          keyboardtype: TextInputType.text,
                          geticon: Icons.task,
                        ),
                      ),
                    ],
                  ),
                  MyButton(
                    text: 'Add',
                    myFunc: () {
                      ctrl.updateAcheivements();
                    },
                  )
                  // const SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 2,
            left: 2,
            child: MyButton(
              text: 'Next',
              myFunc: () async {
                ctrl.printAllData();
                var file = await ctrl.generateCenteredText('Usman Mehsud');
                ctrl.openFile(file);
              },
            ),
          ),
        ],
      ),
    );
  }
}
