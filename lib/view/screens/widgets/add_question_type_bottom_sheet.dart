import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/controller/add_question_controller.dart';
import 'package:tlc_nyc/utils/bottom_sheet.dart';
import 'package:tlc_nyc/utils/customTextField.dart';
import 'package:tlc_nyc/utils/custom_button.dart';

class AddQuestionTypeBottomSheet extends StatefulWidget {
  const AddQuestionTypeBottomSheet({super.key});

  @override
  State<AddQuestionTypeBottomSheet> createState() =>
      _AddQuestionTypeBottomSheetState();
}

class _AddQuestionTypeBottomSheetState
    extends State<AddQuestionTypeBottomSheet> {
  final AddQuestionController controller = Get.find<AddQuestionController>();
  final TextEditingController questionTypeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    questionTypeController.clear();
    controller.pickedFile.value = File('');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Question Type',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.close, size: 24.sp, color: darkGreyColor),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question Type Name',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: questionTypeController,
                        hintText: 'Enter question type name',
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'Select Image',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      InkWell(
                        onTap: () {
                          BottomSheetClass().showImagePickerSheet(
                            context,
                            "question_type",
                          );
                        },
                        child: Obx(
                          () => Container(
                            height: 50.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: mildBorderColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.r),
                              ),
                              image:
                                  controller.pickedFile.value != null
                                      ? DecorationImage(
                                        image: FileImage(
                                          File(
                                            controller.pickedFile.value.path,
                                          ),
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                      : null,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Obx(
                        () => CustomButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.addQuestionType(
                                questionTypeController.text.trim(),
                                controller.pickedFile.value,
                              );
                            }
                          },
                          color: primary,
                          text:
                              controller.isLoading.value
                                  ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 15.h,
                                        width: 15.w,

                                        child: CircularProgressIndicator(
                                          color: whiteColor,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Loading...",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: whiteColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                                  : Text(
                                    'Add Question Type',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: whiteColor,
                                    ),
                                  ),
                          width: double.infinity,
                          height: 50.h,
                        ),
                      ),
                    ],
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
