import 'package:mpos_beat/core/param/param_builder.dart';


class ItemMasterQueryParams extends ToMap {
  final int companyId;
  final int pageNumber;
  final DateTime lastSyncDateTime;

  ItemMasterQueryParams({
    required this.companyId,
    required this.pageNumber,
    required this.lastSyncDateTime,
  });

  /// Used for pagination (pageNumber changes)
  ItemMasterQueryParams copyWith({
    int? companyId,
    int? pageNumber,
    DateTime? lastSyncDateTime,
  }) {
    return ItemMasterQueryParams(
      companyId: companyId ?? this.companyId,
      pageNumber: pageNumber ?? this.pageNumber,
      lastSyncDateTime: lastSyncDateTime ?? this.lastSyncDateTime,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'CompanyID': companyId,
      'PageNumber': pageNumber,
      'LastSyncDateTime': _formatDateTime(lastSyncDateTime),
    };
  }

  /// yyyy-MM-ddTHH:mm:ss
  String _formatDateTime(DateTime dateTime) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    return '${dateTime.year}-'
        '${twoDigits(dateTime.month)}-'
        '${twoDigits(dateTime.day)}T'
        '${twoDigits(dateTime.hour)}:'
        '${twoDigits(dateTime.minute)}:'
        '${twoDigits(dateTime.second)}';
  }
}
