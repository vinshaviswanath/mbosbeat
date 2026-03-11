import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';

class PdfPreviewScreen extends StatelessWidget {
  final Future<Uint8List> Function(PdfPageFormat format) buildPdf;

  const PdfPreviewScreen({super.key, required this.buildPdf});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Invoice Preview")),
      body: PdfPreview(
        build: buildPdf,
        allowPrinting: true,
        allowSharing: true,
        canChangePageFormat: false,
        initialPageFormat: PdfPageFormat.a4,
      ),
    );
  }
}
