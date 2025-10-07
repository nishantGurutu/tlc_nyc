import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlc_nyc/constant/color_constant.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final int? maxLine;
  final int? maxLength;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? data;
  final Widget? prefixIcon;
  GestureTapCallback? onTap;
  final bool? readOnly;

  CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.keyboardType,
    required this.controller,
    required this.textCapitalization,
    this.maxLine,
    this.maxLength,
    this.suffixIcon,
    this.obscureText,
    this.data,
    this.onTap,
    this.readOnly,
    this.prefixIcon,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      style: TextStyle(color: darkGreyColor),
      textCapitalization: widget.textCapitalization,
      maxLines: widget.obscureText == true ? 1 : widget.maxLine,
      maxLength: widget.maxLength,
      obscureText: widget.obscureText ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please Enter ${widget.data}";
        }
        if (widget.data == "Email") {
          const String emailPattern =
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
          final RegExp regex = RegExp(emailPattern);
          if (!regex.hasMatch(value)) {
            return "Please Enter a Valid Email";
          }
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        suffixIcon: widget.suffixIcon,
        fillColor: whiteColor,
        prefixIcon: widget.prefixIcon,
        filled: true,

        labelStyle: TextStyle(color: darkGreyColor),
        counterText: "",
        border: OutlineInputBorder(
          borderSide: BorderSide(color: lightBorderColor),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightBorderColor),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blue),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      ),
    );
  }
}
