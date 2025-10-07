import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({super.key});
  
  // Language list with proper mapping
  final List<Map<String, String>> languageList = [
    {'name': 'English', 'code': 'en_US'},
    {'name': 'Arabic', 'code': 'ar_SA'},
    {'name': 'Bengali', 'code': 'bn_BD'},
    {'name': 'Chinese', 'code': 'zh_CN'},
    {'name': 'Russian', 'code': 'ru_RU'},
    {'name': 'Spanish', 'code': 'es_ES'},
    {'name': 'Urdu', 'code': 'ur_PK'},
  ];

  void _changeLanguage(String languageCode) {
    // Split the language code (e.g., 'en_US' -> 'en', 'US')
    final parts = languageCode.split('_');
    final locale = Locale(parts[0], parts[1]);
    Get.updateLocale(locale);
    Get.back(); // Close the bottom sheet
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340.h,
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
                    "selectLanguage".tr,
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
              Expanded(
                child: ListView.builder(
                  itemCount: languageList.length,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      child: GestureDetector(
                        onTap: () {
                          _changeLanguage(languageList[index]['code']!);
                        },
                        child: Container(
                          height: 30.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              children: [
                                Text(
                                  languageList[index]['name']!,
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
