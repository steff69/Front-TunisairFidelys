class RegisterController extends GetxController {
  final http.Client client;

  RegisterController({required this.client});

  RxBool loading = false.obs;

  Future<void> registerFunction(String data) async {
    loading.value = true;  // Set loading to true at the start of the request

    final url = Uri.parse('http://10.0.2.2:5000/api/user/create');
    Map<String, String> headers = {'content-Type': 'application/json'};

    try {
      final response = await client.post(url, headers: headers, body: data);

      if (response.statusCode == 200) {
        String text = jsonDecode(response.body)["message"];

        Get.snackbar('Created successfully', "$text",
            backgroundColor: kPrimary,
            colorText: kLightwhite,
            icon: Icon(Ionicons.fast_food_outline));

        Timer(Duration(seconds: 3), () {
          loading.value = false;
        });

        Get.offAll(() => LoginPage(),
            transition: Transition.fade, duration: Duration(milliseconds: 900));
      } else if (response.statusCode == 400) {
        String text = jsonDecode(response.body)["message"];

        Get.snackbar('Error', "$text",
            messageText: Text(
              "$text",
              style: TextStyle(fontSize: 18, color: kLightwhite),
            ),
            colorText: kDark,
            backgroundColor: kRed,
            icon: Icon(Ionicons.fast_food_outline));

        Timer(Duration(seconds: 3), () {
          loading.value = false;
        });
      }
    } catch (e) {
      print(e);
      loading.value = false;  // Ensure loading is set to false on error
    }
  }
}
