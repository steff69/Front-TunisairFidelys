import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:travel_app/constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        height: 90.h,
        width: widthh,
        color: kOffwhite,
        child: Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 23.r,
                    backgroundColor: kSecondary,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 6.h,
                      left: 8.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Deliver to',
                          style: TextStyle(
                              color: kSecondary, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: widthh * 0.65,
                          child: const Text(
                            '16768 21st ave N, plumouth , MN 55447',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: kGrayLight,
                                fontWeight: FontWeight.normal),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                getTimeOfDay(),
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 0 && hour < 12) {
      return ' ☀️ ';
    } else if (hour >= 12 && hour < 16) {
      return ' ⛅ ';
    } else {
      return ' 🌙 ';
    }
  }
}
