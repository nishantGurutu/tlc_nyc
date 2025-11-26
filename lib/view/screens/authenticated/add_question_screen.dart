import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/controller/add_question_controller.dart';
import 'package:tlc_nyc/view/screens/widgets/add_question_type_bottom_sheet.dart';
import 'package:tlc_nyc/view/screens/widgets/add_question_answer_bottom_sheet.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  final AddQuestionController controller = Get.put(AddQuestionController());

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: primary,
        title: Text(
          'addQuestion'.tr,
          style: TextStyle(color: whiteColor, fontSize: 16.sp),
        ),
      ),
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Select Option',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),

              // Add Question Type Option
              GestureDetector(
                onTap: () {
                  _showAddQuestionTypeBottomSheet(context);
                },
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8.r,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.category, size: 40.sp, color: primary),
                        SizedBox(height: 8.h),
                        Text(
                          'Add Question Type',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Create new question categories',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: darkGreyColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Add Question Answer Option
              GestureDetector(
                onTap: () {
                  _showAddQuestionAnswerBottomSheet(context);
                },
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8.r,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.quiz, size: 40.sp, color: primary),
                        SizedBox(height: 8.h),
                        Text(
                          'Add Question Answer',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Create questions with multiple answers',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: darkGreyColor,
                          ),
                          textAlign: TextAlign.center,
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
    );
  }

  void _showAddQuestionTypeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddQuestionTypeBottomSheet(),
    );
  }

  void _showAddQuestionAnswerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddQuestionAnswerBottomSheet(),
    );
  }
}
