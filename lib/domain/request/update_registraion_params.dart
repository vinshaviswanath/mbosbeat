import 'package:mpos_beat/core/param/param_builder.dart';

class UpdateRegistrationParams extends ToMap {
  final int? companyId;
  final String date;
  final int? registrationType;
  final String taxNumber;
  final String fssaiNo;

  UpdateRegistrationParams({
    required this.companyId,
    required this.date,
    required this.registrationType,
    required this.taxNumber,
    required this.fssaiNo,
  });

  factory UpdateRegistrationParams.fromJson(Map<String, dynamic> json) {
    return UpdateRegistrationParams(
      companyId: json["companyID"],
      date: json["appFrom"],
      registrationType: json["registrationType"],
      taxNumber: json["taxNumber"],
      fssaiNo: json["fssaiNo"],
    );
  }
  @override
  Map<String, dynamic> toMap() => {
    "companyID": companyId,
    "appFrom": date,
    "registrationType": registrationType,
    "taxNumber": taxNumber,
    "fssaiNo": fssaiNo,
  };
}
