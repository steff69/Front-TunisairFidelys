import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:travel_app/Models%202/FoodModel.dart';
import 'package:travel_app/controller/testControl.dart';

class TestServices extends GetxService {
  final c = Get.put(TetyController());

  RxString id = "".obs;

  Future<void> fetchallData() async {
    c.isallLaoding.value = true;
    final url = Uri.parse('http://10.0.2.2:5000/api/Vole');
    try {
      final response = await http.get(url);

      print(jsonDecode(response.body)['data']);

      await jsonDecode(response.body)['data']
          .forEach((e) => c.alldataList.add(Datum.fromJson(e)));

      print(c.alldataList);
    } catch (e) {
    } finally {
      c.isallLaoding.value = false;
    }
  }

  Future<TestServices> init() async {
    await fetchallData();

    return this;
  }
}
