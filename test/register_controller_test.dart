import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/controller/RegisterController.dart';
import 'register_controller_test.mocks.dart';  // Ensure this is generated properly

// This annotation generates the mock class for http.Client
@GenerateMocks([http.Client])
void main() {
  late RegisterController controller;
  late MockClient mockClient;

  setUp(() {
    Get.testMode = true;  // This prevents GetX navigation issues during testing
    mockClient = MockClient();  // Create the mock client
    controller = Get.put(RegisterController(client: mockClient));  // Inject the mock client
  });

  tearDown(() {
    Get.delete<RegisterController>();  // Clean up the controller
  });

  test('registerFunction sets loading state correctly and returns success response', () async {
    // Arrange: Mock the HTTP response to return success.
    final mockResponse = {
      "message": "User created successfully"
    };

    when(mockClient.post(
      any,
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response(jsonEncode(mockResponse), 200));

    // Act: Call the function
    String data = jsonEncode({
      "email": "test@example.com",
      "password": "password123",
      "username": "testuser"
    });

    // Assert that the loading is set to true during the request
    final future = controller.registerFunction(data);
    expect(controller.loading.value, true);

    await future;  // Await the actual call

    // Assert: loading state was set to false at the end and check other side effects
    expect(controller.loading.value, false);
    verify(mockClient.post(any, headers: anyNamed('headers'), body: anyNamed('body'))).called(1);
  });

  test('registerFunction handles error response correctly', () async {
    // Arrange: Mock the HTTP response to return an error.
    final mockErrorResponse = {
      "message": "Invalid request"
    };

    when(mockClient.post(
      any,
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response(jsonEncode(mockErrorResponse), 400));

    // Act: Call the function
    String data = jsonEncode({
      "email": "invalid@example.com",
      "password": "password123",
      "username": "invaliduser"
    });

    // Assert that loading is set to true at the start
    final future = controller.registerFunction(data);
    expect(controller.loading.value, true);

    await future;  // Await the actual call

    // Assert: loading state should be false after the error
    expect(controller.loading.value, false);
    verify(mockClient.post(any, headers: anyNamed('headers'), body: anyNamed('body'))).called(1);
  });
}
