import 'dart:convert';

import 'package:fip9/models/user_model.dart';

class LoginResponse {
  final bool success;
  final int code;
  final String message;
  final LoginModel? apiResult;
  final UserModel? firebaseResult;
  LoginResponse({
    required this.success,
    required this.code,
    required this.message,
    this.apiResult,
    this.firebaseResult,
  });

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        apiResult: LoginModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "result": apiResult?.toJson(),
      };
}

class LoginModel {
  final String accessToken;
  final String tokenType;
  final User user;

  LoginModel({
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["accessToken"],
        tokenType: json["tokenType"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "tokenType": tokenType,
        "user": user.toJson(),
      };
}

class User {
  final int id;
  final String fullName;
  final String email;
  final int zipCode;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.zipCode,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        zipCode: json["zipCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "zipCode": zipCode,
      };
}
