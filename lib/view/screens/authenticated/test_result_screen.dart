import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlc_nyc/constant/color_constant.dart';

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
      backgroundColor: background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [Text('')]),
            ],
          ),
        ),
      ),
    );
  }
}
