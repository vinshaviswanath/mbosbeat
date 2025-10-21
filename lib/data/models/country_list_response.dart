// To parse this JSON data, do
//
//     final countryListDtos = countryListDtosFromJson(jsonString);

import 'dart:convert';

import 'package:mpos_beat/data/models/data/country_list_data.dart';

CountryListDtos countryListDtosFromJson(String str) =>
    CountryListDtos.fromJson(json.decode(str));

String countryListDtosToJson(CountryListDtos data) =>
    json.encode(data.toJson());

class CountryListDtos {
  List<CountryListData> countryListData;
  int id;
  int status;
  String message;

  CountryListDtos({
    required this.countryListData,
    required this.id,
    required this.status,
    required this.message,
  });

  factory CountryListDtos.fromJson(Map<String, dynamic> json) =>
      CountryListDtos(
        countryListData: List<CountryListData>.from(
          json["countryList"].map((x) => CountryListData.fromJson(x)),
        ),
        id: json["id"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "countryList": List<dynamic>.from(countryListData.map((x) => x.toJson())),
    "id": id,
    "status": status,
    "message": message,
  };
}
