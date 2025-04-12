import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String password;
  String fullName;
  String mobileNumber;
  String uid;
  String? profileImage;

  UserModel(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.mobileNumber,
      required this.uid,
      this.profileImage});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": email,
      'fullName': fullName,
      'mobile': mobileNumber,
      'password': password,
      'uid': uid,
      if (profileImage != null && profileImage!.isNotEmpty)
        "profileImg": profileImage
    };
    return map;
  }

  static UserModel fromFirebaseDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> map) {
    UserModel model;
    model = UserModel(
        email: map['email'],
        password: map['password'],
        fullName: map['fullName'],
        mobileNumber: map['mobile'],
        uid: map['uid']);
    try {
      model.profileImage = map['profileImg'];
    } catch (e, s) {}
    return model;
  }
}
