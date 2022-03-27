import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTitle extends StatelessWidget {
  const MyTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Auto ',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: 37,
            fontWeight: FontWeight.w800,
            // color: Colors.white,
          ),
          children: const [
            TextSpan(
              text: 'CV',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 37),
            ),
            TextSpan(
              text: ' Builder',
              style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 37),
            ),
          ]),
    );
  }
}
