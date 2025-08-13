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
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 180.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/test_intro.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Please read the instructions carefully before starting the test.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: blackColor,
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
            Spacer(),

            // 📌 Start Button
            SizedBox(
              width: double.infinity,
              height: 50.h,
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
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
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
