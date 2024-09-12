import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/controller/RegisterController.dart';
import 'package:travel_app/Register/register.dart';  // Ensure the correct path
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';  // Import for TextFormField
import 'package:flutter_screenutil/flutter_screenutil.dart';  // Import ScreenUtil if used in the UI

class MockClient extends Mock implements http.Client {}

void main() {
  late RegisterController registerController;
  late MockClient mockClient;

  setUp(() {
    Get.testMode = true;  // Ensure this is added to prevent navigation-related issues
    mockClient = MockClient();
    registerController = Get.put(RegisterController(client: mockClient));
  });

  tearDown(() {
    Get.delete<RegisterController>();
  });

  testWidgets('Register Page UI test', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: Builder(
          builder: (context) {
            // Initialize ScreenUtil if it's used in your RegisterPage
            ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);
            return RegisterPage();
          },
        ),
      ),
    );

    // Assuming there's only one TextFormField, use the correct finder
    await tester.enterText(find.byType(TextFormField), 'password123');
    expect(find.text('password123'), findsOneWidget);
  });
}
