import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/view/screens/authenticated/test_screen.dart';

class TestIntroScreen extends StatefulWidget {
  final int testNumber;
  const TestIntroScreen(this.testNumber, {super.key});

  @override
  State<TestIntroScreen> createState() => _TestIntroScreenState();
}

class _TestIntroScreenState extends State<TestIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Introduvtion',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,

        backgroundColor: primary,
      ),
      backgroundColor: background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please read given instruction\nbefore you start the test!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 15.h),
              Divider(),
              SizedBox(height: 15.h),
              Text(
                "Total MCQS: 80",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Total Time: 120 minutes",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Passing Percentage: 70%",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 15.h),
              Divider(),
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => TestScreen(widget.testNumber));
                },
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  ),
                  child: Center(
                    child: Text(
                      'START TEST',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
