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
  late RegisterController registerController;
  late MockClient mockClient;

  setUp(() {
    Get.testMode = true;
    mockClient = MockClient(); // Mock http.Client
    registerController = Get.put(RegisterController(client: mockClient)); // Inject the mock client
  });

  tearDown(() {
    Get.delete<RegisterController>();
  });

  testWidgets('Register Page UI Test', (WidgetTester tester) async {
    // Initialize ScreenUtil before building the widget
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => GetMaterialApp(
          home: RegisterPage(),
        ),
      ),
    );

    // Mock HTTP response
    when(mockClient.post(any, headers: anyNamed('headers'), body: anyNamed('body')))
        .thenAnswer((_) async => http.Response('{"message": "Registration successful"}', 200));

    // Verify that the email, name, and password fields exist
    expect(find.byType(EmailTextField), findsNWidgets(2)); // Finds the email and name fields
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
