import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/constant/image_constant.dart';
import 'package:tlc_nyc/utils/custom_button.dart';
import 'package:tlc_nyc/utils/custom_text_field.dart';
import 'package:tlc_nyc/view/screens/unauthentication/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
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
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 500.h,
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
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.number,
                          data: "mobile number",
                          hintText: "enterMobileNumber".tr,
                        ),
                        SizedBox(height: 15.h),
                        CustomButton(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              Get.to(
                                () => OtpScreen(
                                  mobileNumber: mobileController.text,
                                ),
                              );
                            }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
