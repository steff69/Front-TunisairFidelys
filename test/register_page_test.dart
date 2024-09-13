import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/controller/RegisterController.dart';
import 'package:travel_app/Register/register.dart';  // Ensure correct path
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';  // Import this for TextFormField

class MockClient extends Mock implements http.Client {}

void main() {
  late RegisterController registerController;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    registerController = Get.put(RegisterController(client: mockClient));
  });

  tearDown(() {
    Get.delete<RegisterController>();
  });

  testWidgets('Register Page UI test', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: RegisterPage(),
      ),
    );

    // Find and enter text into the name TextField (EmailTextField)
    await tester.enterText(find.byType(EmailTextField).first, 'test@example.com');
    expect(find.text('test@example.com'), findsOneWidget);

    // Find and enter text into the password TextField
    await tester.enterText(find.byType(PasswordTextField), 'password123');
    expect(find.text('password123'), findsOneWidget);

    // Trigger SIGN UP button tap
    await tester.tap(find.text('SIGN UP'));
    await tester.pump();  // Let the UI rebuild

    // Verify that loading starts (you may need to adjust based on your CircularProgressIndicator check)
    expect(registerController.loading.value, true);
  });
}
