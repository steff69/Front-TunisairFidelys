import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //RxList<DatumC> dataList = RxList<DatumC>();
  var currentIndex = 0.obs;

  void changeBottom(int idd) {
    currentIndex.value = idd;
  }
}
