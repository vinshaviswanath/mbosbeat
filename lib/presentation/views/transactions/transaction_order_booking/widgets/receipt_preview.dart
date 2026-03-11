import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mpos_beat/core/service/bluetooth_permission_service.dart';
import 'package:mpos_beat/core/service/invoice_pdf_service.dart';
import 'package:mpos_beat/core/service/pos_printing.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/printer_size_detector.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class ReceiptPreviewPage extends StatefulWidget {
  final List<InvoiceItem> items;
  final String invoiceNo;
  final String customer;
  final String date;
  final String time;

  final double subTotal;
  final double sgst;
  final double cgst;
  final double roundOff;
  final double grandTotal;

  const ReceiptPreviewPage({
    super.key,
    required this.items,
    required this.invoiceNo,
    required this.customer,
    required this.date,
    required this.time,
    required this.subTotal,
    required this.sgst,
    required this.cgst,
    required this.roundOff,
    required this.grandTotal,
  });

  @override
  State<ReceiptPreviewPage> createState() => _ReceiptPreviewPageState();
}

class _ReceiptPreviewPageState extends State<ReceiptPreviewPage> {
  @override
  void initState() {
    super.initState();
    BluetoothPermissionService.requestPermissions();
  }

  Future<void> showPrinterBottomSheet() async {
    bool granted = await BluetoothPermissionService.requestPermissions();

    if (!granted) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Bluetooth permission required to print")),
      );
      return;
    }

    final devices = await PrintBluetoothThermal.pairedBluetooths;

    if (!mounted) return;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
          height: 300,
          child: devices.isEmpty
              ? const Center(child: Text("No Bluetooth Printers Found"))
              : ListView.builder(
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    final device = devices[index];

                    return ListTile(
                      leading: const Icon(Icons.print),
                      title: Text(device.name),
                      subtitle: Text(device.macAdress),
                      onTap: () async {
                        Navigator.pop(context);

                        final printerSize = PrinterSizeDetector.detect(
                          device.name,
                        );
                        Logger.logInfo(
                          "Mac Address:: ${device.macAdress}  Printer size :: ${printerSize.name}",
                        );
                        await EscPosPrintService.printReceipt(
                          mac: device.macAdress,
                          printerSize: printerSize,
                          items: widget.items,
                          invoiceNo: widget.invoiceNo,
                          customer: widget.customer,
                          date: widget.date,
                          time: widget.time,
                          subTotal: widget.subTotal,
                          sgst: widget.sgst,
                          cgst: widget.cgst,
                          roundOff: widget.roundOff,
                          grandTotal: widget.grandTotal,
                        );
                      },
                    );
                  },
                ),
        );
      },
    );
  }

  Widget row(String title, double value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              // width: context.getSize.width / 2.5,
              child: Text(
                title,
                style: TextStyle(
                  // fontSize: 16,
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),

          Expanded(
            child: SizedBox(
              width: 10,
              child: Text(
                ":",
                textAlign: TextAlign.center,
                style: TextStyle(
                  // fontSize: 16,
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),

          Expanded(
            child: Text(
              value.toStringAsFixed(2),
              textAlign: TextAlign.right,
              style: TextStyle(
                // fontSize: 16,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Receipt Preview')),

      floatingActionButton: FloatingActionButton(
        onPressed: showPrinterBottomSheet,
        child: const Icon(Icons.print),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "CAKE CRUMBS",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 8),

                const Center(child: Text("Edavanakad")),
                const Center(child: Text("Vypin")),
                const Center(child: Text("PIN 683502")),
                const Center(child: Text("Kerala, India")),

                const SizedBox(height: 10),

                const Center(
                  child: Text(
                    "TAX INVOICE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                const Divider(),

                Text("No: ${widget.invoiceNo}"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date: ${widget.date}"),
                    Text("Time: ${widget.time}"),
                  ],
                ),

                const SizedBox(height: 6),

                Text("Customer: ${widget.customer}"),

                const Divider(),

                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text("Sl"), SizedBox(width: 30), Text("Item")],
                ),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Qty"),
                      Text("Rate"),
                      Text("Disc"),
                      Text("Amt"),
                    ],
                  ),
                ),

                const Divider(),

                /// ITEMS
                ...widget.items.asMap().entries.map((entry) {
                  int index = entry.key + 1;
                  final item = entry.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$index   ${item.name}"),

                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text(item.qty.toString())),

                            Expanded(child: Text(item.rate.toStringAsFixed(2))),

                            Expanded(
                              child: Text(item.discount.toStringAsFixed(2)),
                            ),

                            Expanded(
                              child: Text(
                                item.amount.toStringAsFixed(2),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 4),
                    ],
                  );
                }),

                const Divider(),

                row("Taxable Amt", widget.subTotal),
                row("SGST", widget.sgst),
                row("CGST", widget.cgst),
                row("CESS", widget.cgst),
                row("Round Off", widget.roundOff),
                row("TOTAL", widget.grandTotal, bold: true),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Text(
                      "Printed on ${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
