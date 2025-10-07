import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/view/screens/authenticated/dash_board_screen.dart';
import 'package:tlc_nyc/view/screens/unauthentication/setting_screen%20.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  RxInt _selectedIndex = 0.obs;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    DashBoardScreen(),
    Text('Index 1: Business', style: optionStyle),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _widgetOptions.elementAt(_selectedIndex.value),
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
          currentIndex: _selectedIndex.value,
          selectedItemColor: primary,
          onTap: _onItemTapped,
        );
      }),
    );
  }
}
