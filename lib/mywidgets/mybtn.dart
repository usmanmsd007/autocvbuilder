// ignore_for_file: unused_import, must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {Key? key,
      required this.myFunc,
      this.text = '',
      this.width,
      this.textcolor,
      this.backcolor})
      : super(key: key);

  Function myFunc;
  String text;
  double? width;
  Color? textcolor;
  Color? backcolor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => myFunc(),
        child: Row(
          children: [
            Container(
              width: 250,
              padding: EdgeInsets.symmetric(vertical: 13),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Color(0xfff79c4f), width: 2),
                  color: backcolor),
              child: Text(
                text,
                style: TextStyle(fontSize: 20, color: textcolor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
