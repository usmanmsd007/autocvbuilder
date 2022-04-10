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
              height: Get.height / 2,
              child: Obx(() {
                return ctrl.acheivementsList.value.length > 0
                    ? Center(
                        child: CustomScrollView(
                          slivers: [
                            SliverGrid(
                              delegate: SliverChildBuilderDelegate((c, i) {
                                return Center(
                                  child: Text(
                                    ctrl.acheivementsList.value[i]!,
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                                  childCount:
                                      ctrl.acheivementsList.value.length),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 1,
                                      crossAxisCount: 1,
                                      crossAxisSpacing: 1,
                                      mainAxisSpacing: 3,
                                      mainAxisExtent: 40),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: const Text(
                          'No Acheivements Yet',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      );
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
                FloatingActionButton(
                  onPressed: () {
                    ctrl.updateAcheivements();
                    ctrl.acheivementsC.value.text = '';
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  focusColor: Colors.orange,
                  backgroundColor: Colors.orange,
                )
              ],
            ),
            // MyButton(
            //   text: 'Add',
            //   myFunc: () {
            //     ctrl.updateAcheivements();
            //   },
            // )
            // const SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
    );
  }
}
