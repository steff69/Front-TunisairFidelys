import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/controller/RegisterController.dart';
import 'package:travel_app/Register/register.dart';
import 'register_page_test.mocks.dart'; // Import generated mocks

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;

  setUp(() {
    Get.testMode = true;
    mockClient = MockClient(); // Mock http.Client
  });

  testWidgets('Register Page UI Test', (WidgetTester tester) async {
    // Initialize GetX controller with mockClient
    final RegisterController registerController = Get.put(RegisterController(client: mockClient));

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
    expect(find.byType(TextFormField), findsNWidgets(3));

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
