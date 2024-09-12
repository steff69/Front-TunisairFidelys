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

    // Replaced PasswordTextField with TextFormField
    await tester.enterText(find.byType(TextFormField), 'password123');
    expect(find.text('password123'), findsOneWidget);
  });
}
