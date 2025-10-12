import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/controller/add_question_controller.dart';
import 'package:tlc_nyc/utils/customTextField.dart';
import 'package:tlc_nyc/utils/custom_button.dart';

class AddQuestionTypeBottomSheet extends StatefulWidget {
  const AddQuestionTypeBottomSheet({super.key});

  @override
  State<AddQuestionTypeBottomSheet> createState() => _AddQuestionTypeBottomSheetState();
}

class _AddQuestionTypeBottomSheetState extends State<AddQuestionTypeBottomSheet> {
  final AddQuestionController controller = Get.find<AddQuestionController>();
  final TextEditingController questionTypeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    questionTypeController.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      final success = await controller.addQuestionType(
        questionTypeController.text.trim(),
      );
      if (success) {
        Get.back();
        questionTypeController.clear();
      }
    }
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
              // Header
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
                    child: Icon(
                      Icons.close,
                      size: 24.sp,
                      color: darkGreyColor,
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 20.h),
              
              // Form
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
                      
                      
                      SizedBox(height: 20.h),
                      
                      Text(
                        'Note: qtypE_CODE will be set to 0 and isactive will be set to true automatically.',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: darkGreyColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      
                      Spacer(),
                      
                      // Submit Button
                      Obx(() => CustomButton(
                        onPressed: _handleSubmit,
                        color: primary,
                        text: controller.isLoading.value
                            ? CircularProgressIndicator(color: whiteColor)
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
                      )),
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
