import 'dart:convert';

import 'package:mpos_beat/data/models/data/get_all_company_settings_data.dart';

CompanysettingslistDtos companysettingslistFromJson(String str) =>
    CompanysettingslistDtos.fromJson(json.decode(str));

String companysettingslistToJson(CompanysettingslistDtos data) =>
    json.encode(data.toJson());

class CompanysettingslistDtos {
  List<CompanySettingsListData> companySettingsList;
  int id;
  int status;
  String message;

  CompanysettingslistDtos({
    required this.companySettingsList,
    required this.id,
    required this.status,
    required this.message,
  });

  factory CompanysettingslistDtos.fromJson(Map<String, dynamic> json) =>
      CompanysettingslistDtos(
        companySettingsList: List<CompanySettingsListData>.from(
          json["companySettingsList"].map(
            (x) => CompanySettingsListData.fromJson(x),
          ),
        ),
        id: json["id"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "companySettingsList": List<dynamic>.from(
      companySettingsList.map((x) => x.toJson()),
    ),
    "id": id,
    "status": status,
    "message": message,
  };
}
