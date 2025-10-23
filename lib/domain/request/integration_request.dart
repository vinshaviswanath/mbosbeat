import 'package:mpos_beat/core/param/param_builder.dart';

class IntegrationParams extends ToMap {
  int? companyid;
  String? integrationType;
  String? serialNo;
  bool stockInCloud;

  IntegrationParams({
    required this.companyid,
    required this.integrationType,
    required this.serialNo,
    required this.stockInCloud,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "CompanyID": companyid,
      "IntegrationType": integrationType,
      "SerialNumber": serialNo,
      "StockInCloud": stockInCloud ? "Yes" : "No",
    };
  }
}
