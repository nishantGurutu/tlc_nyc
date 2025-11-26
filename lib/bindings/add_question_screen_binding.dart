import 'package:get/get.dart';
import 'package:tlc_nyc/controller/add_question_controller.dart';

class AddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddQuestionController());
  }
}
