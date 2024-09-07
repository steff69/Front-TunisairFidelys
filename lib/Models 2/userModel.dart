// To parse this JSON data, do
//
//     final UserModel = UserModelFromJson(jsonString);

import 'dart:convert';

UserModel UserModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String UserModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool status;
  User1 user1;

  UserModel({
    required this.status,
    required this.user1,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        user1: User1.fromJson(json["user1"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user1": user1.toJson(),
      };
}

class User1 {
  String id;
  String username;
  String email;
  String otp;
  String password;
  bool verification;
  String phone;
  bool phoneVerification;
  String userType;
  String profile;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String token;

  User1({
    required this.id,
    required this.username,
    required this.email,
    required this.otp,
    required this.password,
    required this.verification,
    required this.phone,
    required this.phoneVerification,
    required this.userType,
    required this.profile,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.token,
  });

  factory User1.fromJson(Map<String, dynamic> json) => User1(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        otp: json["otp"],
        password: json["password"],
        verification: json["verification"],
        phone: json["phone"],
        phoneVerification: json["phoneVerification"],
        userType: json["userType"],
        profile: json["profile"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "otp": otp,
        "password": password,
        "verification": verification,
        "phone": phone,
        "phoneVerification": phoneVerification,
        "userType": userType,
        "profile": profile,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "token": token,
      };
}
