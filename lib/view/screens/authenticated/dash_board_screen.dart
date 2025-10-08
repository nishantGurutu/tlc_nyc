import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';
import 'package:tlc_nyc/controller/home_controller.dart';
import 'package:tlc_nyc/view/screens/authenticated/add_question_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final HomeController controller = Get.put(HomeController());
  List<Color> colorList =
      <Color>[purple1, blue1, primary1, green1, lightMildGreen1].obs;

  @override
  void initState() {
    controller.groupListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'tlcTestPrep'.tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primary,
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: (){
                Get.to(()=> AddScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.r)
                  ),
                  color: whiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(Icons.add),
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: background,
      body: Obx(
        () =>
            controller.isGroupLoading.value == true
                ? Center(child: CircularProgressIndicator())
                : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.groupListData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.onTestSelected(
                                controller.groupListData[index].qtypENAME??"",
                                testTypeId: controller.groupListData[index].qtypECODE??0,
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.h,
                                horizontal: 12.w,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.groupListData[index].qtypENAME??"",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: blackColor,
                                        ),
                                      ),
                                      Icon(Icons.arrow_right),
                                      
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
    );
  }
}
