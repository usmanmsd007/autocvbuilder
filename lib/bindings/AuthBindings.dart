import 'package:auto_cv_builder/controllers/authctrl.dart';
import 'package:get/get.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationCtrl());
  }
}
