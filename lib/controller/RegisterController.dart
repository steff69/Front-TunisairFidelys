import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/constants/constants.dart';
import 'package:travel_app/login/login.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class RegisterController extends GetxController {
  final http.Client client;  // Inject the HTTP client
  final box = GetStorage();

  RegisterController({required this.client});  // Constructor for injecting http.Client

  RxBool loading = false.obs;

  Future<void> registerFunction(String data) async {
    loading.value = true;

    final url = Uri.parse('http://10.0.2.2:5000/api/user/create');
    Map<String, String> headers = {'content-Type': 'application/json'};

    try {
      final response = await client.post(url, headers: headers, body: data);

      if (response.statusCode == 200) {
        String text = jsonDecode(response.body)["message"];

        Get.snackbar('Created successfully', "$text",
            backgroundColor: kPrimary,
            colorText: kLightwhite,
            icon: Icon(Ionicons.fast_food_outline));

        loading.value = false;  // Reset loading state
        Get.offAll(() => LoginPage(),
            transition: Transition.fade, duration: Duration(milliseconds: 900));
      } else if (response.statusCode == 400) {
        String text = jsonDecode(response.body)["message"];

        Get.snackbar('Error', "$text",
            messageText: Text(
              "$text",
              style: TextStyle(fontSize: 18, color: kLightwhite),
            ),
            colorText: kDark,
            backgroundColor: kRed,
            icon: Icon(Ionicons.fast_food_outline));

        loading.value = false;  // Reset loading state after error
      }
    } catch (e) {
      print(e);
      loading.value = false;  // Ensure loading state is reset after failure
    }
  }
}
