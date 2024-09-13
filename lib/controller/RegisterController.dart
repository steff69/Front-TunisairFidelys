import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/constants/constants.dart';
import 'package:travel_app/login/login.dart';

class RegisterController extends GetxController {
  final http.Client client; // Injected HTTP client
  final box = GetStorage();
  RxBool loading = false.obs;

  RegisterController({required this.client}); // Constructor to accept http.Client

  void registerFunction(String data) async {
    loading.value = true;

    final url = Uri.parse('http://10.0.2.2:5000/api/user/create');
    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      final response = await client.post(url, headers: headers, body: data);

      if (response.statusCode == 200) {
        String text = jsonDecode(response.body)["message"];
        Get.snackbar('Created successfully', "$text",
            backgroundColor: kPrimary, colorText: kLightwhite, icon: Icon(Icons.check));
        loading.value = false;

        Get.offAll(() => LoginPage(), transition: Transition.fade, duration: Duration(milliseconds: 900));
      } else if (response.statusCode == 400) {
        String text = jsonDecode(response.body)["message"];
        Get.snackbar('Error', "$text", backgroundColor: kRed, colorText: kDark, icon: Icon(Icons.error));
        loading.value = false;
      }
    } catch (e) {
      print(e);
      loading.value = false;
    }
  }
}
