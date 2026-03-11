import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:intl/intl.dart';
import 'package:mpos_beat/core/service/invoice_pdf_service.dart';
import 'package:mpos_beat/core/utils/enums.dart';
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
    final paper =
        (printerSize == PrinterSize.mm80 || printerSize == PrinterSize.mm112)
        ? PaperSize.mm80
        : PaperSize.mm58;

    /// Dynamic line width
    final lineWidth = printerSize == PrinterSize.mm112
        ? 64
        : printerSize == PrinterSize.mm80
        ? 48
        : 48;

    /// Dynamic font height
    final textHeight =
        (printerSize == PrinterSize.mm80 || printerSize == PrinterSize.mm112)
        ? PosTextSize.size2
        : PosTextSize.size3;

    final largeTextHeight =
        (printerSize == PrinterSize.mm80 || printerSize == PrinterSize.mm112)
        ? PosTextSize.size2
        : PosTextSize.size3;

    final smallTextHeight =
        (printerSize == PrinterSize.mm80 || printerSize == PrinterSize.mm112)
        ? PosTextSize.size1
        : PosTextSize.size3;

    final profile = await CapabilityProfile.load();
    final generator = Generator(paper, profile);

    List<int> bytes = [];
    if (printerSize == PrinterSize.mm58) {
      generator.spaceBetweenRows = 0;
    }

    String dottedLine() => "-" * lineWidth;

    final normal = PosStyles(height: smallTextHeight, width: PosTextSize.size1);

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

    final normalRight = PosStyles(
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
    bytes += generator.text(
      "Vypin",
      styles: PosStyles(align: PosAlign.center, height: smallTextHeight),
    );
    bytes += generator.text(
      "PIN 683502",
      styles: PosStyles(align: PosAlign.center, height: smallTextHeight),
    );
    bytes += generator.text(
      "Kerala, India",
      styles: PosStyles(align: PosAlign.center, height: smallTextHeight),
    );
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
    bytes += generator.row([
      PosColumn(width: 2, text: "Sl", styles: bold),
      PosColumn(width: 10, text: "Item name-HSN", styles: bold),
    ]);
    bytes += generator.row([
      PosColumn(width: 2, text: ""),
      PosColumn(width: 2, text: "Qty", styles: boldRight),
      PosColumn(width: 3, text: "Rate", styles: boldRight),
      PosColumn(width: 2, text: "Disc", styles: boldRight),
      PosColumn(width: 3, text: "Amt", styles: boldRight),
    ]);
    bytes += generator.text(dottedLine());

    /// ITEMS
    int sl = 1;
    for (final item in items) {
      bytes += generator.row([
        PosColumn(width: 2, text: "$sl", styles: normal),
        PosColumn(
          width: 10,
          text:
              "${ReceiptFormatter.formatItemName(item.name, printerSize)} - ${item.hsn}",
          styles: normal,
        ),
      ]);
      bytes += generator.row([
        PosColumn(width: 2, text: ""),
        PosColumn(
          width: 2,
          text: item.qty.toString(),
          styles: PosStyles(align: PosAlign.right, height: smallTextHeight),
        ),
        PosColumn(
          width: 3,
          text: item.rate.toStringAsFixed(2),
          styles: PosStyles(align: PosAlign.right, height: smallTextHeight),
        ),
        PosColumn(
          width: 2,
          text: item.discount.toString(),
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
    bytes += generator.feed(1);
    bytes += generator.text(
      "Printed ${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())}",
      styles: PosStyles(height: smallTextHeight),
    );
    bytes += generator.feed(2);
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
        maxLength = 18;
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
