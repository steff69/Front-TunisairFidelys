import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/constants/constants.dart';
import 'package:travel_app/login/login.dart';

class RegisterController extends GetxController {
  //RxList<DatumC> dataList = RxList<DatumC>();
  final box = GetStorage();

  RxBool loading = false.obs;

  void registerFunction(String data) async {
    loading.value = true;

    final url = Uri.parse('http://10.0.2.2:5000/api/user/create');
    Map<String, String> headers = {'content-Type': 'application/json'};

    try {
      final response = await http.post(url, headers: headers, body: data);

      //print(jsonDecode(response.body)['data']);
      if (response.statusCode == 200) {
        String text = jsonDecode(response.body)["message"];

        Get.snackbar('  crated ssucs', "$text",
            backgroundColor: kPrimary,
            colorText: kLightwhite,
            icon: Icon(Ionicons.fast_food_outline));

        Timer.periodic(Duration(seconds: 3), (timer) {
          loading.value = false;
        });

        Get.offAll(() => LoginPage(),
            transition: Transition.fade, duration: Duration(milliseconds: 900));
      }
      if (response.statusCode == 400) {
        String text = jsonDecode(response.body)["message"];

        Get.snackbar('  you have something wrong', "$text",
            messageText: Text(
              "$text",
              style: TextStyle(fontSize: 18, color: kLightwhite),
            ),
            colorText: kDark,
            backgroundColor: kRed,
            icon: Icon(Ionicons.fast_food_outline));

        Timer.periodic(Duration(seconds: 3), (timer) {
          loading.value = false;
        });
      }
    } catch (e) {
      print(e);
    } finally {}
  }
}
