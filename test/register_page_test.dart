import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:travel_app/controller/RegisterController.dart';
import 'package:travel_app/Register/register.dart';

void main() {
  testWidgets('Register Page UI Test', (WidgetTester tester) async {
    // Initialize GetX controller
    final RegisterController registerController = Get.put(RegisterController());

    // Build the RegisterPage widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: RegisterPage(),
      ),
    );

    // Verify that the email field exists
    expect(find.byType(TextFormField), findsNWidgets(2)); // One for email, one for password

    // Enter email
    await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
    await tester.pump();

    // Verify that the entered email is displayed in the text field
    expect(find.text('test@example.com'), findsOneWidget);

    // Enter name
    await tester.enterText(find.byType(TextFormField).at(1), 'TestUser');
    await tester.pump();

    // Enter password
    await tester.enterText(find.byType(PasswordTextField), 'password123');
    await tester.pump();

    // Tap on the "Sign Up" button
    await tester.tap(find.text('SING UP'));
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
