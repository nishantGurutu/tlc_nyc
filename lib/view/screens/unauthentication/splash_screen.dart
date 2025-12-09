import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/image_constant.dart';
import 'package:tlc_nyc/helper/storage_helper.dart';
import 'package:tlc_nyc/routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    String? userId = await StorageHelper.getId();
    if (userId != null && userId.isNotEmpty) {
      Get.offAllNamed(Routes.BOTTOMBAR);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(appLogo, height: 120.h)],
        ),
      ),
    );
  }
}
