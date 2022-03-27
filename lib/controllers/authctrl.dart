import 'package:auto_cv_builder/authscreen/WelcomePage.dart';
import 'package:auto_cv_builder/homepage/HomePage.dart';
import 'package:auto_cv_builder/publicvars/public.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationCtrl extends GetxController {
  late Rx<User?> firebaseUser;

  // late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(auth!.currentUser);

    firebaseUser.bindStream(auth!.userChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const WelcomePage());
    } else {
      uid = auth!.currentUser!.uid;

      print('user is logged in and it will prompt to homepage soon inshallah');
      Get.offAll(() => Homepage());
    }
  }

  // _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
  //   print(googleSignInAccount);
  //   if (googleSignInAccount == null) {
  //     // if the user is not found then the user is navigated to the Register Screen
  //     Get.offAll(() => const Register());
  //   } else {
  //     // if the user exists and logged in the the user is navigated to the Home Screen
  //     Get.offAll(() => Home());
  //   }
  // }

  void signInWithEmailandPassword(String email, String password) async {
    try {
      await auth!.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
      Get.snackbar('error', e.toString());
    }
  }

  void signUpWithEmailandPassword(String email, String password) async {
    try {
      await auth!
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }
}
