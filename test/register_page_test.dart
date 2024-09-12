import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/controller/RegisterController.dart';
import 'package:travel_app/register/register.dart';  // Ensure correct path
import 'package:travel_app/common/password_text_field.dart';  // Import PasswordTextField
import 'package:http/http.dart' as http;

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

    // Check if the password field is present and enter text into it
    await tester.enterText(find.byType(PasswordTextField), 'password123');
    expect(find.text('password123'), findsOneWidget);
  });
}
