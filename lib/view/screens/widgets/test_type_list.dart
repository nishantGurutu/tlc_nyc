import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestTypeList extends StatelessWidget {
  const TestTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
          );
        },
      ),
    );
  }
}
