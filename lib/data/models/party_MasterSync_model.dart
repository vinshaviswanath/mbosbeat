// To parse this JSON data, do
//
//     final partyMasterSync = partyMasterSyncFromJson(jsonString);

import 'dart:convert';

import 'package:mpos_beat/data/models/data/party_MasterSync_data.dart';

PartyMasterSyncModel partyMasterSyncFromJson(String str) =>
    PartyMasterSyncModel.fromJson(json.decode(str));

String partyMasterSyncToJson(PartyMasterSyncModel data) =>
    json.encode(data.toJson());

class PartyMasterSyncModel {
  List<PartyMasterListData> partyList;
  int id;
  int status;
  String message;

  PartyMasterSyncModel({
    required this.partyList,
    required this.id,
    required this.status,
    required this.message,
  });

  factory PartyMasterSyncModel.fromJson(Map<String, dynamic> json) =>
      PartyMasterSyncModel(
        partyList: List<PartyMasterListData>.from(
          json["partyList"].map((x) => PartyMasterListData.fromJson(x)),
        ),
        id: json["id"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "partyList": List<dynamic>.from(partyList.map((x) => x.toJson())),
    "id": id,
    "status": status,
    "message": message,
  };
}
