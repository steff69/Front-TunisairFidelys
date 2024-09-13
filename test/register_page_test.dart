import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:travel_app/Register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // For ScreenUtil

void main() {
  testWidgets('Register Page UI test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),  // Ensure this matches your app's design
        builder: () => GetMaterialApp(
          home: RegisterPage(),
        ),
      ),
    );

    // Test entering text into the first TextFormField (email field)
    await tester.enterText(find.byType(TextFormField).at(0), 'test@example.com');
    expect(find.text('test@example.com'), findsOneWidget);

    // Test entering text into the second TextFormField (password field)
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');
    expect(find.text('password123'), findsOneWidget);
  });
}
