import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/controller/add_question_controller.dart';
import 'package:tlc_nyc/view/screens/widgets/add_question_type_bottom_sheet.dart';
import 'package:tlc_nyc/view/screens/widgets/add_question_answer_bottom_sheet.dart';

class WindowsAddQuestionScreen extends StatefulWidget {
  const WindowsAddQuestionScreen({super.key});

  @override
  State<WindowsAddQuestionScreen> createState() =>
      _WindowsAddQuestionScreenState();
}

class _WindowsAddQuestionScreenState extends State<WindowsAddQuestionScreen> {
  final AddQuestionController controller = Get.put(AddQuestionController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.add_circle, color: primary, size: 28.sp),
                    SizedBox(width: 12.w),
                    Text(
                      "Add Questions",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  "Create and manage questions for your tests",
                  style: TextStyle(fontSize: 16.sp, color: darkGreyColor),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          // Options Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 1.2,
              children: [
                _buildOptionCard(
                  "Add Question Type",
                  "Create new question categories",
                  Icons.category,
                  primary,
                  () => _showAddQuestionTypeDialog(),
                ),
                _buildOptionCard(
                  "Add Question & Answer",
                  "Create questions with multiple answers",
                  Icons.quiz,
                  Colors.green,
                  () => _showAddQuestionAnswerDialog(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(icon, size: 32.sp, color: color),
                ),
                SizedBox(height: 16.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  description,
                  style: TextStyle(fontSize: 14.sp, color: darkGreyColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddQuestionTypeDialog() {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Container(
              width: 500.w,
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.category, color: primary, size: 24.sp),
                      SizedBox(width: 12.w),
                      Text(
                        "Add Question Type",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  AddQuestionTypeBottomSheet(),
                ],
              ),
            ),
          ),
    );
  }

  void _showAddQuestionAnswerDialog() {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Container(
              width: 600.w,
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.quiz, color: Colors.green, size: 24.sp),
                      SizedBox(width: 12.w),
                      Text(
                        "Add Question & Answer",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  AddQuestionAnswerBottomSheet(),
                ],
              ),
            ),
          ),
    );
  }
}

class WindowsTestScreen extends StatefulWidget {
  final String testName;
  final String testTypeId;

  const WindowsTestScreen({
    super.key,
    required this.testName,
    required this.testTypeId,
  });

  @override
  State<WindowsTestScreen> createState() => _WindowsTestScreenState();
}

class _WindowsTestScreenState extends State<WindowsTestScreen> {
  final AddQuestionController controller = Get.put(AddQuestionController());

