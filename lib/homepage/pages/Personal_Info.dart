// ignore_for_file: unused_element, unused_import

import 'dart:io';

import 'package:auto_cv_builder/controllers/buildnewcvctrl.dart';
import 'package:auto_cv_builder/models/personalinfo.dart';
import 'package:auto_cv_builder/mywidgets/mybtn.dart';
import 'package:auto_cv_builder/mywidgets/mytxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

// File imageFile;

class PersonalData extends StatelessWidget {
  PersonalData({Key? key}) : super(key: key);
  BuildNewCvCtrl ctrl = Get.find<BuildNewCvCtrl>();
  // BuildNewCvCtrl ctrl = Get.find<BuildNewCvCtrl>();
  @override
  Widget build(BuildContext context) {
    return Obx(
        // init: Get.find<BuildNewCvCtrl>(),
        () {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Text(
                  'Personal Information',
                  style: TextStyle(
                    color: Color(0xfff7892b),
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 5),
                // image(),

                SizedBox(
                  height: 120,
                  child: InkWell(
                    onTap: () async {
                      await ctrl.imagePick();
                    },
                    child: Stack(
                      children: <Widget>[
                        ctrl.imageFilePath.value == ""
                            ? Image.asset('assets/image/profileavatar.png')
                            : CircleAvatar(
                                radius: 70,
                                backgroundImage:
                                    FileImage(File(ctrl.imageFilePath.value)),
                              ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // name(),
                MyNewTextField(
                  ctrl: ctrl.namec.value,
                  text: "Name",
                  type: TextInputType.text,
                  lines: 1,
                  icon: Icons.person_add,
                ),
                const SizedBox(height: 10),
                // fname(),
                MyNewTextField(
                  ctrl: ctrl.fnamec.value,
                  text: "Father Name",
                  type: TextInputType.text,
                  lines: 1,
                  icon: Icons.person_add,
                ),
                const SizedBox(height: 10),
                // Container(
                //   child: Row(children: [
                //     Text('20.2.2012'), Icon(Icons.calendar_today)
                //   ],),
                // ),
                Obx(
                  () => Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: const Icon(
                            Icons.calendar_today,
                            color: Colors.orange,
                          ),
                          onTap: () {
                            ctrl.chooseDate();
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          // DateFormat("dd-MM-yyyy")
                          // .parse(
                          ctrl.selectedDate.value,
                          //   .toString())
                          // .toString(),
                          style: const TextStyle(
                              fontSize: 12, color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ),
                // dob(),
                const SizedBox(height: 10),
                // contact(),
                MyNewTextField(
                  ctrl: ctrl.contactc.value,
                  text: "Contact",
                  type: TextInputType.number,
                  lines: 1,
                  icon: Icons.phone,
                ),
                const SizedBox(height: 10),
                // email(),
                MyNewTextField(
                  ctrl: ctrl.emailc.value,
                  text: "Email",
                  type: TextInputType.emailAddress,
                  lines: 1,
                  icon: Icons.email,
                ),
                const SizedBox(height: 10),
                // address(),
                MyNewTextField(
                  ctrl: ctrl.addressc.value,
                  text: "Address",
                  type: TextInputType.text,
                  lines: 5,
                  icon: Icons.home,
                ),
                const SizedBox(height: 10),

                // nextpage()

                MyButton(
                  text: 'Next',
                  myFunc: () {
                    if (ctrl.namec.value.text.isNotEmpty ||
                        ctrl.fnamec.value.text.isNotEmpty ||
                        ctrl.addressc.value.text.isNotEmpty ||
                        ctrl.emailc.value.text.isNotEmpty ||
                        ctrl.contactc.value.text.isNotEmpty) {
                      ctrl.setPersonalinfo(PersonalInfo(
                          name: ctrl.namec.value.text,
                          fatherName: ctrl.fnamec.value.text,
                          address: ctrl.addressc.value.text,
                          email: ctrl.emailc.value.text,
                          contact: ctrl.contactc.value.text,
                          dob: ctrl.selectedDate.value));
                      ctrl.updateTabController();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  // Widget name() {
  //   var controller;
  //   return AppTextField(
  //     controller: controller,
  //     text: 'Name',
  //     keyboardtype: TextInputType.text,
  //     geticon: Icons.person_add,
  //   );
  // }

  // Widget fname() {
  //   var controller;
  //   return AppTextField(
  //     controller: controller,
  //     text: 'Father Name',
  //     keyboardtype: TextInputType.text,
  //     geticon: Icons.person_add,
  //   );
  // }

  DateTime currentDate = DateTime.now();
  bool dateChanged = false;
  _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2025));
    if (pickedDate != null && pickedDate != currentDate)
      currentDate = pickedDate;
  }

  // Widget dob() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     child: ElevatedButton(
  //       child: Text(
  //         dateChanged == true
  //             ? 'Date of Birth'
  //             : "${currentDate.day} / ${currentDate.month} / ${currentDate.year}",
  //         textAlign: TextAlign.start,
  //         style: TextStyle(
  //           color: Color(0xfff79c4f),
  //           fontSize: 14,
  //         ),
  //       ),
  //       style: ElevatedButton.styleFrom(
  //         padding: EdgeInsets.only(top: 20, bottom: 20),
  //         primary: Colors.white,
  //         side: BorderSide(color: Color(0xfff79c4f), width: 1),
  //         elevation: 0,
  //       ),
  //       onPressed: () async {
  //         final DateTime picked = await showDatePicker(
  //           context: context,
  //           initialDate: currentDate,
  //           firstDate: DateTime(1970),
  //           lastDate: DateTime(2025),
  //           builder: (context, child) => Theme(
  //             data: ThemeData().copyWith(
  //               colorScheme: ColorScheme.dark(
  //                 primary: Colors.white,
  //                 surface: Color(0xfff79c4f),
  //               ),
  //               // dialogBackgroundColor: Color(0xfff79c4f)
  //             ),
  //             child: child,
  //           ),
  //         );
  //         if (picked != null && picked != currentDate)
  //           setState(() {
  //             currentDate = picked;
  //           });
  //       },
  //     ),
  //   );
  // }

  // Widget contact() {
  //   var controller;
  //   return AppTextField(
  //     controller: controller,
  //     text: 'Phone',
  //     keyboardtype: TextInputType.phone,
  //     geticon: Icons.contact_phone,
  //   );
  // }

  // Widget email() {
  //   var controller;
  //   return AppTextField(
  //     controller: controller,
  //     text: 'Email',
  //     keyboardtype: TextInputType.emailAddress,
  //     geticon: Icons.email,
  //   );
  // }

  // Widget address() {
  //   var controller;
  //   return AppTextField(
  //     lines: 5,
  //     controller: controller,
  //     text: 'Address',
  //     keyboardtype: TextInputType.text,
  //     geticon: Icons.home_filled,
  //   );
  // }

  // Widget image() {
  //   File imageFile;
  //   return Container(
  //     height: 120,
  //     child: InkWell(
  //       onTap: () async {
  //         ImagePicker picker = ImagePicker();
  //         var pickedImage = await picker.pickImage(source: ImageSource.gallery);
  //         String path = pickedImage.path;
  //         imageFile = File(path);
  //       },
  //       child: Stack(
  //         children: <Widget>[
  //           imageFile == null
  //               ? Image.asset('assets/image/profileavatar.png')
  //               : CircleAvatar(
  //                   radius: 70,
  //                   backgroundImage: FileImage(imageFile),
  //                 ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

// Widget nextpage() {
//   return Padding(
//     padding: const EdgeInsets.only(left: 300),
//     child: MyButton(
//       myFunc: () {
//         // BuildContext context;
//         // Navigator.push(
//         //     context, MaterialPageRoute(builder: (context) => MyObjective()));
//       },
//       text: 'Next',
//       width: 70,
//       textcolor: Colors.white,
//       backcolor: Color(0xfff79c4f),
//     ),
//   );
// }
class MyNewTextField extends StatelessWidget {
  MyNewTextField(
      {required this.ctrl,
      required this.icon,
      required this.type,
      required this.lines,
      required this.text,
      Key? key})
      : super(key: key);
  TextEditingController ctrl;
  int lines;
  String text;
  TextInputType type;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: ctrl,
      text: text,
      keyboardtype: type,
      geticon: icon,
      lines: lines,
    );
  }
}
