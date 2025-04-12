import 'dart:convert';

class IntroResponse {
  final bool success;
  final int code;
  final String message;
  final List<IntroModel> result;

  IntroResponse({
    required this.success,
    required this.code,
    required this.message,
    required this.result,
  });

  factory IntroResponse.fromRawJson(String str) =>
      IntroResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IntroResponse.fromJson(Map<String, dynamic> json) => IntroResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        result: List<IntroModel>.from(
            json["result"].map((x) => IntroModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class IntroModel {
  final int id;
  final String key;
  final String imageUrl;
  final String imageName;
  final String title;
  final String description;

  IntroModel({
    required this.id,
    required this.key,
    required this.imageUrl,
    required this.imageName,
    required this.title,
    required this.description,
  });

  factory IntroModel.fromRawJson(String str) =>
      IntroModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IntroModel.fromJson(Map<String, dynamic> json) => IntroModel(
        id: json["id"],
        key: json["key"],
        imageUrl: json["imageUrl"],
        imageName: json["imageName"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "imageUrl": imageUrl,
        "imageName": imageName,
        "title": title,
        "description": description,
      };
}
