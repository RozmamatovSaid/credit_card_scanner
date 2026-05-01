import 'package:card_scan_app/core/constants/app_strings.dart';
import 'package:card_scan_app/feature/domain/entity/nfc_card_data.dart';
import 'package:flutter/services.dart';

class NativeNfcService {
  static const MethodChannel _channel = MethodChannel('native_nfc_card');

  static Future<NfcCardData> startNfcCard() async {
    final result = await _channel.invokeMethod<Map>('startNfc');

    if (result == null) {
      throw Exception(AppStrings.nfcNoDataReturned);
    }

    return NfcCardData(
      pan: result['pan'].toString(),
      expiry: result['expiry'].toString(),
    );
  }

  static Future<void> stop() async {
    await _channel.invokeMethod('stopNfc');
  }
}
