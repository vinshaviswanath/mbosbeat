import 'dart:typed_data';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import 'package:mpos_beat/core/service/invoice_pdf_service.dart';
import 'package:mpos_beat/core/utils/enums.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class EscPosPrintService {
  static Future<void> printReceipt({
    required String mac,
    required List<InvoiceItem> items,
    required PrinterSize printerSize,
    required String invoiceNo,
    required String customer,
    required String date,
    required String time,
    required double subTotal,
    required double sgst,
    required double cgst,
    required double roundOff,
    required double grandTotal,
  }) async {
    /// Detect paper
    final paper = PosPrintHelpers._getPaperSize(printerSize);

    /// Dynamic line width based on printer size
    final lineWidth = PosPrintHelpers._getLineWidth(printerSize);

    /// Dynamic font heights based on printer size
    final textHeight = PosPrintHelpers._getTextHeight(
      printerSize,
      isLarge: true,
    );
    final smallTextHeight = PosPrintHelpers._getTextHeight(
      printerSize,
      isLarge: false,
    );

    final profile = await CapabilityProfile.load();
    final generator = Generator(paper, profile);

    /// Optimize spacing for different printer sizes
    PosPrintHelpers._configureSpacing(generator, printerSize);

    List<int> bytes = [];

    if (printerSize == PrinterSize.mm58) {
      // Use PDF to image method for 58mm
      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat(
            58 * PdfPageFormat.mm,
            300 * PdfPageFormat.mm,
            marginAll: 0,
          ),
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Text(
                    "CAKE CRUMBS",
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.SizedBox(height: 8),
                pw.Center(
                  child: pw.Text(
                    "Edavanakad",
                    style: pw.TextStyle(fontSize: 8),
                  ),
                ),
                pw.Center(
                  child: pw.Text("Vypin", style: pw.TextStyle(fontSize: 8)),
                ),
                pw.Center(
                  child: pw.Text(
                    "PIN 683502",
                    style: pw.TextStyle(fontSize: 8),
                  ),
                ),
                pw.Center(
                  child: pw.Text(
                    "Kerala, India",
                    style: pw.TextStyle(fontSize: 8),
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Center(
                  child: pw.Text(
                    "TAX INVOICE",
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                pw.Divider(),
                pw.Text("No: $invoiceNo", style: pw.TextStyle(fontSize: 8)),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Date: $date", style: pw.TextStyle(fontSize: 8)),
                    pw.Text("Time: $time", style: pw.TextStyle(fontSize: 8)),
                  ],
                ),
                pw.SizedBox(height: 6),
                pw.Text(
                  "Customer: $customer",
                  style: pw.TextStyle(fontSize: 8),
                ),
                pw.Divider(),

                /// HEADER
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text("Sl", style: pw.TextStyle(fontSize: 8)),
                    pw.SizedBox(width: 30),
                    pw.Text("Item", style: pw.TextStyle(fontSize: 8)),
                  ],
                ),
                pw.SizedBox(height: 4),
                pw.Padding(
                  padding: pw.EdgeInsets.only(left: 30),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("Qty", style: pw.TextStyle(fontSize: 8)),
                      pw.Text("Rate", style: pw.TextStyle(fontSize: 8)),
                      pw.Text("Amt", style: pw.TextStyle(fontSize: 8)),
                    ],
                  ),
                ),
                pw.Divider(),

                /// ITEMS
                ...items.asMap().entries.map((entry) {
                  int index = entry.key + 1;
                  final item = entry.value;
                  return pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "$index   ${item.name}",
                        style: pw.TextStyle(fontSize: 8),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.only(left: 30),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                item.qty.toString(),
                                style: pw.TextStyle(fontSize: 8),
                              ),
                            ),
                            pw.Expanded(
                              child: pw.Text(
                                item.rate.toStringAsFixed(2),
                                style: pw.TextStyle(fontSize: 8),
                              ),
                            ),
                            pw.Expanded(
                              child: pw.Text(
                                item.discount.toStringAsFixed(2),
                                style: pw.TextStyle(fontSize: 8),
                              ),
                            ),
                            pw.Expanded(
                              child: pw.Text(
                                item.amount.toStringAsFixed(2),
                                textAlign: pw.TextAlign.right,
                                style: pw.TextStyle(fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.SizedBox(height: 4),
                    ],
                  );
                }),
                pw.Divider(),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Taxable Amt"),
                    pw.Text(subTotal.toStringAsFixed(2)),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [pw.Text("SGST"), pw.Text(sgst.toStringAsFixed(2))],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [pw.Text("CGST"), pw.Text(cgst.toStringAsFixed(2))],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [pw.Text("CESS"), pw.Text(cgst.toStringAsFixed(2))],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Round Off"),
                    pw.Text(roundOff.toStringAsFixed(2)),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "TOTAL",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(grandTotal.toStringAsFixed(2)),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  children: [
                    pw.Text(
                      "Printed on ${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}",
                      style: pw.TextStyle(fontSize: 8),
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
              ],
            );
          },
        ),
      );
      final Uint8List pdfData = await pdf.save();
      final raster = await Printing.raster(pdfData, pages: [0], dpi: 150).first;
      final imageBytes = raster.toPng();
      final img.Image image = img.decodePng(await imageBytes)!;
      bytes += generator.image(image, align: PosAlign.center);
    } else {
      // Use text-based method for 80mm and above
      String dottedLine() => "-" * lineWidth;

      final normal = PosStyles(
        height: smallTextHeight,
        width: PosTextSize.size1,
      );

      final bold = PosStyles(
        bold: true,
        height: smallTextHeight,
        width: PosTextSize.size1,
      );

      final boldRight = PosStyles(
        bold: true,
        align: PosAlign.right,
        height: smallTextHeight,
        width: PosTextSize.size1,
      );

      /// HEADER
      bytes += generator.text(
        "CAKE CRUMBS",
        styles: PosStyles(
          align: PosAlign.center,
          bold: true,
          height: textHeight,
          width: PosTextSize.size2,
        ),
      );
      bytes += generator.text(
        "Edavanakad",
        styles: PosStyles(align: PosAlign.center, height: smallTextHeight),
      );
      bytes += generator.feed(0);

      bytes += generator.text(
        "Vypin",
        styles: PosStyles(align: PosAlign.center, height: smallTextHeight),
      );
      bytes += generator.feed(0);

      bytes += generator.text(
        "PIN 683502",
        styles: PosStyles(align: PosAlign.center, height: smallTextHeight),
      );
      bytes += generator.feed(0);

      bytes += generator.text(
        "Kerala, India",
        styles: PosStyles(align: PosAlign.center, height: smallTextHeight),
      );
      // Add minimal spacing for 58mm printers
      if (printerSize == PrinterSize.mm58) {
        bytes += generator.feed(0);
      }
      bytes += generator.text(
        "TAX INVOICE",
        styles: PosStyles(
          align: PosAlign.center,
          bold: true,
          height: textHeight,
          width: PosTextSize.size2,
        ),
      );
      bytes += generator.text(dottedLine());

      /// INVOICE DETAILS
      bytes += generator.row([
        PosColumn(width: 6, text: "NO.$invoiceNo", styles: normal),
        PosColumn(width: 6, text: ""),
      ]);
      bytes += generator.row([
        PosColumn(width: 6, text: "DATE $date", styles: normal),
        PosColumn(
          width: 6,
          text: "TIME $time",
          styles: PosStyles(align: PosAlign.right, height: textHeight),
        ),
      ]);
      bytes += generator.text(dottedLine());
      bytes += generator.text("Customer : $customer", styles: normal);
      bytes += generator.text(dottedLine());

      /// TABLE HEADER
      final itemNameWidth = PosPrintHelpers._getItemNameColumnWidth(
        printerSize,
      );
      final slWidth = PosPrintHelpers._getSlColumnWidth(printerSize);
      final qtyWidth = PosPrintHelpers._getQtyColumnWidth(printerSize);
      final rateWidth = PosPrintHelpers._getRateColumnWidth(printerSize);
      final amtWidth = PosPrintHelpers._getAmtColumnWidth(printerSize);

      bytes += generator.row([
        PosColumn(width: slWidth, text: "Sl", styles: bold),
        PosColumn(width: itemNameWidth, text: "Item name-HSN", styles: bold),
      ]);
      bytes += generator.row([
        PosColumn(width: 3, text: ""),
        PosColumn(width: 3, text: "Qty", styles: boldRight),
        PosColumn(width: 3, text: "Rate", styles: boldRight),
        PosColumn(width: 3, text: "Amt", styles: boldRight),
      ]);
      bytes += generator.text(dottedLine());

      /// ITEMS
      int sl = 1;
      for (final item in items) {
        bytes += generator.row([
          PosColumn(width: slWidth, text: "$sl", styles: normal),
          PosColumn(
            width: itemNameWidth,
            text:
                "${ReceiptFormatter.formatItemName(item.name, printerSize)} - ${item.hsn}",
            styles: normal,
          ),
        ]);
        // Remove extra spacing between item rows for 58mm
        // if (printerSize == PrinterSize.mm58) {
        //   bytes += generator.feed(0);
        // }
        bytes += generator.row([
          PosColumn(width: 3, text: ""),
          PosColumn(
            width: 3,
            text: item.qty.toString(),
            styles: PosStyles(align: PosAlign.right, height: smallTextHeight),
          ),
          PosColumn(
            width: 3,
            text: item.rate.toStringAsFixed(2),
            styles: PosStyles(align: PosAlign.right, height: smallTextHeight),
          ),
          PosColumn(
            width: 3,
            text: item.amount.toStringAsFixed(2),
            styles: PosStyles(align: PosAlign.right, height: smallTextHeight),
          ),
        ]);
        sl++;
      }
      bytes += generator.text(dottedLine());

      /// TOTALS
      bytes += totalRow(generator, "Taxable Amt", subTotal, smallTextHeight);
      bytes += totalRow(generator, "SGST", sgst, smallTextHeight);
      bytes += totalRow(generator, "CGST", cgst, smallTextHeight);
      bytes += totalRow(generator, "CESS", cgst, smallTextHeight);
      bytes += totalRow(generator, "Round Off", roundOff, smallTextHeight);
      bytes += generator.text(dottedLine());
      bytes += totalRow(generator, "TOTAL", grandTotal, smallTextHeight);
      bytes += generator.text(dottedLine());
      bytes += generator.text(
        "Printed ${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())}",
        styles: PosStyles(height: smallTextHeight),
      );
    }

    // Reduced final spacing for 58mm printers
    final finalFeed = printerSize == PrinterSize.mm58 ? 0 : 2;
    bytes += generator.feed(finalFeed);
    bytes += generator.cut();

    /// CONNECT PRINTER
    bool connected = await PrintBluetoothThermal.connectionStatus;

    if (!connected) {
      connected = await PrintBluetoothThermal.connect(macPrinterAddress: mac);
    }

    if (connected) {
      await PrintBluetoothThermal.writeBytes(bytes);
    }
  }

  static List<int> totalRow(
    Generator generator,
    String title,
    double value,
    PosTextSize textHeight, {
    bool boldText = false,
  }) {
    return generator.row([
      PosColumn(
        width: 8,
        text: title,
        styles: PosStyles(bold: boldText, height: textHeight),
      ),
      PosColumn(
        width: 1,
        text: ":",
        styles: PosStyles(
          bold: boldText,
          align: PosAlign.center,
          height: textHeight,
        ),
      ),
      PosColumn(
        width: 3,
        text: value.toStringAsFixed(2),
        styles: PosStyles(
          bold: boldText,
          align: PosAlign.right,
          height: textHeight,
        ),
      ),
    ]);
  }
}

