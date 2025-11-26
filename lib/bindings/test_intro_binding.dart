import 'package:get/get.dart';
import 'package:tlc_nyc/controller/test_intro_controller.dart';

class TestIntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestIntroController());
  }
}
