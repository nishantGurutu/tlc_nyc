import 'package:get/get.dart';
import 'package:tlc_nyc/view/screens/authenticated/test_intro.dart';

class HomeController extends GetxController {
  void onTestSelected(int testNumber) {
    Get.to(() => TestIntroScreen(testNumber));
  }
}
