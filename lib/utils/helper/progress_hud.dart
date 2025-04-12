import 'package:fip9/configuration/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressHud {
  static final ProgressHud _shared = ProgressHud._private();

  ProgressHud._private();

  factory ProgressHud() => _shared;

  BuildContext? context;

  Widget createLoadingView({Color? color, double size = 50}) {
    return Stack(
      children: [
        SpinKitCircle(
          color: color ?? AppColors.primaryColor,
          size: size,
        )
      ],
    );
  }

  void startLoading(BuildContext context) {
    this.context = context;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return createLoadingView();
        });
  }

  void stopLoading() {
    try {
      if (context != null && Navigator.of(context!).canPop()) {
        Navigator.of(context!, rootNavigator: true).pop('Discard');
        context = null;
      }
    } catch (_) {}
  }
}
