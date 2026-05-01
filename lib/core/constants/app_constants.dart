import 'package:card_scan_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppConstants {
  const AppConstants._();

  static final List<BoxShadow> boxShadowCardPreview = [
    BoxShadow(
      color: AppColors.black.withValues(alpha: 0.2),
      blurRadius: 24,
      offset: const Offset(0, 12),
    ),
  ];
  static final List<BoxShadow> boxShadowActionButton = [
    BoxShadow(
      color: AppColors.black.withValues(alpha: 0.05),
      blurRadius: 18,
      offset: const Offset(0, 8),
    ),
  ];
}
