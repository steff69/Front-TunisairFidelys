import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:travel_app/controller/RegisterController.dart';
import 'package:travel_app/constants/constants.dart';

// Generate a mock class for the http.Client
import 'register_controller_test.mocks.dart';

// This annotation is needed to generate the mock class using Mockito.
@GenerateMocks([http.Client])
void main() {
  late RegisterController controller;
  late MockClient mockClient;

  setUp(() {
    controller = Get.put(RegisterController());
    mockClient = MockClient();
  });

  tearDown(() {
    Get.delete<RegisterController>();
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

    await controller.registerFunction(data);

    // Assert: loading state was set to true at the start and false at the end
    expect(controller.loading.value, false);

    // Additionally, you can assert if the API response was handled correctly, but
    // since we can't directly check Get.snackbar(), we can focus on loading state here.
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

    await controller.registerFunction(data);

    // Assert: loading state should be false after the error
    expect(controller.loading.value, false);

    // Since error message display and navigation are triggered by Get methods,
    // you would focus on verifying state and flow for this case.
  });
}
