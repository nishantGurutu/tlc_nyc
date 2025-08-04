import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TaskCustomTextField(
                  controller: mobileController,
                  textCapitalization: TextCapitalization.sentences,
                  hintText: "enterMobileNumber".tr,
                ),

                SizedBox(height: 15.h),
                CustomButton(
                  onPressed: () {
                    Get.to(() => BottomNavigationBarScreen());
                  },
                  color: primary,
                  text: Text(
                    'sendOtp'.tr,
                    style: TextStyle(
                      fontSize: 13.sp,
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
    );
  }
}
