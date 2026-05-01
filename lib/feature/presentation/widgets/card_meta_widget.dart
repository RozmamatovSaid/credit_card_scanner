import 'package:card_scan_app/core/constants/app_text_styles.dart';
import 'package:card_scan_app/core/extensions/sizedbox_extension.dart';
import 'package:card_scan_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CardMeta extends StatelessWidget {
  const CardMeta({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        AppText(
          title,
          style: AppTextStyles.cardMetaLabel,
        ),
        6.height,
        AppText(
          value,
          style: AppTextStyles.cardMetaValue,
        ),
      ],
    );
  }
}
