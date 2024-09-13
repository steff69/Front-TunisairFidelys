import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:travel_app/Register/register.dart';  // Ensure correct path
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
  });

  testWidgets('Register Page UI test', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: RegisterPage(),
      ),
    );

    // Test entering text into the email field (now TextFormField)
    await tester.enterText(find.byType(TextFormField).at(0), 'test@example.com');
    expect(find.text('test@example.com'), findsOneWidget);

    // Test entering text into the password field
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');
    expect(find.text('password123'), findsOneWidget);
  });
}
