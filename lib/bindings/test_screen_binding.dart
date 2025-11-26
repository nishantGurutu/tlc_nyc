import 'package:get/get.dart';
import 'package:tlc_nyc/controller/add_question_controller.dart';

class TestScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddQuestionController());
  }
}
