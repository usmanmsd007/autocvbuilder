// ignore_for_file: unused_import

import 'package:auto_cv_builder/controllers/buildnewcvctrl.dart';
import 'package:auto_cv_builder/mywidgets/mybtn.dart';
import 'package:auto_cv_builder/mywidgets/mytxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyReference extends StatelessWidget {
  MyReference({Key? key}) : super(key: key);

  BuildNewCvCtrl ctrl = Get.find<BuildNewCvCtrl>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text(
              'References',
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
                return ctrl.referenceList.value.length > 0
                    ? CustomScrollView(
                        slivers: [
                          SliverGrid(
                            delegate: SliverChildBuilderDelegate((c, i) {
                              return Center(
                                child: Text(
                                  ctrl.referenceList.value[i]!,
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }, childCount: ctrl.referenceList.value.length),
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
                          'No Reference Yet',
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
                    controller: ctrl.referenceC.value,
                    text: 'Reference',
                    keyboardtype: TextInputType.text,
                    geticon: Icons.task,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    ctrl.updateReference();
                    ctrl.referenceC.value.text = '';
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

            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: () {
                  ctrl.printAllData();
                  Get.defaultDialog(
                    title: 'Please enter a name for your CV',
                    content: Column(
                      children: [
                        TextFormField(
                          controller: ctrl.filenameCtrl.value,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              ctrl.openFile(ctrl.filenameCtrl.value.text);
                            },
                            child: Text('Save'))
                      ],
                    ),
                  );

                  // Get.dialog(Container(
                  //   child: Column(children: [
                  //     Text(
                  //       'Please enter a name for your CV',
                  //     ),
                  //     TextFormField(
                  //       controller: ctrl.filenameCtrl.value,
                  //     ),
                  //     ElevatedButton(
                  //         onPressed: () {
                  //           ctrl.openFile(ctrl.filenameCtrl.value.text);
                  //         },
                  //         child: Text('Save'))
                  //   ]),
                  // ));
                },
                child: Text(
                  'CREATE CV',
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
