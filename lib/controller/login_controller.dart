import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<bool> login(String mobile, String password) async {
    isLoading.value = true;
    try {
      await Future.delayed(Duration(seconds: 2));
      if (mobile.isNotEmpty && password.isNotEmpty) {
        Get.snackbar(
          'Success',
          'Login successful!',
          snackPosition: SnackPosition.BOTTOM,
        );
        return true;
      } else {
        Get.snackbar(
          'Error',
          'Please enter valid credentials',
          snackPosition: SnackPosition.BOTTOM,
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Login failed: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
