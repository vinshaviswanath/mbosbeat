import 'package:mpos_beat/core/param/param_builder.dart';

class BankDetailsParams extends ToMap {
  BankDetailsParams({
    required this.companyId,
    required this.bankName,
    required this.branch,
    required this.accountNumber,
    required this.ifscCode,
    required this.hasUpi,
    required this.upiAddress,
    required this.upiName,
    required this.currency,
  });

  final int? companyId;
  final String? bankName;
  final String? branch;
  final String? accountNumber;
  final String? ifscCode;
  final bool? hasUpi;
  final String? upiAddress;
  final String? upiName;
  final String? currency;

  factory BankDetailsParams.fromJson(Map<String, dynamic> json) {
    return BankDetailsParams(
      companyId: json["companyID"],
      bankName: json["bankName"],
      branch: json["branch"],
      accountNumber: json["accountNumber"],
      ifscCode: json["ifscCode"],
      hasUpi: json["hasUPI"],
      upiAddress: json["upiAddress"],
      upiName: json["upiName"],
      currency: json["currency"],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
    "companyID": companyId,
    "bankName": bankName,
    "branch": branch,
    "accountNumber": accountNumber,
    "ifscCode": ifscCode,
    "hasUPI": hasUpi,
    "upiAddress": upiAddress,
    "upiName": upiName,
    "currency": currency,
  };
}
