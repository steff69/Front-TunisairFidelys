import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/Models%202/FoodModel.dart';

class TetyController extends GetxController {
  List<Datum> alldataList = [];

  var count = 0.obs;
  var isLaoding = true.obs;
  var isallLaoding = true.obs;

  RxString id = "".obs;
}
