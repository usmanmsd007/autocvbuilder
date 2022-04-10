import 'package:auto_cv_builder/mywidgets/mytxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/buildnewcvctrl.dart';
import '../../mywidgets/mybtn.dart';

class MyLanguages extends StatelessWidget {
  MyLanguages({Key? key}) : super(key: key);
  final BuildNewCvCtrl ctrl = Get.find<BuildNewCvCtrl>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text(
              'Languages',
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
                return ctrl.languageList.value.length > 0
                    ? CustomScrollView(
                        slivers: [
                          SliverGrid(
                            delegate: SliverChildBuilderDelegate((c, i) {
                              return Center(
                                child: Text(
                                  ctrl.languageList.value[i]!,
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }, childCount: ctrl.languageList.value.length),
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
                          'No Languages Yet',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
              }),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppTextField(
                    controller: ctrl.languageC.value,
                    text: 'Languages',
                    keyboardtype: TextInputType.text,
                    geticon: Icons.task,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    ctrl.updateLanguages();
                    ctrl.languageC.value.text = '';
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
            //     ctrl.updateLanguages();
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
