import 'dart:convert';

import 'data/registration_type_data.dart';

RegistrationTypeDtos registrationTypeFromJson(String str) =>
    RegistrationTypeDtos.fromJson(json.decode(str));

String registrationTypeToJson(RegistrationTypeDtos data) =>
    json.encode(data.toJson());

class RegistrationTypeDtos {
  List<RegistrationTypeData> registrationTypeListData;
  int id;
  int status;
  String message;

  RegistrationTypeDtos({
    required this.registrationTypeListData,
    required this.id,
    required this.status,
    required this.message,
  });

  factory RegistrationTypeDtos.fromJson(Map<String, dynamic> json) =>
      RegistrationTypeDtos(
        registrationTypeListData: List<RegistrationTypeData>.from(
          json["registrationTypeList"].map(
            (x) => RegistrationTypeData.fromJson(x),
          ),
        ),
        id: json["id"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "registrationTypeList": List<dynamic>.from(
      registrationTypeListData.map((x) => x.toJson()),
    ),
    "id": id,
    "status": status,
    "message": message,
  };
}
