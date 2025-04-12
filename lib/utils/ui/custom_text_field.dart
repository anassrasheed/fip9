import 'package:fip9/configuration/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField {
  static final CustomTextField _shared = CustomTextField._private();

  factory CustomTextField() => _shared;

  CustomTextField._private();

  Widget createTextField(
      {required TextEditingController controller,
      FocusNode? focusNode,
      bool isObscure = false,
      Widget? suffixIcon,
      Widget? prefixIcon,
      required String label,
      String? hint,
      FormFieldValidator<String>? validator,
      double borderRadius = 12}) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      obscureText: isObscure,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          label: Text(
            label,
            style: const TextStyle(color: AppColors.textColor, fontSize: 16),
          ),
          hintText: hint,
          hintStyle:
              const TextStyle(color: AppColors.primaryColor, fontSize: 12),
          border: _getBorderStyle(borderRadius),
          enabledBorder: _getBorderStyle(borderRadius),
          focusedBorder: _getBorderStyle(borderRadius),
          disabledBorder: _getBorderStyle(borderRadius)),
    );
  }

  _getBorderStyle(double? borderRadius) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        borderSide: const BorderSide(color: AppColors.borderColor));
  }
}
