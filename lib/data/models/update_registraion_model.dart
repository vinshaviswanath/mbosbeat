// To parse this JSON data, do
//
//     final updateRegistrationModel = updateRegistrationModelFromJson(jsonString);

import 'dart:convert';

UpdateRegistrationModel updateRegistrationModelFromJson(String str) =>
    UpdateRegistrationModel.fromJson(json.decode(str));

String updateRegistrationModelToJson(UpdateRegistrationModel data) =>
    json.encode(data.toJson());

class UpdateRegistrationModel {
  int id;
  int status;
  String message;

  UpdateRegistrationModel({
    required this.id,
    required this.status,
    required this.message,
  });

  factory UpdateRegistrationModel.fromJson(Map<String, dynamic> json) =>
      UpdateRegistrationModel(
        id: json["id"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "message": message,
  };
}
