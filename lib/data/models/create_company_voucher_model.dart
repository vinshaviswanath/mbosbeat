// To parse this JSON data, do
//
//     final createCompanyvochertype = createCompanyvochertypeFromJson(jsonString);

import 'dart:convert';

CreateCompanyvochertypeDtos createCompanyvochertypeFromJson(String str) =>
    CreateCompanyvochertypeDtos.fromJson(json.decode(str));

String createCompanyvochertypeToJson(CreateCompanyvochertypeDtos data) =>
    json.encode(data.toJson());

class CreateCompanyvochertypeDtos {
  List<dynamic> companyList;
  int id;
  int status;
  String message;

  CreateCompanyvochertypeDtos({
    required this.companyList,
    required this.id,
    required this.status,
    required this.message,
  });

  factory CreateCompanyvochertypeDtos.fromJson(Map<String, dynamic> json) =>
      CreateCompanyvochertypeDtos(
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
