import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app/Models%202/LoginModel.dart';
import 'package:travel_app/Models%202/RegisterModel.dart';
import 'package:travel_app/common/EmailTextField.dart';
import 'package:travel_app/common/PasswordTextField.dart';
import 'package:travel_app/common/back_ground_container.dart';
import 'package:travel_app/common/shimmers/cutomButtomn.dart';
import 'package:travel_app/constants/constants.dart';
import 'package:travel_app/controller/LoginController.dart';
import 'package:travel_app/controller/RegisterController.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _nameController = TextEditingController();

  late final TextEditingController _passwordController =
      TextEditingController();
  final FocusNode _passwordCFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordCFocusNode.dispose();
    _nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var c = Get.put(RegisterController());

    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhite,
        title: Padding(
            padding: EdgeInsets.only(left: 100),
            child: Text(
              'Sign Up',
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
                    EmailTextField(
                      hintText: "Name",
                      prefixIcon: Icon(
                        CupertinoIcons.person,
                        size: 20,
                        color: kGrayLight,
                      ),
                      controller: _nameController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PasswordTextField(
                      controller: _passwordController,
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
                              RegisterModel model = RegisterModel(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  username: _nameController.text);
                              String data = RegisterModelToJson(model);
                              c.registerFunction(data);
                            },
                            text: "SING UP",
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
