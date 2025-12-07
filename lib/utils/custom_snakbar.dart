import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';

class CustomSnackBar {
  static void success(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      colorText: whiteColor,
    );
  }

  static void error(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: primary,
      duration: Duration(seconds: 2),
      colorText: whiteColor,
    );
  }

  static void info(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: primary,
      duration: Duration(seconds: 2),
      colorText: whiteColor,
    );
  }
}