class ReceiptFormatter {
  static String formatItemName(String name, PrinterSize size) {
    int maxLength;

    switch (size) {
      case PrinterSize.mm58:
        maxLength = 18; // Reduced for 58mm to fit better
        break;
      case PrinterSize.mm80:
        maxLength = 28;
        break;
      case PrinterSize.mm112:
        maxLength = 40;
        break;
    }

    if (name.length > maxLength) {
      return name.substring(0, maxLength);
    }

    return name;
  }
}

/// Helper methods for thermal printing configuration
class PosPrintHelpers {
  static PaperSize _getPaperSize(PrinterSize printerSize) {
    switch (printerSize) {
      case PrinterSize.mm58:
        return PaperSize.mm58;
      case PrinterSize.mm80:
      case PrinterSize.mm112:
        return PaperSize.mm80; // Use 80mm profile for both 80mm and 112mm
    }
  }

  static int _getLineWidth(PrinterSize printerSize) {
    switch (printerSize) {
      case PrinterSize.mm58:
        return 48; // Reduced for better fit on 58mm paper
      case PrinterSize.mm80:
        return 48; // Standard 80mm width
      case PrinterSize.mm112:
        return 64; // Wider for 112mm
    }
  }

  static PosTextSize _getTextHeight(
    PrinterSize printerSize, {
    required bool isLarge,
  }) {
    switch (printerSize) {
      case PrinterSize.mm58:
        return PosTextSize
            .size3; // Use larger font for better readability on 58mm
      case PrinterSize.mm80:
        return isLarge ? PosTextSize.size2 : PosTextSize.size1;
      case PrinterSize.mm112:
        return isLarge ? PosTextSize.size2 : PosTextSize.size1;
    }
  }

