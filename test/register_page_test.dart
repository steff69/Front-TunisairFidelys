import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/controller/RegisterController.dart';
import 'package:travel_app/Register/register.dart';

void main() {
  testWidgets('Register Page UI Test', (WidgetTester tester) async {
    // Initialize GetX controller
    final RegisterController registerController = Get.put(RegisterController());

    // Initialize ScreenUtil before building the widget
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            home: RegisterPage(),
          );
        },
      ),
    );

    // Verify that the text fields for email, name, and password exist
    expect(find.byType(TextFormField), findsNWidgets(3)); // Now looking for 3 text fields

    // Enter email
    await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
    await tester.pump();

    // Enter name
    await tester.enterText(find.byType(TextFormField).at(1), 'TestUser');
    await tester.pump();

    // Enter password
    await tester.enterText(find.byType(TextFormField).at(2), 'password123');
    await tester.pump();

    // Tap on the "SIGN UP" button
    await tester.tap(find.text('SIGN UP'));
    await tester.pump();

    // Check if the registration process started by verifying loading state
    expect(registerController.loading.value, true);

    // Simulate registration success by setting loading to false
    registerController.loading.value = false;
    await tester.pump();

    // Verify that loading has stopped
    expect(registerController.loading.value, false);
  });
}
