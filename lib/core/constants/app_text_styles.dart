import 'package:card_scan_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle addCardTitle = TextStyle(
    color: AppColors.white,
    fontSize: 30,
    fontWeight: FontWeight.w800,
    height: 1.1,
  );

  static const TextStyle addCardDescription = TextStyle(
    color: AppColors.white,
    fontSize: 15,
    height: 1.5,
  );

  static const TextStyle fieldLabel = TextStyle(
    color: AppColors.textDark,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle sectionTitle = TextStyle(
    color: AppColors.textDark,
    fontSize: 17,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle actionTitle = TextStyle(
    color: AppColors.textDark,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle actionSubtitle = TextStyle(
    color: AppColors.nightSilver,
    fontSize: 12,
    height: 1.45,
  );

  static const TextStyle cardMetaLabel = TextStyle(
    color: Color(0xA6FFFFFF),
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3,
  );

  static const TextStyle cardMetaValue = TextStyle(
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
  );

  static const TextStyle inputText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static final TextStyle inputHint = TextStyle(
    fontSize: 20,
    color: AppColors.textDark.withValues(alpha: 0.35),
  );
}
