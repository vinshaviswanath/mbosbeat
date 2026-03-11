// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter_bluetooth_printer/flutter_bluetooth_printer.dart';
// import 'package:intl/intl.dart';
// import 'package:mpos_beat/core/service/invoice_pdf_service.dart';
// import 'package:mpos_beat/core/utils/imports.dart';

// class ThermalReceipt extends StatefulWidget {
//   final List<InvoiceItem> items;

//   final String invoiceNo;
//   final String customer;
//   final String date;
//   final String time;

//   final double subTotal;
//   final double sgst;
//   final double cgst;
//   final double roundOff;
//   final double grandTotal;

//   const ThermalReceipt({
//     super.key,
//     required this.items,
//     required this.invoiceNo,
//     required this.customer,
//     required this.date,
//     required this.time,
//     required this.subTotal,
//     required this.sgst,
//     required this.cgst,
//     required this.roundOff,
//     required this.grandTotal,
//   });

//   @override
//   State<ThermalReceipt> createState() => _ThermalReceiptState();
// }

// class _ThermalReceiptState extends State<ThermalReceipt> {
//   ReceiptController? controller;

//   /// PRINT FUNCTION
//   Future<void> printReceipt() async {
//     final device = await FlutterBluetoothPrinter.selectDevice(context);

//     if (device != null) {
//       controller?.print(address: device.address);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Receipt Preview")),

//       /// PRINT BUTTON
//       floatingActionButton: FloatingActionButton(
//         onPressed: printReceipt,
//         child: const Icon(Icons.print),
//       ),

//       body: SingleChildScrollView(
//         child: Receipt(
//           builder: (context) => Container(
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               children: [
//                 /// HEADER
//                 const Text(
//                   "CAKE CRUMBS",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 const Text(
//                   "edavanakad",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
//                 ),
//                 SizedBox(height: 5),
//                 const Text(
//                   "vypin",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
//                 ),
//                 SizedBox(height: 5),
//                 const Text(
//                   "PIN 683502",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
//                 ),
//                 const Text(
//                   "Kerala, India",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
//                 ),
//                 SizedBox(height: 20),
//                 const Text(
//                   "TAX INVOICE",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: DottedLine(
//                     dashLength: 6,
//                     dashGapLength: 4,
//                     lineThickness: 2,
//                     dashColor: Colors.black,
//                   ),
//                 ),

//                 /// INVOICE DETAILS
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "NO.${widget.invoiceNo}",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 4),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "DATE ${widget.date}",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                     Text(
//                       "TIME ${widget.time}",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ],
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: DottedLine(
//                     dashLength: 6,
//                     dashGapLength: 4,
//                     lineThickness: 2,
//                     dashColor: Colors.black,
//                   ),
//                 ),

//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Customer : ${widget.customer}",
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: DottedLine(
//                     dashLength: 6,
//                     dashGapLength: 4,
//                     lineThickness: 2,
//                     dashColor: Colors.black,
//                   ),
//                 ),

//                 /// TABLE HEADER
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Sl",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(width: 20),
//                     Text(
//                       "Item",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 4),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 25),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Text(
//                         "Qty",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "Rate",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "Disc",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "Amt",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: DottedLine(
//                     dashLength: 6,
//                     dashGapLength: 4,
//                     lineThickness: 2,
//                     dashColor: Colors.black,
//                   ),
//                 ),

//                 /// ITEMS
//                 ...widget.items.asMap().entries.map((entry) {
//                   int index = entry.key + 1;
//                   final item = entry.value;

//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text.rich(
//                         TextSpan(
//                           children: [
//                             TextSpan(
//                               text: "$index ",
//                               style: const TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                             TextSpan(
//                               text: "${item.name} - ${item.hsn}",
//                               style: const TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 25,
//                           top: 2,
//                           bottom: 10,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               item.qty.toString(),
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                             Text(
//                               item.rate.toStringAsFixed(2),
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                             Text(
//                               item.discount.toStringAsFixed(2),
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),

//                             Text(
//                               item.amount.toStringAsFixed(2),
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       const SizedBox(height: 4),
//                     ],
//                   );
//                 }),

//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: DottedLine(
//                     dashLength: 6,
//                     dashGapLength: 4,
//                     lineThickness: 2,
//                     dashColor: Colors.black,
//                   ),
//                 ),

//                 _row("Taxable Amt", widget.subTotal),
//                 h6,
//                 _row("SGST", widget.sgst),
//                 h6,
//                 _row("CGST", widget.cgst),
//                 h6,
//                 _row("CESS", widget.cgst),
//                 h6,
//                 _row("Round Off", widget.roundOff),
//                 h6,
//                 _row("Total", widget.grandTotal, bold: true),
//                 h6,
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: DottedLine(
//                     dashLength: 6,
//                     dashGapLength: 4,
//                     lineThickness: 2,
//                     dashColor: Colors.black,
//                   ),
//                 ),

//                 const SizedBox(height: 10),

//                 Row(
//                   children: [
//                     Text(
//                       "Printed on ${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           onInitialized: (c) {
//             controller = c;
//           },
//         ),
//       ),
//     );
//   }

//   /// AMOUNT ROW
//   Widget _row(String title, double value, {bool bold = false}) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 50),
//       child: Row(
//         children: [
//           SizedBox(
//             width: context.getSize.width / 2.5,
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: bold ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//           ),

//           SizedBox(
//             width: 10,
//             child: Text(
//               ":",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: bold ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//           ),

//           Expanded(
//             child: Text(
//               value.toStringAsFixed(2),
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: bold ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
