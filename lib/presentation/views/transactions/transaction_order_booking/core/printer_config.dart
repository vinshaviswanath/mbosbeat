import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:mpos_beat/core/utils/enums.dart';

class PrinterConfig {
  final PaperSize paperSize;
  final PosTextSize headerSize;
  final PosTextSize bodySize;
  final int charactersPerLine;

  const PrinterConfig({
    required this.paperSize,
    required this.headerSize,
    required this.bodySize,
    required this.charactersPerLine,
  });

  static PrinterConfig fromSize(PrinterSize size) {
    switch (size) {
      /// 58mm (2 inch printers)
      case PrinterSize.mm58:
        return const PrinterConfig(
          paperSize: PaperSize.mm58,
          headerSize: PosTextSize.size2,
          bodySize: PosTextSize.size2,
          charactersPerLine: 16,
        );

      /// 80mm (3 inch printers)
      case PrinterSize.mm80:
        return const PrinterConfig(
          paperSize: PaperSize.mm80,
          headerSize: PosTextSize.size2,
          bodySize: PosTextSize.size1,
          charactersPerLine: 48,
        );

      /// 112mm (4 inch printers)
      /// esc_pos_utils does not support mm112
      /// so we still use mm80 but allow more characters
      case PrinterSize.mm112:
        return const PrinterConfig(
          paperSize: PaperSize.mm80,
          headerSize: PosTextSize.size2,
          bodySize: PosTextSize.size1,
          charactersPerLine: 64,
        );
    }
  }
}
