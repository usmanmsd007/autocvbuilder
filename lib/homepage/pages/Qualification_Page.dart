import 'package:auto_cv_builder/controllers/buildnewcvctrl.dart';
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
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: Get.height / 1.6,
                  width: Get.width / 1.1,
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
                  child: Obx(() {
                    return buildNewCvCtrl.qualList.value.isNotEmpty
                        ? CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                child: Center(
                                  child: Container(
                                    width: Get.width / 1.1,
                                    color: Colors.red,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: Get.width / 5,
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
                                            width: Get.width / 5,
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
                                            width: Get.width / 6,
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
                                            width: Get.width / 6,
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
                              // SizedBox(
                              //   height: 4,
                              // ),
                              SliverToBoxAdapter(
                                child: SizedBox(height: 5),
                              ),
                              SliverGrid(
                                delegate: SliverChildBuilderDelegate(
                                  (c, i) {
                                    return Center(
                                      child: Container(
                                        width: Get.width / 1.1,
                                        height: 120,
                                        color: Colors.red,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.center,
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.stretch,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(
                                                width: Get.width / 5,
                                                child: Text(
                                                  buildNewCvCtrl.qualList
                                                      .value[i]!.degree,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              SizedBox(
                                                width: Get.width / 5,
                                                child: Text(
                                                  buildNewCvCtrl
                                                      .qualList.value[i]!.board,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              SizedBox(
                                                width: Get.width / 6,
                                                child: Text(
                                                  buildNewCvCtrl
                                                      .qualList.value[i]!.marks,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              SizedBox(
                                                width: Get.width / 6,
                                                child: Text(
                                                  buildNewCvCtrl
                                                      .qualList.value[i]!.year,
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
                                  childCount:
                                      buildNewCvCtrl.qualList.value.length,
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
                        : Center(
                            child: Text(
                              'Plese add Some of your Qualifications',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          );
                  }),
                )
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
                onTap: () {
                  Get.bottomSheet(QualBottomSheet());
                },
                child: const CircleAvatar(
                  child: Icon(Icons.add),
                  backgroundColor: Colors.white,
                )),
          ),
          bottom: 30,
        ),
      ],
    );
  }
}
