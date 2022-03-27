import 'package:auto_cv_builder/bindings/buildNewCvBindings.dart';
import 'package:auto_cv_builder/homepage/HomePage.dart';
import 'package:auto_cv_builder/homepage/New.dart';
import 'package:auto_cv_builder/publicvars/public.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'authscreen/LoginPage.dart';
import 'authscreen/Registerpage.dart';
import 'authscreen/WelcomePage.dart';
import 'bindings/AuthBindings.dart';
import 'controllers/authctrl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await firebaseInitialization.then((value) {
    Get.put(AuthenticationCtrl());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      getPages: [
        // GetPage(name: '/homescreen', page: () => Homepage()),
        GetPage(
          name: '/welcome',
          page: () => WelcomePage(),
          // binding: AuthBindings(),
        ),
        GetPage(
          name: NEWCV,
          page: () => NewCV(),
          binding: BuildNewCvBindings(),
        ),

        // GetPage(
        //   name: LETTER,
        //   page: () => (),
        //   binding: AuthBindings(),
        // ),
        // GetPage(
        //   name: LETTER,
        //   page: () => (),
        //   binding: AuthBindings(),
        // ),

        GetPage(
          name: '/signin',
          page: () => LoginPage(),
          binding: AuthBindings(),
        ),
        GetPage(
          name: '/signup',
          page: () => RegisterPage(),
          binding: AuthBindings(),
        ),
      ],
      title: 'Auto cv Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ),
      ),
      // WelcomePage(),
    );
  }
}
