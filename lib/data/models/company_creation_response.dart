import 'dart:convert';

CompanyInfoDtos createCompanyFromJson(String str) =>
    CompanyInfoDtos.fromJson(json.decode(str));

String createCompanyToJson(CompanyInfoDtos data) => json.encode(data.toJson());

class CompanyInfoDtos {
  List<dynamic> companyList;
  int id;
  int status;
  String message;

  CompanyInfoDtos({
    required this.companyList,
    required this.id,
    required this.status,
    required this.message,
  });

  factory CompanyInfoDtos.fromJson(Map<String, dynamic> json) =>
      CompanyInfoDtos(
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
