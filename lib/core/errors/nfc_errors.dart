import 'package:card_scan_app/core/constants/app_strings.dart';
import 'package:card_scan_app/core/enums/enums.dart';
import 'package:flutter/services.dart';

NfcStatus mapNfcError(Object error) {
  if (error is! PlatformException) {
    return NfcStatus.unknown;
  }

  switch (error.code) {
    case 'NFC_UNSUPPORTED':
      return NfcStatus.unsupported;

    case 'NFC_DISABLED':
      return NfcStatus.disabled;

    case 'READ_FAILED':
      return NfcStatus.readFailed;

    case 'NFC_ERROR':
      final message = error.message?.toLowerCase() ?? '';

      if (message.contains('tag was lost')) {
        return NfcStatus.tagLost;
      }

      return NfcStatus.unknown;

    default:
      return NfcStatus.unknown;
  }
}
 
 
String nfcStatusMessage(NfcStatus status) {
  switch (status) {
    case NfcStatus.unsupported:
      return AppStrings.nfcUnsupported;

    case NfcStatus.disabled:
      return AppStrings.nfcDisabled;

    case NfcStatus.tagLost:
      return AppStrings.nfcTagLost;

    case NfcStatus.readFailed:
      return AppStrings.nfcReadFailed;

    case NfcStatus.unknown:
      return AppStrings.nfcUnknownError;
  }
}
