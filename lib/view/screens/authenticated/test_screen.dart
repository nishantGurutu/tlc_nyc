import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/controller/add_question_controller.dart';
import 'package:tlc_nyc/view/screens/authenticated/test_result_screen.dart';

class TestScreen extends StatefulWidget {
  final String testTypeName = Get.arguments['testTypeName'];
  final String testTypeId = Get.arguments['testTypeId'];
  TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final AddQuestionController controller = Get.find<AddQuestionController>();
  @override
  initState() {
    controller.questionAnswerListApi(typeId: widget.testTypeId);
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
          widget.testTypeName,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primary,
      ),
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: SafeArea(
        child: Container(),
        // child: Obx(() {
        //   if (controller.isLoadingQuestion.value) {
        //     return const Center(child: CircularProgressIndicator());
        //   }

        //   if (controller.questionAnswerList.isEmpty) {
        //     return Center(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Icon(Icons.quiz_outlined, size: 64, color: Colors.grey),
        //           SizedBox(height: 16),
        //           Text(
        //             'No Questions Available',
        //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //           ),
        //           SizedBox(height: 8),
        //           Text(
        //             'This test type "${widget.testTypeName}" does not have any questions yet.',
        //             textAlign: TextAlign.center,
        //             style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        //           ),
        //           SizedBox(height: 16),
        //         ],
        //       ),
        //     );
        //   }

        // }),
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
