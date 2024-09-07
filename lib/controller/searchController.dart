import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/Models%202/FoodModel.dart';

class SerchController extends GetxController {
  //RxList<DatumC> dataList = RxList<DatumC>();

  RxList<Datum> dataSearch = RxList<Datum>([]);

  RxBool isleoding = true.obs;
  RxString str = 'a'.obs;

  void getSearchData({required String searchdata}) async {
    //jebet token men constante
    str.value = 'a';
    dataSearch.clear();

    final url = Uri.parse('http://10.0.2.2:5000/api/Vole/search/$searchdata');

    try {
      final response = await http.get(url);

      print(jsonDecode(response.body));

      if (response.statusCode == 200) {
        jsonDecode(response.body)
            .forEach((e) => dataSearch.add(Datum.fromJson(e)));
        str.value = '';
      }
    } catch (e) {
      print(e);
    } finally {}
  }
}
