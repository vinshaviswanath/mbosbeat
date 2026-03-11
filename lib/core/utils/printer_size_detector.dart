import 'package:mpos_beat/core/utils/enums.dart';

class PrinterSizeDetector {
  static PrinterSize detect(String deviceName) {
    final name = deviceName.toLowerCase();

    /// Known 58mm printers
    if (name.contains("bp02")) return PrinterSize.mm58;
    if (name.contains("gp-5890")) return PrinterSize.mm58;
    if (name.contains("rp326")) return PrinterSize.mm58;
    if (name.contains("58")) return PrinterSize.mm58;

    /// Known 80mm printers
    if (name.contains("mtp")) return PrinterSize.mm80;
    if (name.contains("rpp02n")) return PrinterSize.mm80;
    if (name.contains("pos-80")) return PrinterSize.mm80;
    if (name.contains("rp80")) return PrinterSize.mm80;
    if (name.contains("80")) return PrinterSize.mm80;

    /// Known 112mm printers
    if (name.contains("112")) return PrinterSize.mm112;

    /// Fallback numeric detection (ignore small numbers like 02)
    final matches = RegExp(r'\d{2,3}').allMatches(name);

    for (final match in matches) {
      final num = int.parse(match.group(0)!);

      if (num >= 56 && num <= 60) {
        return PrinterSize.mm58;
      }

      if (num >= 79 && num <= 90) {
        return PrinterSize.mm80;
      }

      if (num >= 110 && num <= 115) {
        return PrinterSize.mm112;
      }
    }

    /// Default
    return PrinterSize.mm80;
  }
}
