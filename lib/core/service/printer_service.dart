// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:permission_handler/permission_handler.dart';

// class PrinterService {
//   static final BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

//   static Future<void> requestPermission() async {
//     await Permission.bluetooth.request();
//     await Permission.bluetoothConnect.request();
//     await Permission.bluetoothScan.request();
//     await Permission.location.request();
//   }

//   static Future<List<BluetoothDevice>> getPairedPrinters() async {
//     await requestPermission();
//     return await bluetooth.getBondedDevices();
//   }

//   static Future<void> connectPrinter(BluetoothDevice device) async {
//     bool? connected = await bluetooth.isConnected;

//     if (connected == false) {
//       await bluetooth.connect(device);
//     }
//   }
// }