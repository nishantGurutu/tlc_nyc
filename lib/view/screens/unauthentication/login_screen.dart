import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/constant/image_constant.dart';
import 'package:tlc_nyc/utils/custom_button.dart';
import 'package:tlc_nyc/utils/custom_text_field.dart';
import 'package:tlc_nyc/view/screens/authenticated/bottom_navigation_bar_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [primary, Colors.white],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 100.h),
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 70.h),
                    Image.asset(appLogo, height: 120.h),
                    SizedBox(height: 50.h),
                    TaskCustomTextField(
                      controller: mobileController,
                      textCapitalization: TextCapitalization.sentences,
                      hintText: "enterMobileNumber".tr,
                    ),
                    SizedBox(height: 15.h),
                    CustomButton(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      onPressed: () {
                        Get.to(() => BottomNavigationBarScreen());
                      },
                      color: primary,
                      text: Text(
                        'sendOtp'.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      width: double.infinity,
                      height: 35.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
