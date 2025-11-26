import 'package:get/get.dart';
import 'package:tlc_nyc/controller/bottombar_controller.dart';

class BottombarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottombarController());
  }
}