  @override
  void initState() {
    super.initState();
    controller.questionAnswerListApi(widget.testTypeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f9ff),
      body: Row(
        children: [
          // Sidebar with question navigation
          Container(
            width: 300.w,
            color: Colors.white,
            child: Column(
              children: [
                // Header
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: primary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.testName,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Obx(
                        () => Text(
                          "Question ${controller.currentQuestionIndex.value + 1} of ${controller.questionAnswerList.length}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Question Navigation
                Expanded(
                  child: Obx(() {
                    if (controller.questionAnswerList.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.quiz_outlined,
                              size: 48.sp,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              "No Questions Available",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.all(16.w),
                      itemCount: controller.questionAnswerList.length,
                      itemBuilder: (context, index) {
                        final isCurrent =
                            controller.currentQuestionIndex.value == index;
                        final isAnswered = controller.selectedAnswers
                            .containsKey(index);

                        return Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                controller.currentQuestionIndex.value = index;
                              },
                              borderRadius: BorderRadius.circular(8.r),
                              child: Container(
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(
                                  color:
                                      isCurrent
                                          ? primary.withOpacity(0.1)
                                          : Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                    color:
                                        isCurrent
                                            ? primary
                                            : Colors.grey.shade300,
                                    width: isCurrent ? 2 : 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 24.w,
                                      height: 24.h,
                                      decoration: BoxDecoration(
                                        color:
                                            isAnswered
                                                ? Colors.green
                                                : Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${index + 1}",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: Text(
                                        "Question ${index + 1}",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight:
                                              isCurrent
                                                  ? FontWeight.w600
                                                  : FontWeight.w500,
                                          color:
                                              isCurrent ? primary : blackColor,
                                        ),
                                      ),
                                    ),
                                    if (isAnswered)
                                      Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 16.sp,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),

                // Progress Bar
                Container(
                  padding: EdgeInsets.all(16.w),
                  child: Obx(() {
                    final progress =
                        controller.questionAnswerList.isEmpty
                            ? 0.0
                            : (controller.currentQuestionIndex.value + 1) /
                                controller.questionAnswerList.length;

                    return Column(
                      children: [
                        LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.grey.shade300,
                          color: primary,
                          minHeight: 8.h,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "${controller.currentQuestionIndex.value + 1} / ${controller.questionAnswerList.length}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: darkGreyColor,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),

          // Main Question Area
          Expanded(
            child: Obx(() {
              if (controller.isLoadingQuestion.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.questionAnswerList.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.quiz_outlined,
                        size: 64.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'No Questions Available',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'This test does not have any questions yet.',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                );
              }

              final questionData =
                  controller.questionAnswerList[controller
                      .currentQuestionIndex
                      .value];

              return Container(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question Header
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Question ${controller.currentQuestionIndex.value + 1}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          // Text(
                          //   questionData.list? ?? '',
                          //   style: TextStyle(
                          //     fontSize: 18.sp,
                          //     fontWeight: FontWeight.bold,
                          //     color: blackColor,
                          //   ),
                          // ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Answer Options
                    // Expanded(
                    //   child: ListView.builder(
                    //     itemCount: questionData.answers?.length ?? 0,
                    //     itemBuilder: (context, answerIndex) {
                    //       final answer = questionData.answers![answerIndex];
                    //       final selectedAnswer =
                    //           controller.selectedAnswers[controller
                    //               .currentQuestionIndex
                    //               .value];

                    //       Color borderColor = Colors.grey.shade300;
                    //       IconData? icon;
                    //       Color iconColor = Colors.transparent;

                    //       if (selectedAnswer != null) {
                    //         if (answerIndex == selectedAnswer) {
                    //           if (answer.isCorrect == true) {
                    //             borderColor = Colors.green;
                    //             icon = Icons.check_circle;
                    //             iconColor = Colors.green;
                    //           } else {
                    //             borderColor = Colors.red;
                    //             icon = Icons.cancel;
                    //             iconColor = Colors.red;
                    //           }
                    //         }
                    //       }

                    //       return Container(
                    //         margin: EdgeInsets.only(bottom: 12.h),
                    //         child: Material(
                    //           color: Colors.transparent,
                    //           child: InkWell(
                    //             onTap: () {
                    //               controller.selectOption(
                    //                 controller.currentQuestionIndex.value,
                    //                 answerIndex,
                    //               );
                    //             },
                    //             borderRadius: BorderRadius.circular(12.r),
                    //             child: Container(
                    //               padding: EdgeInsets.all(16.w),
                    //               decoration: BoxDecoration(
                    //                 color: Colors.white,
                    //                 borderRadius: BorderRadius.circular(12.r),
                    //                 border: Border.all(
                    //                   color: borderColor,
                    //                   width: 2,
                    //                 ),
                    //                 boxShadow: [
                    //                   BoxShadow(
                    //                     color: Colors.grey.shade200,
                    //                     blurRadius: 4,
                    //                     offset: Offset(0, 2),
                    //                   ),
                    //                 ],
                    //               ),
                    //               child: Row(
                    //                 children: [
                    //                   Container(
                    //                     width: 32.w,
                    //                     height: 32.h,
                    //                     decoration: BoxDecoration(
                    //                       color:
                    //                           selectedAnswer == answerIndex
                    //                               ? primary
                    //                               : Colors.grey.shade200,
                    //                       borderRadius: BorderRadius.circular(
                    //                         16.r,
                    //                       ),
                    //                     ),
                    //                     child: Center(
                    //                       child: Text(
                    //                         String.fromCharCode(
                    //                           65 + answerIndex,
                    //                         ),
                    //                         style: TextStyle(
                    //                           fontSize: 14.sp,
                    //                           fontWeight: FontWeight.bold,
                    //                           color:
                    //                               selectedAnswer == answerIndex
                    //                                   ? Colors.white
                    //                                   : Colors.grey[600],
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   SizedBox(width: 16.w),
                    //                   Expanded(
                    //                     child: Text(
                    //                       answer.answerName ?? '',
                    //                       style: TextStyle(
                    //                         fontSize: 16.sp,
                    //                         fontWeight: FontWeight.w500,
                    //                         color: blackColor,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   if (icon != null) ...[
                    //                     SizedBox(width: 8.w),
                    //                     Icon(
                    //                       icon,
                    //                       color: iconColor,
                    //                       size: 24.sp,
                    //                     ),
                    //                   ],
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),

                    // Navigation Buttons
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (controller.currentQuestionIndex.value > 0)
                            ElevatedButton.icon(
                              onPressed: controller.goToPreviousQuestion,
                              icon: Icon(Icons.arrow_back, size: 18.sp),
                              label: Text("Previous"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade600,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.w,
                                  vertical: 12.h,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                            )
                          else
                            SizedBox(),

                          ElevatedButton.icon(
                            onPressed: () {
                              if (controller.currentQuestionIndex.value ==
                                  controller.questionAnswerList.length - 1) {
                                _showSubmitDialog();
                              } else {
                                controller.goToNextQuestion();
                              }
                            },
                            icon: Icon(
                              controller.currentQuestionIndex.value ==
                                      controller.questionAnswerList.length - 1
                                  ? Icons.check
                                  : Icons.arrow_forward,
                              size: 18.sp,
                            ),
                            label: Text(
                              controller.currentQuestionIndex.value ==
                                      controller.questionAnswerList.length - 1
                                  ? "Submit"
                                  : "Next",
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 12.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showSubmitDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            title: Text(
              "Submit Test",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            content: Text(
              "Are you sure you want to submit your test? You cannot change your answers after submission.",
              style: TextStyle(fontSize: 14.sp, color: darkGreyColor),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigate to results screen
                  Get.to(
                    () => WindowsTestResultScreen(
                      testName: widget.testName,
                      testTypeId: widget.testTypeId,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                ),
                child: Text("Submit"),
              ),
            ],
          ),
    );
  }
}

class WindowsTestResultScreen extends StatelessWidget {
  final String testName;
  final String testTypeId;

  const WindowsTestResultScreen({
    super.key,
    required this.testName,
    required this.testTypeId,
  });

  @override
  Widget build(BuildContext context) {
    final AddQuestionController controller = Get.find<AddQuestionController>();

    return Scaffold(
      backgroundColor: const Color(0xfff6f9ff),
      body: Center(
        child: Container(
          width: 600.w,
          padding: EdgeInsets.all(32.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                controller.hasPassed()
                    ? Icons.celebration
                    : Icons.sentiment_dissatisfied,
                size: 64.sp,
                color: controller.hasPassed() ? Colors.green : Colors.red,
              ),
              SizedBox(height: 16.h),
              Text(
                controller.hasPassed()
                    ? "Congratulations!"
                    : "Better Luck Next Time",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: controller.hasPassed() ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Test: $testName",
                style: TextStyle(fontSize: 18.sp, color: darkGreyColor),
              ),
              SizedBox(height: 24.h),

              // Results Grid
              Row(
                children: [
                  Expanded(
                    child: _buildResultCard(
                      "Correct",
                      "${controller.getCorrectAnswers()}",
                      Colors.green,
                      Icons.check_circle,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildResultCard(
                      "Wrong",
                      "${controller.getWrongAnswers()}",
                      Colors.red,
                      Icons.cancel,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildResultCard(
                      "Unanswered",
                      "${controller.getUnansweredQuestions()}",
                      Colors.orange,
                      Icons.help_outline,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // Percentage
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Text(
                      "Your Score",
                      style: TextStyle(fontSize: 16.sp, color: darkGreyColor),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "${controller.getPercentage().toStringAsFixed(1)}%",
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: primary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      controller.hasPassed() ? "PASSED" : "FAILED",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color:
                            controller.hasPassed() ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text("Back to Tests"),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Retake test
                        Get.back();
                        Get.to(
                          () => WindowsTestScreen(
                            testName: testName,
                            testTypeId: testTypeId,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text("Retake Test"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard(
    String title,
    String value,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24.sp),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(title, style: TextStyle(fontSize: 12.sp, color: darkGreyColor)),
        ],
      ),
    );
  }
}
