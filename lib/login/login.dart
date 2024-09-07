import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app/Models%202/LoginModel.dart';
import 'package:travel_app/Register/register.dart';
import 'package:travel_app/common/EmailTextField.dart';
import 'package:travel_app/common/PasswordTextField.dart';
import 'package:travel_app/common/back_ground_container.dart';
import 'package:travel_app/common/shimmers/cutomButtomn.dart';
import 'package:travel_app/constants/constants.dart';
import 'package:travel_app/controller/LoginController.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  final FocusNode _passwordCFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordCFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var c = Get.put(LoginController());

    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhite,
        title: Padding(
            padding: EdgeInsets.only(left: 150),
            child: Text(
              'Log In ',
              style: TextStyle(
                  color: kDark, fontSize: 20, fontWeight: FontWeight.bold),
            )),
      ),
      body: Container(
        width: widthh,
        height: hieght,
        child: ClipRRect(
          borderRadius: BorderRadius.only(),
          child: ListView(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Image.asset('assets/t.jpg'),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    EmailTextField(
                      hintText: "Enter Email",
                      prefixIcon: Icon(
                        CupertinoIcons.mail,
                        size: 20,
                        color: kGrayLight,
                      ),
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PasswordTextField(
                      controller: _passwordController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => RegisterPage());
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(() => c.loading.value
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.blue,
                            strokeAlign: 1,
                          ))
                        : CustomButton(
                            onTap: () {
                              LoginModel model = LoginModel(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                              String data = loginModelToJson(model);
                              c.loginFunction(data);
                            },
                            text: "L O G I N",
                            btnheigh: 35.h,
                          )),
                  ],
                ),
              )
            ],
          ),
        ),
        color: kOffwhite,
      ),
    );
  }
}
