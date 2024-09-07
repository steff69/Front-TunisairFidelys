import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/Models%202/FoodModel.dart';

class CategoryController extends GetxController {
  var dataList = [].obs;
  var count = 0.obs;
  RxBool leo = false.obs;
  var isleo = false.obs;
  var isLaoding = true.obs;

  RxString id = "".obs;

  void changeCategory(String idd) {
    if (idd == id.value) {
      // If the same category is clicked again, clear the dataList

      id.value = idd;
      // Clear the current category ID
    } else {
      // If a new category is clicked, clear the previous dataList

      id.value = idd; // Set the new category ID
    }
  }

  void getcategoryFood(String idCategory) async {
    dataList.clear();

    final url = Uri.parse('http://10.0.2.2:5000/api/food/$idCategory/41007428');

    try {
      final response = await http.get(url);

      //print(jsonDecode(response.body)['data']);
      if (response.statusCode == 200) {
        jsonDecode(response.body)['data']
            .forEach((e) => dataList.add(Datum.fromJson(e)));
      }
    } catch (e) {
      print(e);
    } finally {}
  }
}
