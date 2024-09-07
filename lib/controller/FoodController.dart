import 'dart:convert';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:travel_app/Models%202/FoodModel.dart';
import 'package:travel_app/controller/AdditivesObsController.dart';

class FoodController extends GetxController {
  //RxList<DatumC> dataList = RxList<DatumC>();
  bool initialCheckValue = false;
  var additivesList = <AdditiveObs>[].obs;

  RxDouble _totalPrice = 0.0.obs;

  RxInt count = 1.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value == 1) {
      count.value = 1;
    } else {
      count.value--;
    }
  }

  double get additivePrice => _totalPrice.value;

  set setTotalePrice(double price) {
    _totalPrice.value = price;
  }

  void loadAdditives(List<Additive> additives) {
    additivesList.clear();
    for (var additiveInfo in additives) {
      var additive = AdditiveObs(
          id: additiveInfo.id,
          price: additiveInfo.price,
          title: additiveInfo.title,
          checked: initialCheckValue);
      if (additives.length == additivesList.length) {
      } else {
        additivesList.add(additive);
      }
    }
  }

  List<String> getList() {
    List<String> ads = [];

    for (var additive in additivesList) {
      if (additive.ischecked.value && !ads.contains(additive.title)) {
        ads.add(additive.title);
      } else if (!additive.ischecked.value && ads.contains(additive.title)) {
        ads.remove(additive.title);
      }
    }

    return ads;
  }

  double getTotalPrice() {
    double totlaPrice = 0.0;

    for (var additive in additivesList) {
      if (additive.ischecked.value) {
        totlaPrice += double.tryParse(additive.price) ?? 0.0;
      }
    }
    setTotalePrice = totlaPrice;
    return totlaPrice;
  }
}
