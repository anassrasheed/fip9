// oop
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:fip9/models/user_model.dart';
import 'package:fip9/utils/helper/progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../login/model/login_response.dart';
import '../common/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponse>> login(
      String email, String password, BuildContext context,
      {bool showLoading = true});
}

class ApiLoginRepository extends LoginRepository {
  @override
  Future<Either<Failure, LoginResponse>> login(
      String email, String password, BuildContext context,
      {bool showLoading = true}) async {
    try {
      ProgressHud().startLoading(context);
      var body = jsonEncode({"email": email, "password": password});
      var url = Uri.parse('http://173.212.197.212:8888/api/v1/auth/login');
      var response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      ProgressHud().stopLoading();
      if (response.statusCode >= 200 && response.statusCode < 300) {
        LoginResponse loginResponse = LoginResponse.fromRawJson(response.body);
        if (loginResponse.success == false) {
          return Left(Failure(
              errorCode: 0,
              message: loginResponse.message ?? 'Invalid credintals'));
          // show error dialog
        } else {
          return Right(loginResponse);
        }
      } else {
        return Left(Failure(
            errorCode: 0,
            message: '${response.statusCode} Invalid Credintals'));
      }
    } catch (e) {
      ProgressHud().stopLoading();
      return const Left(Failure(errorCode: 0, message: 'something went wrong'));
    }
  }
}

class FirebaseLoginRepository extends LoginRepository {
  @override
  Future<Either<Failure, LoginResponse>> login(
      String email, String password, BuildContext context,
      {bool showLoading = true}) async {
    try {
      ProgressHud().startLoading(context);
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (result.user != null) {
        print('user signed in successfully');
        // get the user details from firestore
        var databaseResult = await FirebaseFirestore.instance
            .collection('users')
            .where('uid', isEqualTo: result.user!.uid)
            .get();
        ProgressHud().stopLoading();

        UserModel user =
            UserModel.fromFirebaseDocument(databaseResult.docs.first);
        return Right(LoginResponse(
            message: 'success',
            code: 200,
            firebaseResult: user,
            success: true));
      } else {
        return Left(Failure(errorCode: 2, message: "imvaid credintals"));
      }
    } catch (e, stackTrace) {
      print(e.toString());
      print(stackTrace.toString());
      ProgressHud().stopLoading();
      return Left(Failure(errorCode: 1, message: e.toString()));
    }
  }
}
