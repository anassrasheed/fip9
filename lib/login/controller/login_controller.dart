import 'package:fip9/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:fip9/configuration/current_session.dart';
import 'package:fip9/repositories/login/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  String? usernameError;
  String? passwordError;
  RxString data = ''.obs;
  Rx<String> data2 = ''.obs;

  bool isPasswordObscure = true;
  GlobalKey<FormState> key = GlobalKey();
  final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
  final RegExp emailRegex =
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  final RegExp strongPasswordRegex = RegExp(
      r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

  void changeObscure() {
    isPasswordObscure = !isPasswordObscure;
    refresh();
  }

  late LoginRepository _loginRepository;

  void loginWithApi(BuildContext context) async {
    if (key.currentState!.validate()) {
      _loginRepository = ApiLoginRepository();
      var result = await _loginRepository.login(
          usernameController.text, passwordController.text, context);
      if (result.isLeft) {
        Get.showSnackbar(GetSnackBar(
          title: 'Error',
          message: result.left.message,
          duration: const Duration(seconds: 1),
          snackPosition: SnackPosition.BOTTOM,
        ));
      } else {
        CurrentSession().apiLoginModel = result.right.apiResult;
        Get.offAll(const BottomNavBarScreen());
      }
    }
  }

  void loginWithFirebase(BuildContext context) async {
    if (key.currentState!.validate()) {
      _loginRepository = FirebaseLoginRepository();
      var result = await _loginRepository.login(
          usernameController.text, passwordController.text, context);
      if (result.isLeft) {
        Get.showSnackbar(GetSnackBar(
          title: 'Error',
          message: result.left.message,
          snackPosition: SnackPosition.BOTTOM,
        ));
      } else {
        CurrentSession session = CurrentSession(); // singelton
        session.userModel = result.right.firebaseResult;
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const BottomNavBarScreen()));
      }
    }
  }
}
