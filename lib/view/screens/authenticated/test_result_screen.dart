import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/constant/image_constant.dart';

class TestResultScreen extends StatelessWidget {
  final int testNumber;
  const TestResultScreen(this.testNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Result', style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: primary,
      ),
      backgroundColor: whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(winnerImage, height: 130.h),
                  SizedBox(height: 10.h),
                  Text(
                    "You got 75%",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "You passed the test.",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
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
                            'Correct 75',
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
                          Image.asset('assets/images/wrong.png', height: 15.h),
                          SizedBox(width: 5.w),
                          Text(
                            'Incorrect 5',
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
          ),
        ),
      ),
    );
  }
}
