import 'package:auto_cv_builder/controllers/buildnewcvctrl.dart';
import 'package:auto_cv_builder/models/qualification.dart';
// import 'package:auto_cv_builder/models/qualification.dart';
import 'package:auto_cv_builder/mywidgets/qualbtmsht.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyQualifications extends StatelessWidget {
  MyQualifications({Key? key}) : super(key: key);
  final BuildNewCvCtrl buildNewCvCtrl = Get.find<BuildNewCvCtrl>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Text(
                  'Qualifications',
                  style: TextStyle(
                    color: Color(0xfff7892b),
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 50),
                // add(),
                // qualification()
                Container(
                  height: 380,
                  // margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xfffbb448), Color(0xfff7892b)],
                    ),
                  ),
                  child: Obx(
                      // init: Get.find<BuildNewCvCtrl>(),
                      () {
                    // buildNewCvCtrl.totalDetails!.value!.qualifications;
                    return buildNewCvCtrl.qualifications.value.isNotEmpty
                        ? CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      // width: 300,
                                      // height: 200,
                                      color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            width: 70,
                                            child: Text(
                                              'Degree/Certeficate',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              'Institute',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                            child: Text(
                                              'Marks/GPA',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                            child: Text(
                                              'Year',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SliverGrid(
                                delegate: SliverChildBuilderDelegate(
                                  (c, i) {
                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          // width: 300,
                                          height: 120,
                                          color: Colors.red,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(
                                                width: 70,
                                                child: Text(
                                                  buildNewCvCtrl.qualifications
                                                      .value[i]!.degree,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 120,
                                                child: Text(
                                                  buildNewCvCtrl.qualifications
                                                      .value[i]!.board,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 50,
                                                child: Text(
                                                  buildNewCvCtrl.qualifications
                                                      .value[i]!.marks,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 50,
                                                child: Text(
                                                  buildNewCvCtrl.qualifications
                                                      .value[i]!.year,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  buildNewCvCtrl.deleteQual(i);
                                                },
                                                child: const Icon(
                                                  Icons.delete,
                                                  size: 40,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  childCount: buildNewCvCtrl
                                      .qualifications.value.length,
                                  // ctrl.totalDetails.value.qualifications.length,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1,
                                        crossAxisCount: 1,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        // maxCrossAxisExtent: 120,
                                        mainAxisExtent: 90),
                              ),
                            ],
                          )
                        : Text('Plese add Some of your Qualifications');
                  }),
                )
              ],
            ),
          ),
        ),
        Positioned(
          child: InkWell(
              onTap: () {
                Get.bottomSheet(QualBottomSheet());
              },
              child: const CircleAvatar(child: Icon(Icons.add))),
          left: 2,
          right: 2,
          bottom: 30,
        ),
        // )
      ],
    );
  }
}
