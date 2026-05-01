import 'package:card_scan_app/core/constants/app_colors.dart';
import 'package:card_scan_app/core/constants/app_strings.dart';
import 'package:card_scan_app/core/extensions/sizedbox_extension.dart';
import 'package:card_scan_app/core/input_formatter/input_formatters.dart';
import 'package:card_scan_app/core/widgets/app_container.dart';
import 'package:card_scan_app/core/widgets/app_text.dart';
import 'package:card_scan_app/core/constants/app_text_styles.dart';
import 'package:card_scan_app/core/widgets/app_textfield.dart';
import 'package:card_scan_app/feature/presentation/mixins/main_mixin.dart';
import 'package:card_scan_app/feature/presentation/widgets/action_button.dart';
import 'package:card_scan_app/feature/presentation/bloc/scanner_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with MainMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider(
        create: (context) => ScannerBloc(),
        child: Scaffold(
          body: BlocListener<ScannerBloc, ScannerState>(
            listener: scannerListener,
            child: AppContainer(
              width: .infinity,
              height: .infinity,
              gradient: const LinearGradient(
                begin: .topLeft,
                end: .bottomRight,
                colors: [AppColors.linerBlue, AppColors.linerBlue2],
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const .fromLTRB(20, 16, 20, 24),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      18.height,
                      const AppText(
                        AppStrings.addCardTitle,
                        style: AppTextStyles.addCardTitle,
                      ),
                      10.height,
                      const AppText(
                        AppStrings.addCardDescription,
                        style: AppTextStyles.addCardDescription,
                      ),
                      24.height,
                      AppContainer(
                        padding: const .all(20),
                        radius: .circular(28),
                        color: AppColors.nightWhite,
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            const AppText(
                              AppStrings.panLabel,
                              style: AppTextStyles.fieldLabel,
                            ),
                            10.height,
                            AppTextField(
                              controller: panController,
                              hintText: AppStrings.panHint,
                              inputFormatters: [CardNumberFormatter()],
                            ),
                            18.height,
                            const AppText(
                              AppStrings.expiryLabel,
                              style: AppTextStyles.fieldLabel,
                            ),
                            10.height,
                            AppTextField(
                              controller: expiryController,
                              hintText: AppStrings.expiryHint,
                              keyboardType: TextInputType.datetime,
                              inputFormatters: [ExpiryDateFormatter()],
                            ),
                            24.height,
                            const AppText(
                              AppStrings.scanMethodsTitle,
                              style: AppTextStyles.sectionTitle,
                            ),
                            12.height,
                            BlocBuilder<ScannerBloc, ScannerState>(
                              builder: (context, state) {
                                return ActionButton(
                                  icon: Icons.camera_alt_rounded,
                                  title: AppStrings.cameraScanTitle,
                                  subtitle: AppStrings.cameraScanSubtitle,
                                  onTap: () =>
                                      cameraOnTap(state: state, ctx: context),
                                );
                              },
                            ),
                            12.height,
                            ActionButton(
                              icon: Icons.nfc_rounded,
                              title: AppStrings.nfcScanTitle,
                              subtitle: AppStrings.nfcScanSubtitle,
                              onTap: () => nfcOnTap(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
