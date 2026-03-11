import 'package:flutter/material.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class BluetoothPrinterListScreen extends StatefulWidget {
  const BluetoothPrinterListScreen({super.key});

  @override
  State<BluetoothPrinterListScreen> createState() =>
      _BluetoothPrinterListScreenState();
}

class _BluetoothPrinterListScreenState
    extends State<BluetoothPrinterListScreen> {
  List<BluetoothInfo> devices = [];

  @override
  void initState() {
    super.initState();
    loadDevices();
  }

  Future<void> loadDevices() async {
    final list = await PrintBluetoothThermal.pairedBluetooths;
    setState(() => devices = list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Printer")),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          final device = devices[index];

          return ListTile(
            title: Text(device.name),
            subtitle: Text(device.macAdress),
            onTap: () {
              Navigator.pop(context, device.macAdress);
            },
          );
        },
      ),
    );
  }
}