  static void _configureSpacing(Generator generator, PrinterSize printerSize) {
    switch (printerSize) {
      case PrinterSize.mm58:
        // Minimal spacing for compact 58mm receipts
        generator.spaceBetweenRows = 0;
        break;
      case PrinterSize.mm80:
        // Standard spacing for 80mm
        generator.spaceBetweenRows = 1;
        break;
      case PrinterSize.mm112:
        // Slightly more spacing for wider format
        generator.spaceBetweenRows = 1;
        break;
    }
  }

  static int _getSlColumnWidth(PrinterSize printerSize) {
    switch (printerSize) {
      case PrinterSize.mm58:
        return 1; // Compact for 58mm
      case PrinterSize.mm80:
      case PrinterSize.mm112:
        return 2; // Standard width
    }
  }

  static int _getItemNameColumnWidth(PrinterSize printerSize) {
    switch (printerSize) {
      case PrinterSize.mm58:
        return 11; // Adjusted for 58mm width
      case PrinterSize.mm80:
        return 10; // Standard width
      case PrinterSize.mm112:
        return 10; // Keep standard for 112mm
    }
  }

  static int _getQtyColumnWidth(PrinterSize printerSize) {
    return 2; // Same for all sizes
  }

  static int _getRateColumnWidth(PrinterSize printerSize) {
    switch (printerSize) {
      case PrinterSize.mm58:
        return 3; // Standard for 58mm
      case PrinterSize.mm80:
        return 3; // Standard
      case PrinterSize.mm112:
        return 3; // Standard
    }
  }

  static int _getAmtColumnWidth(PrinterSize printerSize) {
    switch (printerSize) {
      case PrinterSize.mm58:
        return 6; // Increased to compensate for removed disc column
      case PrinterSize.mm80:
        return 5; // Increased to compensate for removed disc column
      case PrinterSize.mm112:
        return 5; // Increased to compensate for removed disc column
    }
  }
}
