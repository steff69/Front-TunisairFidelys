import 'dart:convert';

RegisterModel RegisterModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String RegisterModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String email;
  String password;
  String username;

  RegisterModel({
    required this.email,
    required this.password,
    required this.username,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        email: json["email"],
        password: json["password"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "username": username,
      };
}
