import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlc_nyc/constant/color_constant.dart';

class HomeButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const HomeButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        padding: EdgeInsets.all(12.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36.sp, color: primary),
            SizedBox(height: 12.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
