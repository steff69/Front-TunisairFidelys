import 'package:flutter_test/flutter_test.dart';
import 'package:tunisair-master/main.dart';
import 'package:tunisair-master/pages/welcome_page.dart';  // Adjust based on what you're testing

void main() {
  testWidgets('Welcome page loads correctly', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the WelcomePage loads correctly (adjust these based on WelcomePage contents).
    expect(find.text('Welcome'), findsOneWidget);  // Assuming "Welcome" text exists in WelcomePage
  });
}
