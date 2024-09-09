import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_app/GetServices/testservicese.dart';
import 'package:travel_app/Register/register.dart';
import 'package:travel_app/constants/constants.dart';
import 'package:travel_app/pages/MainScreen.dart';
import 'package:travel_app/pages/home_page.dart';

import 'package:travel_app/pages/welcome_page.dart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await inittalServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 825),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'fudly',
            theme: ThemeData(
              scaffoldBackgroundColor: kOffwhite,
              iconTheme: IconThemeData(color: kDark),
            ),
            home: const WelcomePage(),
          );
        });
  }
}

Future inittalServices() async {
  await Get.putAsync(() => TestServices().init());
}
