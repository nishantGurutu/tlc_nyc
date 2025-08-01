import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:tlc_nyc/constant/color_constant.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({super.key});
  List<String> languageList = [
    'Arabic',
    "Bangali",
    "Chinese",
    "English",
    "Russion",
    "Spanish",
    "Urdu",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Language",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SizedBox(
                      height: 25.h,
                      width: 30.w,
                      child: Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 5.h),
              Expanded(
                child: ListView.builder(
                  itemCount: languageList.length,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      child: Container(
                        height: 30.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Row(
                            children: [
                              Text(
                                languageList[index],
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
