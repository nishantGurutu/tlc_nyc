import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/constant/image_constant.dart';
import 'package:tlc_nyc/controller/login_controller.dart';
import 'package:tlc_nyc/routes/app_pages.dart';
import 'package:tlc_nyc/utils/custom_button.dart';
import 'package:tlc_nyc/utils/custom_text_field.dart';
import 'package:tlc_nyc/view/screens/authenticated/dash_board_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController loginController = Get.find<LoginController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Platform.isWindows || Platform.isMacOS || Platform.isLinux;

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
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          child: Form(
            key: _key,
            child:
                isDesktop
                    ? Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Image.asset(
                              appLogo,
                              height: 200.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 400.h,
                            width: 400.w,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 30.h,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 50.h,
                                    width: 300.w,
                                    child: TextField(
                                      obscureText: true,
                                      cursorHeight: 20.h,
                                      style: TextStyle(fontSize: 14.sp),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 8.h,
                                          horizontal: 5.w,
                                        ),
                                        label: Text('Enter your mobile number'),
                                        labelStyle: TextStyle(
                                          fontSize: 4.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        hintStyle: TextStyle(fontSize: 8.sp),
                                        border: OutlineInputBorder(),
                                        isCollapsed: true,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  SizedBox(
                                    height: 50.h,
                                    width: 300.w,
                                    child: TextField(
                                      obscureText: true,
                                      cursorHeight: 20.h,
                                      style: TextStyle(fontSize: 14.sp),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 8.h,
                                          horizontal: 5.w,
                                        ),
                                        label: Text('Enter your password'),
                                        labelStyle: TextStyle(
                                          fontSize: 4.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        hintStyle: TextStyle(fontSize: 8.sp),
                                        border: OutlineInputBorder(),
                                        isCollapsed: true,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  GestureDetector(
                                    onTap: () {
                                      Get.offAll(() => DashBoardScreen());
                                    },
                                    child: Container(
                                      height: 50.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.r),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 6.sp,
                                            fontWeight: FontWeight.w500,
                                            color: whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 500.h,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
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
                                  controller: emailController,
                                  textCapitalization: TextCapitalization.none,
                                  keyboardType: TextInputType.number,
                                  data: "email",
                                  hintText: "enterEmail".tr,
                                ),
                                SizedBox(height: 15.h),
                                TaskCustomTextField(
                                  controller: passwordController,
                                  textCapitalization: TextCapitalization.none,
                                  keyboardType: TextInputType.number,
                                  data: "password",
                                  hintText: "enterPassword".tr,
                                ),
                                SizedBox(height: 15.h),
                                CustomButton(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  onPressed: () {
                                    if (_key.currentState!.validate()) {
                                      loginController.login(
                                        email: emailController.text.trim(),
                                        password: passwordController.text,
                                      );
                                      // Get.toNamed(Routes.BOTTOMBAR);
                                    }
                                  },
                                  color: primary,
                                  text: Text(
                                    'login'.tr,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: whiteColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 35.h,
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "dontHaveAccount".tr,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: blackColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.SIGNUP);
                                      },
                                      child: Text(
                                        "signup".tr,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: blackColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
