// ignore_for_file: unused_import

import 'package:auto_cv_builder/controllers/buildnewcvctrl.dart';
import 'package:auto_cv_builder/mywidgets/mybtn.dart';
import 'package:auto_cv_builder/mywidgets/mytxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Widget> references = [ReferenceTab()];

class MyReference extends StatelessWidget {
  MyReference({Key? key}) : super(key: key);

  BuildNewCvCtrl ctrl = Get.find<BuildNewCvCtrl>();
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Column(
          children: <Widget>[
            Container(
              child: Text(
                'Reference',
                style: TextStyle(
                  color: Color(0xfff7892b),
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 50),
            check(),
            Container(
              height: 300,
              child: ListView.builder(
                  itemCount: references.length,
                  itemBuilder: (context, index) {
                    return references[index];
                  }),
            ),
            Add(),
            Positioned(
                child: MyButton(
              text: "Add Reference",
              myFunc: () {
                ctrl.updateAcheivements();
              },
            )),
          ],
        ),
      ]),
    );
  }

  Widget check() {
    return Container(
      alignment: Alignment.topRight,
      child: Checkbox(
        activeColor: Color(0xfff7892b),
        side: BorderSide(color: Color(0xfff7892b)),
        value: this.value,
        onChanged: (bool? value) {},
      ),
    );
  }
}

// Widget reference() {
//   var controller;
//   return AppTextField(
//     controller: controller,
//     text: 'Reference',
//     keyboardtype: TextInputType.text,
//     geticon: Icons.family_restroom_sharp,
//   );
// }

class ReferenceTab extends StatelessWidget {
  const ReferenceTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller;
    // TextEditingController c = TextEditingController();
    return AppTextField(
      controller: controller,
      text: 'Reference',
      keyboardtype: TextInputType.text,
      geticon: Icons.family_restroom_sharp,
    );
  }
}

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () {
          setState(() {
            references.add(ReferenceTab());
          });
        },
        icon: const Icon(
          Icons.add,
          color: Color(0xfff7892b),
        ),
      ),
    );
  }
}

Widget add() {
  return Container(
    alignment: Alignment.topRight,
    child: IconButton(
      onPressed: () => references.add(ReferenceTab()),
      icon: const Icon(
        Icons.add,
        color: Color(0xfff7892b),
      ),
    ),
  );
}
