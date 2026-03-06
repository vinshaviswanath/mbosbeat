import 'dart:typed_data';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoicePdfService {
  static Future<Uint8List> generateInvoice({
    required String companyName,
    required String address,
    required String gst,
    required String invoiceNo,
    required String date,
    required String buyerName,
    required List<SelectedOrderItem> items,
    required double subTotal,
    required double cgst,
    required double sgst,
    required double grandTotal,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              /// TITLE
              pw.Center(
                child: pw.Text(
                  "TAX INVOICE",
                  style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),

              pw.SizedBox(height: 20),

              /// COMPANY
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        companyName,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(address),
                      pw.Text("GSTIN : $gst"),
                    ],
                  ),

                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text("Invoice No : $invoiceNo"),
                      pw.Text("Date : $date"),
                    ],
                  ),
                ],
              ),

              pw.SizedBox(height: 20),

              pw.Text("Buyer : $buyerName"),

              pw.SizedBox(height: 10),

              /// PRODUCT TABLE
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(
                    children: [
                      _cell("Item"),
                      _cell("Qty"),
                      _cell("Rate"),
                      _cell("Disc"),
                      _cell("Amount"),
                    ],
                  ),

                  ...items.map((SelectedOrderItem e) {
                    return pw.TableRow(
                      children: [
                        _cell(e.item.itemName),
                        _cell(e.qty.toStringAsFixed(2)),
                        _cell(e.rate.toStringAsFixed(2)),
                        _cell(e.discount.toStringAsFixed(2)),
                        _cell(e.amount.toStringAsFixed(2)),
                      ],
                    );
                  }),
                ],
              ),

              pw.SizedBox(height: 20),

              /// TOTALS
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text("Subtotal : ${subTotal.toStringAsFixed(2)}"),
                    pw.Text("CGST : ${cgst.toStringAsFixed(2)}"),
                    pw.Text("SGST : ${sgst.toStringAsFixed(2)}"),
                    pw.Divider(),
                    pw.Text(
                      "Grand Total : ${grandTotal.toStringAsFixed(2)}",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  static pw.Widget _cell(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(6),
      child: pw.Text(text, style: const pw.TextStyle(fontSize: 10)),
    );
  }
}
