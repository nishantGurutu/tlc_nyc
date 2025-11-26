import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/controller/add_question_controller.dart';
import 'package:tlc_nyc/view/screens/authenticated/test_result_screen.dart';

class TestScreen extends StatefulWidget {
  final String testType = Get.arguments['testNumber'];
  final int testTypeId = Get.arguments['testTypeId'];
  TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final AddQuestionController controller = Get.find<AddQuestionController>();
  @override
  initState() {
    controller.questionAnswerListApi(widget.testTypeId);
    super.initState();
  }

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
        title: Text(
          widget.testType,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primary,
      ),
      backgroundColor: background,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoadingQuestion.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.questionAnswerList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.quiz_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No Questions Available',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This test type "${widget.testType}" does not have any questions yet.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            );
          }
          final currentIndex = controller.currentQuestionIndex.value;
          final questionData = controller.questionAnswerList[currentIndex];
          final isAnswerRevealed =
              controller.revealedAnswers[currentIndex] ?? false;
          return Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Q${controller.currentQuestionIndex.value + 1}. ${questionData.questionMast?.questioNNAME ?? ''}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                SizedBox(height: 20.h),
                ...(questionData.answers ?? []).asMap().entries.map((entry) {
                  final answerIndex = entry.key;
                  final answer = entry.value;
                  final selectedAnswer = controller.selectedAnswers[currentIndex];
                  final bool isSelected = selectedAnswer == answerIndex;
                  final bool isCorrectAnswer = answer.isCorrect == true;
                  Color borderColor = isSelected ? primary : lightBorderColor;
                  IconData? icon;
                  Color iconColor = Colors.transparent;

                  if (isAnswerRevealed) {
                    if (isCorrectAnswer) {
                      borderColor = Colors.green;
                      icon = Icons.check_circle;
                      iconColor = Colors.green;
                    } else if (isSelected) {
                      borderColor = Colors.red;
                      icon = Icons.cancel;
                      iconColor = Colors.red;
                    }
                  }

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: GestureDetector(
                      onTap: () {
                        controller.selectOption(
                          controller.currentQuestionIndex.value,
                          answerIndex,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 10.w,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${String.fromCharCode(65 + answerIndex)}.',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: blackColor,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  answer.answerName ?? '',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              if (isAnswerRevealed && icon != null) ...[
                                SizedBox(width: 8.w),
                                Icon(icon, color: iconColor, size: 20.sp),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (controller.currentQuestionIndex.value > 0)
                      GestureDetector(
                        onTap: controller.goToPreviousQuestion,
                        child: Container(
                          height: 40.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.r),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "previous".tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),

                    if (controller.currentQuestionIndex.value == 0) SizedBox(),
                    GestureDetector(
                      onTap: () {
                        final currentIndex =
                            controller.currentQuestionIndex.value;
                        final hasRevealed =
                            controller.revealedAnswers[currentIndex] ?? false;
                        final isLastQuestion = currentIndex ==
                            controller.questionAnswerList.length - 1;

                        if (!hasRevealed) {
                          final hasSelection = controller
                              .selectedAnswers
                              .containsKey(currentIndex);

                          if (!hasSelection) {
                            Get.snackbar(
                              'Please select an answer',
                              'Pick an option before continuing.',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            return;
                          }

                          controller.revealAnswer(currentIndex);
                          return;
                        }

                        if (isLastQuestion) {
                          confirmDialog(context, widget.testType);
                        } else {
                          controller.goToNextQuestion();
                        }
                      },
                      child: Container(
                        height: 40.h,
                        width: 130.w,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.all(Radius.circular(30.r)),
                        ),
                        child: Center(
                          child: Text(
                            controller.currentQuestionIndex.value ==
                                    controller.questionAnswerList.length - 1
                                ? "submit".tr
                                : "next".tr,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Future<void> confirmDialog(BuildContext context, String testNumber) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext builderContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.9,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: whiteColor,
                ),
                padding: EdgeInsets.all(16.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'areYouSure'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                              Get.to(() => TestResultScreen(testNumber));
                            },
                            child: Container(
                              height: 30.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'yes'.tr,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: 30.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'no'.tr,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 10.w,
                child: InkWell(
                  onTap: () async {
                    Get.back();
                  },
                  child: Icon(Icons.close, size: 30),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
