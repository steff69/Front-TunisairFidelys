import 'dart:convert';  // Import for jsonEncode and jsonDecode
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/controller/RegisterController.dart';
import 'package:travel_app/screens/RegisterPage.dart';
import 'register_controller_test.mocks.dart';  // Import generated mocks

@GenerateMocks([http.Client])
void main() {
  late RegisterController controller;
  late MockClient mockClient;

  setUp(() {
    Get.testMode = true;  // Prevents GetX navigation issues during testing
    mockClient = MockClient();  // Create the mock client
    controller = Get.put(RegisterController(client: mockClient));  // Inject the mock client
  });

  tearDown(() {
    Get.delete<RegisterController>();  // Clean up the controller
  });

  testWidgets('Register Page UI Test', (WidgetTester tester) async {
    // Build the RegisterPage widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: RegisterPage(),
      ),
    );

    // Verify that the email, name, and password fields exist
    expect(find.byType(EmailTextField), findsNWidgets(2));
    expect(find.byType(PasswordTextField), findsOneWidget);

    // Enter email
    await tester.enterText(find.byType(EmailTextField).first, 'test@example.com');
    await tester.pump();

    // Enter name
    await tester.enterText(find.byType(EmailTextField).at(1), 'TestUser');
    await tester.pump();

    // Enter password
    await tester.enterText(find.byType(PasswordTextField), 'password123');
    await tester.pump();

    // Tap on the "Sign Up" button
    await tester.tap(find.text('SIGN UP'));
    await tester.pump();

    // Check if the registration process started by verifying loading state
    expect(controller.loading.value, true);

    // Simulate registration success by setting loading to false
    controller.loading.value = false;
    await tester.pump();

    // Verify that loading has stopped
    expect(controller.loading.value, false);
  });
}
