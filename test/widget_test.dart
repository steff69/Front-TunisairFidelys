import 'package:flutter_test/flutter_test.dart';
import 'package:travel_app/main.dart'; // Ensure this is correct
import 'package:travel_app/login/login.dart';

void main() {
  testWidgets('WelcomePage loads correctly', (WidgetTester tester) async {
    // Build the WelcomePage app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the text "Explore your journey" is found on the WelcomePage.
    expect(find.text('Explore your journey \nonly with us'), findsOneWidget);

    // Verify that the text "All your vacations destinations are here" is found.
    expect(find.text('All your vacations destinations are here,\nenjoy your holiday'), findsOneWidget);

    // Verify that the "Get Started" button is present.
    expect(find.text('Get Started'), findsOneWidget);

    // Tap the "Get Started" button and trigger navigation.
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle(); // Wait for the navigation animation to finish.

    // Verify that after tapping "Get Started", the LoginPage is shown.
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
