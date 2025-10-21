// To parse this JSON data, do
//
//     final stateListDtos = stateListDtosFromJson(jsonString);

import 'dart:convert';

import 'package:mpos_beat/data/models/data/state_list_data.dart';

StateListDtos stateListDtosFromJson(String str) =>
    StateListDtos.fromJson(json.decode(str));

String stateListDtosToJson(StateListDtos data) => json.encode(data.toJson());

class StateListDtos {
  List<StateListData> stateListData;
  int id;
  int status;
  String message;

  StateListDtos({
    required this.stateListData,
    required this.id,
    required this.status,
    required this.message,
  });

  factory StateListDtos.fromJson(Map<String, dynamic> json) => StateListDtos(
    stateListData: List<StateListData>.from(
      json["stateList"].map((x) => StateListData.fromJson(x)),
    ),
    id: json["id"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "stateList": List<dynamic>.from(stateListData.map((x) => x.toJson())),
    "id": id,
    "status": status,
    "message": message,
  };
}
