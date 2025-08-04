import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/controller/test_controller.dart';
import 'package:tlc_nyc/view/screens/authenticated/test_result_screen.dart';

class TestScreen extends StatelessWidget {
  final int testNumber;
  TestScreen(this.testNumber, {super.key});

  final TestController controller = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test $testNumber',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primary,
      ),
      backgroundColor: background,
      body: SafeArea(
        child: Obx(() {
          if (controller.questions.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          final question =
              controller.questions[controller.currentQuestionIndex.value];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Q${controller.currentQuestionIndex.value + 1}. ${question.question}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                ...question.options.entries.map((entry) {
                  return ListTile(
                    title: Text('${entry.key}. ${entry.value}'),
                    leading: Radio<String>(
                      value: entry.key,
                      groupValue: null,
                      onChanged: (val) {},
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
                              "Privious",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    // ElevatedButton(
                    //   style: ButtonStyle(backgroundColor: ),
                    //   onPressed: controller.goToPreviousQuestion,
                    //   child: Text("Previous"),
                    // ),
                    if (controller.currentQuestionIndex.value == 0) Container(),
                    GestureDetector(
                      onTap: () {
                        if (controller.currentQuestionIndex.value ==
                            controller.questions.length - 1) {
                          confirmDialog(context, testNumber);
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
                                    controller.questions.length - 1
                                ? "Submit"
                                : "Next",
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

  Future<void> confirmDialog(BuildContext context, int testNumber) async {
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
                        'Are you sure\n want to exist',
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
                                  'Yes',
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
                                  'No',
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
