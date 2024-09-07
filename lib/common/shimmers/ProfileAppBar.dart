import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:travel_app/constants/constants.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kOffwhite,
      elevation: 0,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SizedBox(width: 5.w),
              Container(
                width: 1.w,
                height: 15.h,
                color: kGrayLight,
              ),
              SizedBox(width: 5.w),
              Text(
                'USA',
                style: TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 16, color: kDark),
              ),
              SizedBox(width: 5.w),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Icon(
                    SimpleLineIcons.settings,
                    size: 16.h,
                  ),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
