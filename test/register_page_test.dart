import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:travel_app/Register/register.dart';

void main() {
  testWidgets('RegisterPage test', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: RegisterPage(),
      ),
    );

    expect(find.text('Sign Up'), findsOneWidget);
  });
}
