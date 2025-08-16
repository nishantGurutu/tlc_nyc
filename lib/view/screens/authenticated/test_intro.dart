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
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
        centerTitle: true,
        title: Text(
          'Test Introduction',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please read the instructions carefully before starting the test.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.r,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildInfoRow(Icons.list_alt_rounded, "Total MCQs", "80"),
                      Divider(),
                      _buildInfoRow(
                        Icons.access_time_rounded,
                        "Total Time",
                        "120 minutes",
                      ),
                      Divider(),
                      _buildInfoRow(
                        Icons.percent_rounded,
                        "Passing Percentage",
                        "70%",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 9.w,
                      vertical: 8.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Test Guidance",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: primary,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          """This study guide test is a simulation of the TLC Exam with a duration of 120 minutes and 80 multiple-choice questions. You need a score of 70% or higher to pass.\nWe advise all students to:\n• Read and memorize the most important points of Chapter 80 – Rules and Regulations for drivers.  • Always study the latest version from the TLC (NYC) official website, as rules and regulations change frequently.  • Note: Chapter 80 is around 60 pages, and most exam questions come from here.\nWe recommend practicing all the tests we provide. ⚠️ We do not guarantee a passing score — But if you study hard, if you practice all ours test, You will pass the Exam in the first tried.""",
                          style: TextStyle(
                            fontSize: 14.sp,
                            height: 1.4,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    icon: Icon(
                      Icons.play_arrow_rounded,
                      size: 24.sp,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Start Test",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => TestScreen(widget.testNumber));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Icon(icon, color: primary, size: 22.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: primary,
            ),
          ),
        ],
      ),
    );
  }
}
