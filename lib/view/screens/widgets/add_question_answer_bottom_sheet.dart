import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/controller/add_question_controller.dart';
import 'package:tlc_nyc/utils/customTextField.dart';
import 'package:tlc_nyc/utils/custom_button.dart';
import 'package:tlc_nyc/utils/custom_text_field.dart';

class AddQuestionAnswerBottomSheet extends StatefulWidget {
  const AddQuestionAnswerBottomSheet({super.key});

  @override
  State<AddQuestionAnswerBottomSheet> createState() => _AddQuestionAnswerBottomSheetState();
}

class _AddQuestionAnswerBottomSheetState extends State<AddQuestionAnswerBottomSheet> {
  final AddQuestionController controller = Get.find<AddQuestionController>();
  final TextEditingController questionController = TextEditingController();
  final TextEditingController groupCodeController = TextEditingController();
  final TextEditingController questionTypeCodeController = TextEditingController();
  
  final List<Map<String, dynamic>> answers = [];
  final List<TextEditingController> answerControllers = [];
  final List<bool> isCorrectList = [];
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _addAnswerField();
  }

  @override
  void dispose() {
    questionController.dispose();
    groupCodeController.dispose();
    questionTypeCodeController.dispose();
    for (var controller in answerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addAnswerField() {
    setState(() {
      answerControllers.add(TextEditingController());
      isCorrectList.add(false);
    });
  }

  void _removeAnswerField(int index) {
    if (answerControllers.length > 1) {
      setState(() {
        answerControllers[index].dispose();
        answerControllers.removeAt(index);
        isCorrectList.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.68,
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
                    'Add Question with Answers',
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question Name
                        Text(
                          'Question Name',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(height: 8.h),
      
                         CustomTextField(
                          controller: questionController,
                          hintText: 'Enter question text',
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.none,
                        ),
                        
                        
                        SizedBox(height: 16.h),
                        
                        // Group Code
                        Text(
                          'Group Code',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          controller: groupCodeController,
                          hintText: 'Enter group code',
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.none,
                        ),
                        
                        SizedBox(height: 16.h),
                        
                        // Question Type Code
                        Text(
                          'Question Type Code',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          controller: questionTypeCodeController,
                          hintText: 'Enter question type code',
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.none,
                        ),
                        
                        
                        SizedBox(height: 20.h),
                        
                        // Answers Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Answers',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: _addAnswerField,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.add, color: whiteColor, size: 16.sp),
                                    SizedBox(width: 4.w),
                                    Text(
                                      'Add Answer',
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        SizedBox(height: 12.h),
                        
                        // Answer Fields
                        ...List.generate(answerControllers.length, (index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                          controller: answerControllers[index],
                          hintText: 'Enter answer ${index + 1}',
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.none,
                        ),
                        
                                   
                                ),
                                SizedBox(width: 8.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isCorrectList[index] = !isCorrectList[index];
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                      color: isCorrectList[index] ? Colors.green : Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(6.r),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: isCorrectList[index] ? whiteColor : darkGreyColor,
                                      size: 16.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                if (answerControllers.length > 1)
                                  GestureDetector(
                                    onTap: () => _removeAnswerField(index),
                                    child: Container(
                                      padding: EdgeInsets.all(8.w),
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade300,
                                        borderRadius: BorderRadius.circular(6.r),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: whiteColor,
                                        size: 16.sp,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        }),
                        
                        SizedBox(height: 20.h),
                        
                        // Submit Button
                        Obx(() => CustomButton(
                          onPressed: ()async {
                                  if (_formKey.currentState!.validate()) {
                                    // Prepare answers data
                                    final answersData = <Map<String, dynamic>>[];
                                    for (int i = 0; i < answerControllers.length; i++) {
                                      answersData.add({
                                        'name': answerControllers[i].text.trim(),
                                        'isCorrect': isCorrectList[i],
                                      });
                                    }
                                    
                                    final success = await controller.addQuestionWithAnswers(
                                      questionName: questionController.text.trim(),
                                      groupCode: int.parse(groupCodeController.text),
                                      questionTypeCode: int.parse(questionTypeCodeController.text),
                                      answers: answersData,
                                    );
                                    
                                    if (success) {
                                      Get.back();
                                      _clearForm();
                                    }
                                  }
                                },
                          color: primary,
                          text: controller.isLoading.value
                              ? CircularProgressIndicator(color: whiteColor)
                              : Text(
                                  'Add Question with Answers',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clearForm() {
    questionController.clear();
    groupCodeController.clear();
    questionTypeCodeController.clear();
    for (var controller in answerControllers) {
      controller.dispose();
    }
    answerControllers.clear();
    isCorrectList.clear();
    _addAnswerField();
  }
}
