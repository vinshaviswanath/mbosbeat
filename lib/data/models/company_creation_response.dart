import 'dart:convert';

CompanyCreationResponse createCompanyFromJson(String str) =>
    CompanyCreationResponse.fromJson(json.decode(str));

String createCompanyToJson(CompanyCreationResponse data) =>
    json.encode(data.toJson());

class CompanyCreationResponse {
  List<dynamic> companyList;
  int id;
  int status;
  String message;

  CompanyCreationResponse({
    required this.companyList,
    required this.id,
    required this.status,
    required this.message,
  });

  factory CompanyCreationResponse.fromJson(Map<String, dynamic> json) =>
      CompanyCreationResponse(
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
