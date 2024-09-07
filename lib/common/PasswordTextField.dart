import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:travel_app/constants/constants.dart';
import 'package:travel_app/controller/paswwordController.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(PasswordController());
    return Obx(() => TextFormField(
          cursorColor: kDark,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          controller: controller,
          obscureText: c.password.value,
          validator: (value) {
            if (value!.isEmpty) {
              return 'pls enter valid password';
            }
            return null;
          },
          style: TextStyle(
              color: KGray, fontSize: 12, fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            hintText: "password",
            prefixIcon: Icon(
              CupertinoIcons.lock_circle,
              size: 26,
              color: kGrayLight,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                c.changeOasswor();
              },
              child: Icon(
                c.password.value ? Icons.visibility_off : Icons.visibility,
                size: 26,
                color: kGrayLight,
              ),
            ),
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
        ));
  }
}
