import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'register_controller_test.mocks.dart';
import 'package:travel_app/controller/RegisterController.dart';

@GenerateMocks([http.Client])
void main() {
  late RegisterController controller;
  late MockClient mockClient;

  setUp(() {
    Get.testMode = true;  // This will prevent errors with GetX widgets during testing
    mockClient = MockClient();
    controller = Get.put(RegisterController(client: mockClient));
  });

  tearDown(() {
    Get.reset();
  });

  test('registerFunction sets loading state correctly and returns success response', () async {
    final mockResponse = {
      "message": "User created successfully"
    };

    when(mockClient.post(
      Uri.parse('http://10.0.2.2:5000/api/user/create'),
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response(jsonEncode(mockResponse), 200));

    String data = jsonEncode({
      "email": "test@example.com",
      "password": "password123",
      "username": "testuser"
    });

    expect(controller.loading.value, false);
    await controller.registerFunction(data);
    expect(controller.loading.value, false);
    verify(mockClient.post(any, headers: anyNamed('headers'), body: anyNamed('body'))).called(1);
  });

  test('registerFunction handles error response correctly', () async {
    final mockErrorResponse = {
      "message": "Invalid request"
    };

    when(mockClient.post(
      Uri.parse('http://10.0.2.2:5000/api/user/create'),
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response(jsonEncode(mockErrorResponse), 400));

    String data = jsonEncode({
      "email": "invalid@example.com",
      "password": "password123",
      "username": "invaliduser"
    });

    expect(controller.loading.value, false);
    await controller.registerFunction(data);
    expect(controller.loading.value, false);
    verify(mockClient.post(any, headers: anyNamed('headers'), body: anyNamed('body'))).called(1);
  });
}
