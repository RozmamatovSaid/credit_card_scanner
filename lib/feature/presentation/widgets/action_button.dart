import 'package:card_scan_app/core/constants/app_colors.dart';
import 'package:card_scan_app/core/constants/app_constants.dart';
import 'package:card_scan_app/core/constants/app_text_styles.dart';
import 'package:card_scan_app/core/extensions/sizedbox_extension.dart';
import 'package:card_scan_app/core/widgets/app_container.dart';
import 'package:card_scan_app/core/widgets/app_inkwell.dart';
import 'package:card_scan_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      borderRadius: .circular(22),
      child: AppContainer(
        padding: const .all(16),
        radius: .circular(22),
        color: AppColors.white,
        border: .all(color: AppColors.skyBlueOpacity),
        boxShadow: AppConstants.boxShadowActionButton,
        child: Row(
          children: [
            AppContainer(
              width: 52,
              height: 52,
              alignment: .center,
              radius: .circular(18),
              gradient: const LinearGradient(
                colors: [AppColors.linerBlue, AppColors.linerBlue2],
              ),
              child: Icon(icon, color: AppColors.white, size: 24),
            ),
            14.width,
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  AppText(title, style: AppTextStyles.actionTitle),
                  6.height,
                  AppText(subtitle, style: AppTextStyles.actionSubtitle),
                ],
              ),
            ),
            12.width,
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColors.nightSilver,
            ),
          ],
        ),
      ),
    );
  }
}
