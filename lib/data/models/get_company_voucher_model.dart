// To parse this JSON data, do
//
//     final companyvouchertypeslist = companyvouchertypeslistFromJson(jsonString);

import 'dart:convert';

import 'data/company_voucher_data.dart';

CompanyvouchertypeslistDtos companyvouchertypeslistFromJson(String str) =>
    CompanyvouchertypeslistDtos.fromJson(json.decode(str));

String companyvouchertypeslistToJson(CompanyvouchertypeslistDtos data) =>
    json.encode(data.toJson());

class CompanyvouchertypeslistDtos {
  List<CompanyVoucherTypesListData> companyVoucherTypesList;
  int id;
  int status;
  String message;

  CompanyvouchertypeslistDtos({
    required this.companyVoucherTypesList,
    required this.id,
    required this.status,
    required this.message,
  });

  factory CompanyvouchertypeslistDtos.fromJson(Map<String, dynamic> json) =>
      CompanyvouchertypeslistDtos(
        companyVoucherTypesList: List<CompanyVoucherTypesListData>.from(
            json["companyVoucherTypesList"]
                .map((x) => CompanyVoucherTypesListData.fromJson(x))),
        id: json["id"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "companyVoucherTypesList":
            List<dynamic>.from(companyVoucherTypesList.map((x) => x.toJson())),
        "id": id,
        "status": status,
        "message": message,
      };
}
