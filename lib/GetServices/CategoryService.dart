import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:travel_app/Models%202/CategoryModel.dart';

class CategoryService extends GetxService {
  var isLaoding = true.obs;
  var dataList = [];
  RxString id = "".obs;

  void changeCategory(String idd) {
    id.value = idd;
  }

  Future<void> fetchData() async {
    isLaoding.value = true;

    final url = Uri.parse('http://10.0.2.2:5000/api/category');
    try {
      final response = await http.get(url);

      //print(jsonDecode(response.body)['data']);
      if (response.statusCode == 200) {
        await jsonDecode(response.body)['data']
            .forEach((e) => dataList.add(DatumC.fromJson(e)));

        print("${dataList} dzdzdzdz");
      }
    } catch (e) {
      print(e);
    } finally {
      Timer.periodic(Duration(seconds: 2), (timer) {
        isLaoding.value = false;
      });
    }
  }

  Future<CategoryService> init() async {
    fetchData();

    return this;
  }
}
