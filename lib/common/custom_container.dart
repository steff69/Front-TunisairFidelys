import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/constants/constants.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({Key? key, required this.containerConrent, this.color})
      : super(key: key);

  Widget containerConrent;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthh,
      height: MediaQuery.of(context).size.height * 0.75,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        child: Container(
          width: widthh,
          color: color ?? kOffwhite,
          child: SingleChildScrollView(
            child: containerConrent,
          ),
        ),
      ),
    );
  }
}
