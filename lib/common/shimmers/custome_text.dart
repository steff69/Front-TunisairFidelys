import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/constants/constants.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
      this.keyboardType,
      this.controller,
      this.onEditingCoplete,
      this.obscureText,
      this.suffixIcon,
      this.validator,
      this.prefixIcon,
      this.hintText,
      this.onChanged,
      this.maxlines});

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function()? onEditingCoplete;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  final bool? obscureText;
  final String? hintText;
  final int? maxlines;

  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.only(left: 6.h),
      decoration: BoxDecoration(
          border: Border.all(color: KGray, width: 1.5),
          borderRadius: BorderRadius.circular(9.r)),
      child: TextFormField(
        maxLines: maxlines ?? 1,
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        onEditingComplete: onEditingCoplete,
        obscureText: obscureText ?? false,
        cursorHeight: 20.h,
        validator: validator,
        style: TextStyle(
            color: kDark, fontSize: 11, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: kDark, fontSize: 11, fontWeight: FontWeight.normal),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText),
      ),
    );
  }
}
