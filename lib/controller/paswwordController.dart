import 'package:get/get.dart';

class PasswordController extends GetxController {
  RxBool password = true.obs;

  void changeOasswor() {
    password.value = !password.value;
  }
}
