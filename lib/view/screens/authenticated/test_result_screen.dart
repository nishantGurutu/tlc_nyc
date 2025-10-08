import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/constant/image_constant.dart';
import 'package:tlc_nyc/controller/test_controller.dart';

class TestResultScreen extends StatelessWidget {
  final String testNumber;
  const TestResultScreen(this.testNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    final TestController controller = Get.find<TestController>();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              color: whiteColor,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                color: whiteColor,
              ),
              child: Icon(Icons.arrow_back, color: primary),
            ),
          ),
        ),
        title: Text('testResult'.tr, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: primary,
      ),
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Center(
            child: Obx(() {
              final correctAnswers = controller.getCorrectAnswers();
              final wrongAnswers = controller.getWrongAnswers();
              final percentage = controller.getPercentage();
              final hasPassed = controller.hasPassed();
              
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(winnerImage, height: 130.h),
                      SizedBox(height: 10.h),
                      Text(
                        "${'youGot'.tr} ${percentage.toStringAsFixed(0)}%",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        hasPassed ? 'youPassed'.tr : 'youFailed'.tr,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: hasPassed ? Colors.green : Colors.red,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/correct.png',
                                height: 15.h,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                '${'correct'.tr} $correctAnswers',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 12.w),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/wrong.png',
                                height: 15.h,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                '${'incorrect'.tr} $wrongAnswers',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
