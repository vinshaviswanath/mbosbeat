import 'package:permission_handler/permission_handler.dart';

class BluetoothPermissionService {

  static Future<bool> requestPermissions() async {

    final scan = await Permission.bluetoothScan.request();
    final connect = await Permission.bluetoothConnect.request();
    final location = await Permission.location.request();

    if (scan.isGranted && connect.isGranted && location.isGranted) {
      return true;
    }

    if (scan.isPermanentlyDenied ||
        connect.isPermanentlyDenied ||
        location.isPermanentlyDenied) {
      await openAppSettings();
    }

    return false;
  }

}