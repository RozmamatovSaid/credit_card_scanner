import 'dart:ui';

import 'package:card_scan_app/core/constants/app_colors.dart';
import 'package:card_scan_app/core/constants/app_strings.dart';
import 'package:card_scan_app/core/errors/nfc_errors.dart';
import 'package:card_scan_app/core/extensions/sizedbox_extension.dart';
import 'package:card_scan_app/core/service/nfc_service.dart';
import 'package:card_scan_app/core/service/permission_service.dart';
import 'package:card_scan_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:card_scan_app/feature/presentation/bloc/scanner_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

mixin MainMixin<T extends StatefulWidget> on State<T> {
  final TextEditingController panController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();

  void scannerListener(BuildContext context, ScannerState state) {
    if (state.status.isSuccess) {
      panController.text = state.cardDetails!.cardNumber;
      expiryController.text = state.cardDetails!.expiryDate;
    }
  }

  void cameraOnTap({required ScannerState state, required BuildContext ctx}) {
    PermissionService.cameraPermission(() {
      ctx.read<ScannerBloc>().add(ScanEvent());
    });
  }

  Future<void> nfcOnTap() async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: AlertDialog(
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(borderRadius: .circular(20)),
              content: SizedBox(
                width: 300,
                height: 190,
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Row(
                      crossAxisAlignment: .end,
                      mainAxisAlignment: .end,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.pop();
                            if (context.mounted) {
                              NativeNfcService.stop();
                            }
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                    Icon(Icons.nfc_rounded, size: 48),
                    16.height,
                    AppText(
                      AppStrings.nfcHoldCardNearPhone,
                      textAlign: .center,
                    ),
                    16.height,
                    CircularProgressIndicator(color: AppColors.linerBlue2),
                  ],
                ),
              ),
            ),
          );
        },
      );

      final card = await NativeNfcService.startNfcCard();

      if (!mounted) return;

      context.pop();

      panController.text = card.pan;
      expiryController.text = card.expiry;
      await NativeNfcService.stop();
    } catch (e) {
      if (!mounted) return;

      context.pop();
      await NativeNfcService.stop();
      Fluttertoast.showToast(
        msg: nfcStatusMessage(mapNfcError(e)),
        backgroundColor: AppColors.white,
        textColor: AppColors.linerBlue,
        gravity: ToastGravity.TOP,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  @override
  void dispose() {
    panController.dispose();
    expiryController.dispose();
    super.dispose();
  }
}
