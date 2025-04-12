import 'dart:io';
import 'dart:math';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fip9/configuration/firebase_error_messages.dart';
import 'package:fip9/login/login_screen.dart';
import 'package:fip9/models/user_model.dart';
import 'package:fip9/utils/helper/progress_hud.dart';
import 'package:fip9/utils/ui/custom_button.dart';
import 'package:fip9/utils/ui/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

const AndroidNotificationChannel androidChannel = AndroidNotificationChannel(
    "FIP0_channel", "FIP9-Channel",
    importance: Importance.max, playSound: true, enableVibration: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  FocusNode _emailFocus = FocusNode();
  String _emailError = '';

  TextEditingController _fullNameController = TextEditingController();
  FocusNode _fullNameFocus = FocusNode();
  String _fullNameError = '';

  TextEditingController _mobileController = TextEditingController();
  FocusNode _mobileFocus = FocusNode();
  String _mobileError = '';

  TextEditingController _passwordController = TextEditingController();
  FocusNode _passwordFocus = FocusNode();
  String _passwordError = '';

  bool _isObscure = true;
  XFile? xfile;

  final GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    _initNotification();
    try {
      // FirebaseCrashlytics.instance.crash();
      // throw Exception('Test Crash');
    } catch (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _key,
          child: Column(
            children: [
              _getProfileImageView(),
              const SizedBox(
                height: 10,
              ),
              CustomTextField().createTextField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  label: 'Email',
                  hint: 'test@gmail.com',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill your email';
                    }

                    return null;
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomTextField().createTextField(
                  controller: _fullNameController,
                  focusNode: _fullNameFocus,
                  label: 'Full name',
                  hint: 'Anas Rasheed',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill your name';
                    }
                    if (value.split(" ").length < 2) {
                      return 'Please fill your full name ';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomTextField().createTextField(
                  controller: _mobileController,
                  focusNode: _mobileFocus,
                  label: 'Mobile number',
                  hint: '009627XXXXXXXX',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill your mobile number';
                    }
                    if (value.length < 9) {
                      return 'Please enter correct mobile number';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomTextField().createTextField(
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  isObscure: _isObscure,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill your password';
                    }
                    if (value.length < 6) {
                      return 'please enter hard password';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  label: 'Password',
                  hint: 'P@ssw0rd'),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                  title: "show notification",
                  onPressed: () {
                    flutterLocalNotificationsPlugin.show(
                        1,
                        "Test",
                        "this is a test message",
                        NotificationDetails(
                            android: AndroidNotificationDetails(
                                androidChannel.id, androidChannel.name,
                                playSound: androidChannel.playSound,
                                importance: androidChannel.importance,
                                enableVibration: androidChannel.enableVibration,
                                icon: "@mipmap/ic_launcher",
                                styleInformation:
                                    BigTextStyleInformation('AAAA')),
                            iOS: DarwinNotificationDetails(
                                presentBadge: true, presentSound: true)));
                  }),
              CustomButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      ProgressHud().startLoading(context);
                      // _register data firebase
                      try {
                        UserCredential result = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text);
                        if (result.user != null) {
                          // add Image to Firebase Storage
                          String? imgUrl;
                          if (xfile != null) {
                            imgUrl =
                                await saveImageToStorage(File(xfile!.path));
                          }

                          // save the other into cloud firestore
                          UserModel user = UserModel(
                              email: _emailController.text,
                              password: _passwordController.text,
                              fullName: _fullNameController.text,
                              mobileNumber: _mobileController.text,
                              uid: result.user!.uid);
                          if (imgUrl != null && imgUrl.isNotEmpty) {
                            user.profileImage = imgUrl;
                          }
                          var insertResult = await FirebaseFirestore.instance
                              .collection('users')
                              .add(user.toJson()); // json Map  {key : value}
                        }
                        ProgressHud().stopLoading();
                      } on FirebaseException catch (e, stacktrace) {
                        ProgressHud().stopLoading();
                        showDialog<void>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text(
                                    FirebaseErrors.getMessage(e.code ?? '')),
                                actions: [
                                  CustomButton(
                                      title: 'Ok',
                                      width: 100,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      })
                                ],
                              );
                            });
                      } catch (e, stacktrace) {
                        print(e.toString());
                        print(stacktrace.toString());
                        ProgressHud().stopLoading();
                      }
                    }
                  },
                  title: 'Register'),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  title: 'Login',
                  width: MediaQuery.of(context).size.width * 0.8,
                  onPressed: () {
                    Get.off(LoginScreen()); // pushReplacement
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (_) => LoginScreen()));
                  }),
            ],
          ),
        ),
      )),
    );
  }

  _getProfileImageView() {
    return InkWell(
      onTap: () {
        showAdaptiveActionSheet(
            context: context,
            title: Text('Choose option'),
            androidBorderRadius: 30,
            isDismissible: true,
            actions: [
              BottomSheetAction(
                  title: Text('Camera'),
                  onPressed: (v) {
                    _pickImage(ImageSource.camera);
                  }),
              BottomSheetAction(
                  title: Text('Gallery'),
                  onPressed: (v) {
                    _pickImage(ImageSource.gallery);
                  }),
            ],
            cancelAction: CancelAction(title: Text('Cancel')));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2)),
        child: xfile == null
            ? Icon(Icons.photo)
            : ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.file(
                  File(xfile!.path),
                  fit: BoxFit.fill,
                )),
      ),
    );
  }

  void _pickImage(ImageSource source) async {
    Navigator.of(context, rootNavigator: true).pop();
    ImagePicker picker = ImagePicker();
    xfile = await picker.pickImage(source: source);
    setState(() {});
  }

  Future<String> saveImageToStorage(File file) async {
    try {
      Reference storageReference = FirebaseStorage.instance.ref();
      String fileName = 'FIP9_' +
          DateTime.now().millisecondsSinceEpoch.toString() +
          Random().nextInt(1000).toString();
      Reference imgRef =
          storageReference.child('images/' + fileName.toString() + '.jpg');
      await imgRef.putFile(file);
      return imgRef.getDownloadURL();
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      print('upload error');
      print(e.toString());
      return '';
    }
  }

  void _initNotification() async {
    await flutterLocalNotificationsPlugin.initialize(InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings()));

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);
  }
}
