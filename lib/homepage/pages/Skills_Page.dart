// ignore_for_file: unused_import

import 'package:auto_cv_builder/controllers/buildnewcvctrl.dart';
import 'package:auto_cv_builder/mywidgets/mytxtfield.dart';
// import 'package:auto_cv_builder/src/Reference_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../mywidgets/mybtn.dart';

class MySkills extends StatelessWidget {
  MySkills({Key? key}) : super(key: key);
  final ctrl = Get.find<BuildNewCvCtrl>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Skills',
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
                return ctrl.skillslist.value.length > 0
                    ? CustomScrollView(
                        slivers: [
                          SliverGrid(
                            delegate: SliverChildBuilderDelegate((c, i) {
                              return Center(
                                child: Text(
                                  ctrl.skillslist.value[i]!,
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }, childCount: ctrl.skillslist.value.length),
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
                    : Center(
                        child: const Text(
                        'No Skills Yet',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ));
              }),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppTextField(
                    controller: ctrl.skillC.value,
                    text: 'Skill',
                    keyboardtype: TextInputType.text,
                    geticon: Icons.task,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    ctrl.updateSkills();
                    ctrl.skillC.value.text = '';
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
            //     ctrl.updateSkills();
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
