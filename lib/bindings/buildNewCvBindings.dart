import 'package:auto_cv_builder/controllers/buildnewcvctrl.dart';
import 'package:get/get.dart';

class BuildNewCvBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BuildNewCvCtrl(), fenix: true);
  }
}
