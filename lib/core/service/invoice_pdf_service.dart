import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:number_to_words/number_to_words.dart';

class InvoicePdfService {
  static Future<Uint8List> generateInvoice({
    required String companyName,
    required String address,
    required String pin,
    required String email,
    required String mobile,
    required String gst,
    required String fssai,
    required String invoiceNo,
    required String date,
    required String buyerName,
    required String state,
    required List<InvoiceItem> items,
    required double subTotal,
    required double sgst,
    required double cgst,
    required double roundOff,
    required double grandTotal,
  }) async {
    final pdf = pw.Document();

    const int maxRows = 15;

    List<pw.TableRow> itemRows = [];

    /// ================= ACTUAL ITEMS =================
    for (int i = 0; i < items.length; i++) {
      final e = items[i];

      itemRows.add(
        pw.TableRow(
          children: [
            _rowCell("${i + 1}"),
            _rowCell(e.name),
            _rowCell(e.hsn, right: true),
            _rowCell(e.qty.toStringAsFixed(2), right: true),
            _rowCell(e.rate.toStringAsFixed(2), right: true),
            _rowCell(e.unit, right: true),
            _rowCell(e.discount.toStringAsFixed(2), right: true),
            _rowCell(e.amount.toStringAsFixed(2), right: true),
          ],
        ),
      );
    }

    /// ================= SUBTOTAL =================
    itemRows.add(
      pw.TableRow(
        children: [
          _rowCell(""),
          _rowCell("Subtotal", right: true, bold: true, fontSize: 10),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(
            subTotal.toStringAsFixed(2),
            right: true,
            bold: true,
            fontSize: 10,
          ),
        ],
      ),
    );

    /// ================= SGST =================
    itemRows.add(
      pw.TableRow(
        children: [
          _rowCell(""),
          _rowCell("SGST", right: true, bold: true, fontSize: 10),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(
            sgst.toStringAsFixed(2),
            right: true,
            bold: true,
            fontSize: 10,
          ),
        ],
      ),
    );

    /// ================= CGST =================
    itemRows.add(
      pw.TableRow(
        children: [
          _rowCell(""),
          _rowCell("CGST", right: true, bold: true, fontSize: 10),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(
            cgst.toStringAsFixed(2),
            right: true,
            bold: true,
            fontSize: 10,
          ),
        ],
      ),
    );

    /// ================= ROUND OFF =================
    itemRows.add(
      pw.TableRow(
        children: [
          _rowCell(""),
          _rowCell("Round Off", right: true, bold: true, fontSize: 10),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(
            roundOff.toStringAsFixed(2),
            right: true,
            bold: true,
            fontSize: 10,
          ),
        ],
      ),
    );

    /// ================= TOTAL (BOTTOM RIGHT) =================
    itemRows.add(
      pw.TableRow(
        children: [
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
        ],
      ),
    );

    /// ================= EMPTY ROWS =================
    /// Automatically reduce empty rows when items increase
    int emptyRows = maxRows - items.length - 5;
    if (emptyRows < 0) emptyRows = 0;

    for (int i = 0; i < emptyRows; i++) {
      itemRows.add(
        pw.TableRow(children: List.generate(8, (_) => _rowCell(""))),
      );
    }

    itemRows.add(
      pw.TableRow(
        children: [
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          _rowCell(""),
          pw.Container(
            decoration: const pw.BoxDecoration(
              border: pw.Border(top: pw.BorderSide(width: 1)),
            ),
            alignment: pw.Alignment.centerRight,
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(
              grandTotal.toStringAsFixed(2),
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
          ),
        ],
      ),
    );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        header: (context) {
          return pw.Container(
            alignment: pw.Alignment.bottomRight,
            margin: const pw.EdgeInsets.only(bottom: 5),
            child: pw.Text(
              "Page ${context.pageNumber} of ${context.pagesCount}",
              style: const pw.TextStyle(fontSize: 10),
            ),
          );
        },
        build: (context) => [
          /// ================= HEADER =================
          pw.Center(
            child: pw.Text(
              "TAX INVOICE",
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
          ),

          pw.SizedBox(height: 10),
          pw.Container(
            decoration: pw.BoxDecoration(border: pw.Border.all(width: 1)),

            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                /// ================= COMPANY + BUYER =================
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    /// COMPANY
                    pw.Expanded(
                      child: pw.Container(
                        padding: const pw.EdgeInsets.all(6),

                        /// Only RIGHT border (middle divider)
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(right: pw.BorderSide()),
                        ),

                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              companyName,
                              style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Text(address),
                            pw.SizedBox(height: 5),
                            pw.Text("Pin : $pin"),
                            pw.Text("Phone : $mobile"),
                            pw.Text("Mob : $mobile"),
                            pw.Text("Email : $email"),
                            pw.Text("GSTIN : $gst"),
                            pw.Text("FSSAI No : $fssai"),
                          ],
                        ),
                      ),
                    ),

                    /// BUYER
                    pw.Expanded(
                      child: pw.Container(
                        // padding: const pw.EdgeInsets.all(6),

                        /// NO BORDER (outer container already has it)
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Table(
                              border: const pw.TableBorder(
                                bottom: pw.BorderSide(), // common bottom border
                                verticalInside:
                                    pw.BorderSide(), // vertical divider
                              ),
                              columnWidths: {
                                0: const pw.FlexColumnWidth(1),
                                1: const pw.FlexColumnWidth(1),
                              },
                              children: [
                                pw.TableRow(
                                  children: [
                                    pw.Padding(
                                      padding: const pw.EdgeInsets.only(
                                        left: 4,
                                        top: 4,
                                        bottom: 4,
                                      ),
                                      child: pw.Row(
                                        children: [
                                          pw.Text("INV NO : "),
                                          pw.Text(
                                            invoiceNo,
                                            style: pw.TextStyle(
                                              fontWeight: pw.FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    pw.Padding(
                                      padding: const pw.EdgeInsets.only(
                                        right: 4,
                                        top: 4,
                                        bottom: 4,
                                      ),
                                      child: pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.end,
                                        children: [
                                          pw.Text(
                                            "DATE : ",
                                            style: pw.TextStyle(
                                              fontWeight: pw.FontWeight.bold,
                                            ),
                                          ),
                                          pw.Text(
                                            date,
                                            style: pw.TextStyle(
                                              fontWeight: pw.FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            pw.Container(
                              padding: pw.EdgeInsets.only(left: 5),
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.SizedBox(height: 5),

                                  pw.Text("Buyer Address"),

                                  pw.Text(
                                    buyerName,
                                    style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),

                                  pw.Text("State : $state"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                /// ================= ITEM TABLE =================
                pw.Table(
                  border: pw.TableBorder(
                    left: const pw.BorderSide(),
                    right: const pw.BorderSide(),
                    verticalInside: const pw.BorderSide(),
                    bottom: pw.BorderSide(),
                  ),
                  columnWidths: {
                    0: const pw.FlexColumnWidth(1),
                    1: const pw.FlexColumnWidth(6),
                    2: const pw.FlexColumnWidth(1),
                    3: const pw.FlexColumnWidth(1.3),
                    4: const pw.FlexColumnWidth(1),
                    5: const pw.FlexColumnWidth(1),
                    6: const pw.FlexColumnWidth(1),
                    7: const pw.FlexColumnWidth(1.2),
                  },

                  children: [
                    /// HEADER
                    pw.TableRow(
                      decoration: const pw.BoxDecoration(
                        // color: PdfColors.grey300,
                        border: pw.TableBorder(
                          bottom: pw.BorderSide(),
                          top: pw.BorderSide(),
                        ),
                      ),
                      children: [
                        _header("SL"),
                        _header(
                          "ITEM NAME",
                          alignment: pw.Alignment.centerLeft,
                        ),
                        _header("HSN"),
                        _header("QUANTITY"),
                        _header("RATE"),
                        _header("UNIT"),
                        _header("DISC"),
                        _header("AMOUNT"),
                      ],
                    ),

                    ...itemRows,
                  ],
                ),

                pw.SizedBox(height: 10),

                /// ================= TOTALS =================
                // pw.Row(
                //   mainAxisAlignment: pw.MainAxisAlignment.end,
                //   children: [
                //     pw.Container(
                //       width: 200,
                //       child: pw.Column(
                //         children: [
                //           _totalRow("Subtotal", subTotal),
                //           _totalRow("SGST", sgst),
                //           _totalRow("CGST", cgst),
                //           _totalRow("Round Off", roundOff),

                //           pw.Divider(),

                //           _totalRow("Total", grandTotal, bold: true),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),

                // pw.SizedBox(height: 10),

                /// ================= AMOUNT WORDS =================
                pw.Container(
                  padding: pw.EdgeInsets.only(left: 10),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Amount Chargeable (in words)"),

                      pw.Text(
                        "Indian Rupees ${amountToWords(grandTotal)} Only",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),

                      pw.SizedBox(height: 15),
                    ],
                  ),
                ),

                /// ================= GST SUMMARY TABLE =================
                pw.Table(
                  border: pw.TableBorder.all(),
                  columnWidths: {
                    0: const pw.FlexColumnWidth(2), // HSN
                    1: const pw.FlexColumnWidth(2), // Taxable
                    2: const pw.FlexColumnWidth(3), // Central Tax block
                    3: const pw.FlexColumnWidth(3), // State Tax block
                    4: const pw.FlexColumnWidth(2), // Total tax
                  },
                  children: [
                    /// HEADER ROW
                    pw.TableRow(
                      children: [
                        _header("HSN/SAC"),
                        _header(
                          "Taxable\nValue",
                          textAlign: pw.TextAlign.center,
                        ),

                        /// CENTRAL TAX
                        pw.Column(
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.center,
                              padding: const pw.EdgeInsets.all(3),
                              child: pw.Text(
                                "Central Tax",
                                style: pw.TextStyle(
                                  fontSize: 9,
                                  fontWeight: pw.FontWeight.normal,
                                ),
                              ),
                            ),

                            pw.Table(
                              border: const pw.TableBorder(
                                top: pw.BorderSide(),
                                verticalInside: pw.BorderSide(),
                              ),
                              children: [
                                pw.TableRow(
                                  children: [
                                    pw.Expanded(child: _header("Rate")),
                                    pw.Expanded(child: _header("Amount")),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        /// STATE TAX
                        pw.Column(
                          children: [
                            pw.Container(
                              alignment: pw.Alignment.center,
                              padding: const pw.EdgeInsets.all(3),
                              child: pw.Text(
                                "State Tax",
                                style: pw.TextStyle(
                                  fontSize: 9,
                                  fontWeight: pw.FontWeight.normal,
                                ),
                              ),
                            ),

                            pw.Table(
                              border: const pw.TableBorder(
                                top: pw.BorderSide(),
                                verticalInside: pw.BorderSide(),
                              ),
                              children: [
                                pw.TableRow(
                                  children: [
                                    pw.Expanded(child: _header("Rate")),
                                    pw.Expanded(child: _header("Amount")),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        _header(
                          "Total\nTax Amount",
                          textAlign: pw.TextAlign.center,
                        ),
                      ],
                    ),

                    /// DATA ROW
                    pw.TableRow(
                      children: [
                        _cell(""),
                        _cell(subTotal.toStringAsFixed(2), alignRight: true),

                        /// CENTRAL TAX VALUES
                        pw.Table(
                          border: const pw.TableBorder(
                            verticalInside: pw.BorderSide(),
                          ),
                          children: [
                            pw.TableRow(
                              children: [
                                pw.Expanded(
                                  child: _cell("2.5%", alignRight: true),
                                ),
                                pw.Expanded(
                                  child: _cell(
                                    cgst.toStringAsFixed(2),
                                    alignRight: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        /// STATE TAX VALUES
                        pw.Table(
                          border: const pw.TableBorder(
                            verticalInside: pw.BorderSide(),
                          ),
                          children: [
                            pw.TableRow(
                              children: [
                                pw.Expanded(
                                  child: _cell("2.5%", alignRight: true),
                                ),
                                pw.Expanded(
                                  child: _cell(
                                    sgst.toStringAsFixed(2),
                                    alignRight: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        _cell(
                          (cgst + sgst).toStringAsFixed(2),
                          alignRight: true,
                        ),
                      ],
                    ),

                    /// TOTAL ROW
                    pw.TableRow(
                      children: [
                        _cell("Total"),
                        _cell(subTotal.toStringAsFixed(2), alignRight: true),

                        pw.Table(
                          border: const pw.TableBorder(
                            verticalInside: pw.BorderSide(),
                          ),
                          children: [
                            pw.TableRow(
                              children: [
                                pw.Container(),
                                _cell(
                                  cgst.toStringAsFixed(2),
                                  alignRight: true,
                                ),
                              ],
                            ),
                          ],
                        ),

                        pw.Table(
                          border: const pw.TableBorder(
                            verticalInside: pw.BorderSide(),
                          ),
                          children: [
                            pw.TableRow(
                              children: [
                                pw.Container(),
                                _cell(
                                  sgst.toStringAsFixed(2),
                                  alignRight: true,
                                ),
                              ],
                            ),
                          ],
                        ),

                        _cell(
                          (cgst + sgst).toStringAsFixed(2),
                          alignRight: true,
                        ),
                      ],
                    ),
                  ],
                ),

                pw.SizedBox(height: 10),
                pw.Container(
                  padding: pw.EdgeInsets.only(left: 10),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.RichText(
                        text: pw.TextSpan(
                          style: const pw.TextStyle(fontSize: 10),
                          children: [
                            const pw.TextSpan(text: "Tax Amount (in words) : "),

                            pw.TextSpan(
                              text: "Indian Rupees ",
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),

                            pw.TextSpan(
                              text: "${amountToWords(cgst + sgst)} Only",
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.only(left: 50, top: 5),
                        child: pw.Text(
                          "GPAY : 9446513650",
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),

                      pw.SizedBox(height: 20),
                    ],
                  ),
                ),

                /// ================= FOOTER =================
                pw.Row(
                  children: [
                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(), // empty left side
                    ),

                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        decoration: pw.BoxDecoration(border: pw.Border.all()),
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: [
                            pw.Text(
                              "for $companyName",
                              style: pw.TextStyle(
                                fontSize: 11,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),

                            pw.SizedBox(height: 40),

                            pw.Text("Authorised Signatory"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Center(
            child: pw.Text(
              "This is a Computer Generated Invoice",
              style: const pw.TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );

    return pdf.save();
  }

  /// ================= HELPERS =================

  static pw.Widget _header(
    String text, {
    pw.Alignment alignment = pw.Alignment.center,
    pw.TextAlign textAlign = pw.TextAlign.start,
  }) {
    return pw.Container(
      alignment: alignment,
      padding: const pw.EdgeInsets.only(top: 3, bottom: 10, left: 4, right: 2),
      child: pw.Text(
        text,
        style: pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 9),
        textAlign: textAlign,
      ),
    );
  }

  static pw.Widget _cell(String text, {bool alignRight = false}) {
    return pw.Container(
      height: 18,
      alignment: alignRight
          ? pw.Alignment.centerRight
          : pw.Alignment.centerLeft,
      padding: const pw.EdgeInsets.symmetric(horizontal: 4),
      child: pw.Text(text, style: const pw.TextStyle(fontSize: 9)),
    );
  }

  static pw.Widget _totalRow(String title, double value, {bool bold = false}) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
          ),
        ),

        pw.Text(
          value.toStringAsFixed(2),
          style: pw.TextStyle(
            fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
          ),
        ),
      ],
    );
  }

  static pw.Widget _rowCell(
    String text, {
    bool right = false,
    double fontSize = 9,
    bool bold = false,
  }) {
    return pw.Container(
      height: 18,
      alignment: right ? pw.Alignment.centerRight : pw.Alignment.centerLeft,
      padding: const pw.EdgeInsets.symmetric(horizontal: 4),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: fontSize,
          fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
        ),
      ),
    );
  }

  static String amountToWords(double amount) {
    int rupees = amount.floor();
    int paise = ((amount - rupees) * 100).round();

    String words = NumberToWord().convert('en-in', rupees);

    if (paise > 0) {
      words += " and ${NumberToWord().convert('en-in', paise)} Paise";
    }

    return words;
  }
}

class InvoiceItem {
  final String name;
  final String hsn;
  final String unit;
  final double qty;
  final double rate;
  final double discount;
  final double amount;

  InvoiceItem({
    required this.name,
    required this.hsn,
    required this.unit,
    required this.qty,
    required this.rate,
    required this.discount,
    required this.amount,
  });
}
