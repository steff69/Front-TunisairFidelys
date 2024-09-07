import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:travel_app/constants/constants.dart';

class Heading extends StatelessWidget {
  Heading({super.key, required this.text, required this.ontap, this.ic});
  final String text;
  final void Function() ontap;
  Widget? ic;
  double? sizee;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 16, color: kDark, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: ontap,
            child: ic ??
                Icon(
                  AntDesign.appstore1,
                  color: kSecondary,
                  size: 20.sp,
                ),
          )
        ],
      ),
    );
  }
}
