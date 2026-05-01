import 'package:card_scan_app/core/constants/app_colors.dart';
import 'package:card_scan_app/core/constants/app_strings.dart';
import 'package:card_scan_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType ?? .number,
      textAlign: .start,
      onChanged: onChanged,
      style: AppTextStyles.inputText,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const .symmetric(vertical: 16, horizontal: 14),
        border: OutlineInputBorder(
          borderRadius: .circular(16),
          borderSide: .none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(16),
          borderSide: .none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(16),
          borderSide: const BorderSide(color: AppColors.linerBlue2, width: 1.2),
        ),
        hintText: hintText ?? AppStrings.defaultInputHint,
        hintStyle: AppTextStyles.inputHint,
      ),
    );
  }
}
