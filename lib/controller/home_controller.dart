import 'package:get/get.dart';

class HomeController extends GetxController {
  void onTestSelected(int testNumber) {
    // Navigate to Test Screen or Quiz Screen with testNumber
    print("Selected Test $testNumber");
    // TODO: Implement Get.to(QuizScreen(testNumber))
  }
}
