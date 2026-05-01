import 'package:permission_handler/permission_handler.dart';

enum NfcPermissionStatus { ready, disabled, unsupported }

class PermissionService {
  static Future<void> cameraPermission(
    void Function() onPermissionGranted,
  ) async {
    // statusni tekshirish
    var status = await Permission.camera.status;

    switch (status) {
      case PermissionStatus.granted:
        //ruxsat bergan bo'lsa davom etish
        onPermissionGranted();
        break;

      case PermissionStatus.denied:
        // birinchi marta so'ralayotgan bo'lsa yokida rad etilgan bo'lsa
        final result = await Permission.camera.request();
        if (result.isGranted) {
          onPermissionGranted();
        }
        break;

      case PermissionStatus.permanentlyDenied:
        // foydalanuvchi butunlay rad etgan bo'lsa settingsga jo'natamiz
        await openAppSettings();
        break;

      default:
        break;
    }
  }
}
