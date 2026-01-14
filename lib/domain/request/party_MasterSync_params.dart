import 'package:mpos_beat/core/param/param_builder.dart';

class PartyMasterSyncParams extends ToMap {
  final int companyId;
  final int pageNumber;
  final DateTime lastSyncDateTime;

  PartyMasterSyncParams({
    required this.companyId,
    required this.pageNumber,
    required this.lastSyncDateTime,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "CompanyID": companyId,
      "PageNumber": pageNumber,
      "LastSyncDateTime": lastSyncDateTime.toIso8601String(),
    };
  }
}
