import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/controller/add_question_controller.dart';
import 'package:tlc_nyc/utils/customTextField.dart';
import 'package:tlc_nyc/utils/custom_button.dart';

class AddQuestionAnswerBottomSheet extends StatefulWidget {
  const AddQuestionAnswerBottomSheet({super.key});

  @override
  State<AddQuestionAnswerBottomSheet> createState() => _AddQuestionAnswerBottomSheetState();
}

class _AddQuestionAnswerBottomSheetState extends State<AddQuestionAnswerBottomSheet> {
  final AddQuestionController controller = Get.find<AddQuestionController>();
  final TextEditingController questionController = TextEditingController();
  final TextEditingController groupCodeController = TextEditingController();
  
  final List<Map<String, dynamic>> answers = [];
  final List<TextEditingController> answerControllers = [];
  final List<bool> isCorrectList = [];
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedQuestionType;
  int? selectedQuestionTypeCode;

  @override
  void initState() {
    super.initState();
    _addAnswerField();
    // Set the first answer as correct by default
    if (isCorrectList.isNotEmpty) {
      isCorrectList[0] = true;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.homeController.questionTypeListApi();
    });
  }

  @override
  void dispose() {
    questionController.dispose();
    groupCodeController.dispose();
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
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                           'Question Type',
                           style: TextStyle(
                             fontSize: 14.sp,
                             fontWeight: FontWeight.w500,
                             color: blackColor,
                           ),
                         ),
                         SizedBox(height: 8.h),
                         Container(
                           decoration: BoxDecoration(
                             border: Border.all(color: lightBorderColor),
                             borderRadius: BorderRadius.circular(10.r),
                           ),
                           child: Obx(() {
                             if (controller.homeController.isGroupLoading.value) {
                               return Padding(
                                 padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                                 child: Row(
                                   children: [
                                     SizedBox(
                                       width: 16.w,
                                       height: 16.h,
                                       child: CircularProgressIndicator(
                                         strokeWidth: 2,
                                         color: primary,
                                       ),
                                     ),
                                     SizedBox(width: 8.w),
                                     Text(
                                       'Loading question types...',
                                       style: TextStyle(
                                         color: Colors.grey.shade600,
                                         fontSize: 14.sp,
                                       ),
                                     ),
                                   ],
                                 ),
                               );
                             }
                             return DropdownButtonHideUnderline(
                               child: DropdownButton<String>(
                                 value: selectedQuestionType,
                                 hint: Padding(
                                   padding: EdgeInsets.symmetric(horizontal: 12.w),
                                   child: Text(
                                     'Select Question Type',
                                     style: TextStyle(
                                       color: Colors.grey.shade600,
                                       fontSize: 14.sp,
                                     ),
                                   ),
                                 ),
                                 isExpanded: true,
                                 dropdownColor: whiteColor,
                                 items: controller.homeController.groupListData.map((item) {
                                   return DropdownMenuItem<String>(
                                     value: item.qtypENAME,
                                     child: Padding(
                                       padding: EdgeInsets.symmetric(horizontal: 12.w),
                                       child: Text(
                                         item.qtypENAME ?? '',
                                         style: TextStyle(
                                           fontSize: 14.sp,
                                           color: blackColor,
                                         ),
                                       ),
                                     ),
                                   );
                                 }).toList(),
                                 onChanged: (String? newValue) {
                                   setState(() {
                                     selectedQuestionType = newValue;
                                     final selectedItem = controller.homeController.groupListData.firstWhere(
                                       (item) => item.qtypENAME == newValue,
                                     );
                                     selectedQuestionTypeCode = selectedItem.qtypECODE;
                                   });
                                 },
                               ),
                             );
                           }),
                         ),
                        SizedBox(height: 16.h),
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
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        SizedBox(height: 16.h),
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
                        ...List.generate(answerControllers.length, (index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                          controller: answerControllers[index],
                          hintText: 'Enter answer ${index + 1}',
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        
                                   
                                ),
                                SizedBox(width: 8.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // First, set all answers to false
                                      for (int i = 0; i < isCorrectList.length; i++) {
                                        isCorrectList[i] = false;
                                      }
                                      // Then set only the selected answer to true
                                      isCorrectList[index] = true;
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
                         Obx(() => CustomButton(
                           onPressed: ()async {
                                   if (_formKey.currentState!.validate()) {
                                     if (selectedQuestionTypeCode == null) {
                                       Get.snackbar(
                                         'Error',
                                         'Please select a question type',
                                         snackPosition: SnackPosition.BOTTOM,
                                       );
                                       return;
                                     }
                                     final answersData = <Map<String, dynamic>>[];
                                     for (int i = 0; i < answerControllers.length; i++) {
                                       answersData.add({
                                         'name': answerControllers[i].text.trim(),
                                         'isCorrect': isCorrectList[i],
                                       });
                                     }
                                     
                                     final success = await controller.addQuestionWithAnswers(
                                       questionName: questionController.text.trim(),
                                       
                                       questionTypeCode: selectedQuestionTypeCode!,
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
                                  'Add Question with answers',
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
    setState(() {
      selectedQuestionType = null;
      selectedQuestionTypeCode = null;
    });
    for (var controller in answerControllers) {
      controller.dispose();
    }
    answerControllers.clear();
    isCorrectList.clear();
    _addAnswerField();
    // Set the first answer as correct by default
    if (isCorrectList.isNotEmpty) {
      isCorrectList[0] = true;
    }
  }
}
