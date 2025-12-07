import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/constant/image_constant.dart';
import 'package:tlc_nyc/controller/login_controller.dart';
import 'package:tlc_nyc/routes/app_pages.dart';
import 'package:tlc_nyc/utils/bottom_sheet.dart';
import 'package:tlc_nyc/utils/custom_button.dart';
import 'package:tlc_nyc/utils/custom_text_field.dart';
import 'package:tlc_nyc/view/screens/authenticated/dash_board_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final LoginController loginController = Get.find<LoginController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  disposse() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    loginController.pickedFile.value = File('');
    loginController.selectedImagePath.value = '';
    super.dispose();
  }

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
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20.h),
                                  Stack(
                                    children: [
                                      Obx(
                                        () => Container(
                                          height: 80.h,
                                          width: 80.w,
                                          decoration: BoxDecoration(
                                            color: mildBorderColor,
                                            shape: BoxShape.circle,
                                            image:
                                                loginController
                                                            .pickedFile
                                                            .value !=
                                                        null
                                                    ? DecorationImage(
                                                      image: FileImage(
                                                        File(
                                                          loginController
                                                              .pickedFile
                                                              .value
                                                              .path,
                                                        ),
                                                      ),
                                                      fit: BoxFit.cover,
                                                    )
                                                    : null,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 7.h,
                                        right: 9.w,
                                        child: InkWell(
                                          onTap: () {
                                            BottomSheetClass()
                                                .showImagePickerSheet(context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: primary,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                4.0,
                                              ),
                                              child: Icon(
                                                Icons.camera_alt,
                                                size: 12.sp,
                                                color: whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  TaskCustomTextField(
                                    controller: nameController,
                                    textCapitalization: TextCapitalization.none,
                                    keyboardType: TextInputType.name,
                                    data: "name".tr,
                                    hintText: "enterName".tr,
                                  ),
                                  SizedBox(height: 15.h),
                                  TaskCustomTextField(
                                    controller: emailController,
                                    textCapitalization: TextCapitalization.none,
                                    keyboardType: TextInputType.emailAddress,
                                    data: "email".tr,
                                    hintText: "enterEmail".tr,
                                  ),
                                  SizedBox(height: 15.h),
                                  TaskCustomTextField(
                                    controller: mobileController,
                                    textCapitalization: TextCapitalization.none,
                                    keyboardType: TextInputType.number,
                                    data: "mobileNumber".tr,
                                    hintText: "enterMobileNumber".tr,
                                  ),
                                  SizedBox(height: 15.h),
                                  TaskCustomTextField(
                                    controller: passwordController,
                                    textCapitalization: TextCapitalization.none,
                                    keyboardType: TextInputType.emailAddress,
                                    data: "password",
                                    hintText: "enterPassword".tr,
                                  ),
                                  SizedBox(height: 15.h),
                                  Obx(
                                    () => CustomButton(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.h,
                                      ),
                                      onPressed: () {
                                        if (_key.currentState!.validate()) {
                                          loginController.register(
                                            name: nameController.text,
                                            mobile: mobileController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            imagePath:
                                                loginController
                                                    .pickedFile
                                                    .value,
                                          );
                                        }
                                      },
                                      color: primary,
                                      text:
                                          loginController.isLoading.value ==
                                                  true
                                              ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 15.h,
                                                    width: 15.w,

                                                    child:
                                                        CircularProgressIndicator(
                                                          color: whiteColor,
                                                        ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    "Loading...",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: whiteColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              )
                                              : Text(
                                                'signup'.tr,
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: whiteColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                      width: double.infinity,
                                      height: 35.h,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "alreadyHaveAccount".tr,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: blackColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      GestureDetector(
                                        onTap: () {
                                          Get.offAllNamed(Routes.LOGIN);
                                        },
                                        child: Text(
                                          "login".tr,
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
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
