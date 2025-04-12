import 'package:fip9/login/model/login_response.dart';
import 'package:fip9/models/user_model.dart';

class CurrentSession {
  // cached
  CurrentSession._private();

  static final CurrentSession _shared = CurrentSession._private();

  factory CurrentSession() => _shared;

  UserModel? userModel;
  LoginModel? apiLoginModel;
}
