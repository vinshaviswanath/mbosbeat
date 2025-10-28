import 'dart:convert';

CreateCompanySettingsDtos createCompanySettingstypeFromJson(String str) =>
    CreateCompanySettingsDtos.fromJson(json.decode(str));

String createCompanySettingstypeToJson(CreateCompanySettingsDtos data) =>
    json.encode(data.toJson());

class CreateCompanySettingsDtos {
  List<dynamic> companyList;
  int id;
  int status;
  String message;

  CreateCompanySettingsDtos({
    required this.companyList,
    required this.id,
    required this.status,
    required this.message,
  });

  factory CreateCompanySettingsDtos.fromJson(Map<String, dynamic> json) =>
      CreateCompanySettingsDtos(
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
