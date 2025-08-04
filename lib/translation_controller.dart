import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationController extends GetxController {
  void changeLanguage(var param1, var param2) {
    var local = Locale(param1, param2);
    Get.updateLocale(local);
  }

  var language = false;
  updateLanguage({required String lan}) {
    update();
    if (lan == 'hindi') {
      changeLanguage('hi', 'IN');
      update();
    } else if (lan == 'telugu') {
      changeLanguage('te', 'IN');
      update();
    } else {
      changeLanguage('en', 'US');
      update();
    }
  }
}
