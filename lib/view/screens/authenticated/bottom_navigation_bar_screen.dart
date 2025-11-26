import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/controller/bottombar_controller.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  BottomNavigationBarScreen({super.key});

  final BottombarController bottombarController =
      Get.find<BottombarController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => bottombarController.widgetOptions.elementAt(
          bottombarController.selectedIndex.value,
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          backgroundColor: whiteColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'.tr),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'business'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'setting'.tr,
            ),
          ],
          currentIndex: bottombarController.selectedIndex.value,
          selectedItemColor: primary,
          onTap: bottombarController.onItemTapped,
        );
      }),
    );
  }
}
