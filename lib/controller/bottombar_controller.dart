import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/view/screens/authenticated/dash_board_screen.dart';
import 'package:tlc_nyc/view/screens/unauthentication/setting_screen%20.dart';

class BottombarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> widgetOptions = <Widget>[DashBoardScreen(), SettingScreen()];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
