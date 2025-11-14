import 'dart:convert';

CompleteVoucherSettingsDtos completeVoucherSettingsDtosFromJson(String str) =>
    CompleteVoucherSettingsDtos.fromJson(json.decode(str));

String completeVoucherSettingsDtosToJson(CompleteVoucherSettingsDtos data) =>
    json.encode(data.toJson());

class CompleteVoucherSettingsDtos {
  List<dynamic> companyList;
  int id;
  int status;
  String message;

  CompleteVoucherSettingsDtos({
    required this.companyList,
    required this.id,
    required this.status,
    required this.message,
  });

  factory CompleteVoucherSettingsDtos.fromJson(Map<String, dynamic> json) =>
      CompleteVoucherSettingsDtos(
        companyList: List<dynamic>.from(json["companyList"].map((x) => x)),
        id: json["id"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "companyList": List<dynamic>.from(companyList.map((x) => x)),
    "id": id,
    "status": status,
    "message": message,
  };
}
