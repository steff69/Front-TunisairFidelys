import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/constants/constants.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField(
      {super.key,
      this.onEditingComplete,
      this.keyboardType,
      this.initialValue,
      this.controller,
      this.hintText,
      this.prefixIcon});

  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kDark,
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      initialValue: initialValue,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'pls enter valid data';
        }
        return null;
      },
      style:
          TextStyle(color: KGray, fontSize: 12, fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        isDense: true,
        contentPadding: EdgeInsets.all(20.h),
        hintStyle: TextStyle(
            color: KGray, fontSize: 12, fontWeight: FontWeight.normal),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kRed, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: KGray, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kRed, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: KGray, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: KGray, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: KGray, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
      ),
    );
  }
}
