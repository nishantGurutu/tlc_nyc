import 'package:get/get.dart';
import 'package:tlc_nyc/model/test_type_model.dart';
import 'package:tlc_nyc/routes/app_pages.dart';
import 'package:tlc_nyc/service/home_service.dart';

class HomeController extends GetxController {
  void onTestSelected({required String testType, required int testTypeId}) {
    Get.toNamed(
      Routes.TESTINTRO,
      arguments: {'testNumber': testType, 'testTypeId': testTypeId},
    );
  }

  RxList<QuestionTypeListModel> groupListData = <QuestionTypeListModel>[].obs;
  var isGroupLoading = false.obs;
  var indexOneSelected = true.obs;
  var indexTwoSelected = true.obs;
  Future<void> questionTypeListApi() async {
    isGroupLoading.value = true;

    try {
      final result = await HomeService().questionTypeList();
      if (result != null) {
        groupListData.assignAll(result);
      }
      print('API response: ${groupListData.length} items loaded');
    } catch (e) {
      print('Error fetching or caching data: $e');
    } finally {
      isGroupLoading.value = false;
    }
  }
}
