import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlc_nyc/constant/color_constant.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.all( 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              color: whiteColor,
            ),
            child:  Container( decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.r)), color: whiteColor,), child: Icon(Icons.arrow_back, color: primary)),
                
          ),
        ),
        backgroundColor: primary,
        title:   Text('addQuestion'.tr,style: TextStyle(color: whiteColor, fontSize: 16.sp),),
      ),
     backgroundColor: whiteColor,
      body: Column(
        children: [

        ],
      ),
    );
  }
}