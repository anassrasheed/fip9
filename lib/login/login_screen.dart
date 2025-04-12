import 'package:fip9/google_map/google_map_screen.dart';
import 'package:fip9/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: loginController.key,
          child: Column(
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.1,
              // ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Image.asset(
                  'assets/step_logo.jpg',
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  enabled: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    if (!loginController.emailRegex.hasMatch(value)) {
                      return 'please enter correct email address';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Colors.green, width: 2)),
                      // label: Icon(Icons.person),
                      labelText: 'Email',
                      labelStyle:
                          const TextStyle(fontSize: 20, color: Colors.red),
                      hintText: 'Ex. Anas22',
                      errorText: loginController.usernameError,
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      hintMaxLines: 1,
                      prefixIcon: const Icon(Icons.person),
                      isDense: true,
                      fillColor: Colors.yellow,
                      filled: false,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10)),
                  maxLines: 1,
                  onTap: () {
                    print('this field is called');
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  onFieldSubmitted: (value) {
                    print('onSubmitted');
                    print(value);
                    loginController.passwordFocusNode.requestFocus();
                  },
                  onTapOutside: (value) {
                    print(value);
                    print('outside tapped');
                  },
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.text,
                  controller: loginController.usernameController,
                  focusNode: loginController.usernameFocusNode,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: GetBuilder<LoginController>(builder: (_) {
                  return TextFormField(
                    enabled: true,
                    inputFormatters: [],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      if (value.length < 6) {
                        return 'Password length is incorrect';
                      }
                      // if (!loginController.strongPasswordRegex
                      //     .hasMatch(value)) {
                      //   return 'Your password is weak';
                      // }

                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Colors.green, width: 2)),
                        // label: Icon(Icons.person),
                        labelText: 'Password',
                        errorText: loginController.passwordError,
                        labelStyle:
                            const TextStyle(fontSize: 20, color: Colors.red),
                        hintText: '',
                        suffixIcon: InkWell(
                          child: Icon(loginController.isPasswordObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onTap: () {
                            loginController.changeObscure();
                          },
                        ),
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        hintMaxLines: 1,
                        prefixIcon: const Icon(Icons.password),
                        isDense: true,
                        fillColor: Colors.yellow,
                        filled: false,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10)),
                    maxLines: 1,
                    onTap: () {
                      print('this field is called');
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    obscureText: loginController.isPasswordObscure,
                    onFieldSubmitted: (value) {
                      print('onSubmitted');
                      print(value);
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    onTapOutside: (value) {
                      print(value);
                      print('outside tapped');
                    },
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    controller: loginController.passwordController,
                    focusNode: loginController.passwordFocusNode,
                  );
                }),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).maybePop();
                    Get.back();
                  },
                  child: Text('Back')),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                    onPressed: () async {
                      // permission location
                      var status = await Permission.location.status;
                      if (status.isGranted) {
                        Get.to(GoogleMapScreen());
                      } else {
                        status = await Permission.location.request();
                        if (status.isGranted) {
                          Get.to(GoogleMapScreen());
                        } else {
                          print('error');
                        }
                      }
                      // loginController.loginWithFirebase(context);
                    },
                    child: const Text('Login')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
