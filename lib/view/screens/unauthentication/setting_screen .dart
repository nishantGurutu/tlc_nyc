import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/view/screens/widgets/language_bottom_sheet.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Setting',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: primary,
      ),
      backgroundColor: background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder:
                      (context) => Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: LanguageBottomSheet(),
                      ),
                );
              },
              child: Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      Text(
                        'Change Language',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 40.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Text(
                      'Privacy & Policy',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 40.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Text(
                      'Terms & Uses',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
