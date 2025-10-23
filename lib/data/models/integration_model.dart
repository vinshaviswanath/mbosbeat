import 'dart:convert';

IntegrationDtos integrationFromJson(String str) =>
    IntegrationDtos.fromJson(json.decode(str));

String integrationToJson(IntegrationDtos data) => json.encode(data.toJson());

class IntegrationDtos {
  List<dynamic> companyIntegrationList;
  int id;
  int status;
  String message;

  IntegrationDtos({
    required this.companyIntegrationList,
    required this.id,
    required this.status,
    required this.message,
  });

  factory IntegrationDtos.fromJson(Map<String, dynamic> json) =>
      IntegrationDtos(
        companyIntegrationList: List<dynamic>.from(
          json["companyIntegrationList"].map((x) => x),
        ),
        id: json["id"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "companyIntegrationList": List<dynamic>.from(
      companyIntegrationList.map((x) => x),
    ),
    "id": id,
    "status": status,
    "message": message,
  };
}
