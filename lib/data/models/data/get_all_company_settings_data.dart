class CompanySettingsListData {
  int id;
  int companyId;
  String settingsMenuName;
  ButtonType buttonType;
  String description;
  int parentId;
  int orderNo;
  MenuType menuType;
  String settingsValue;

  CompanySettingsListData({
    required this.id,
    required this.companyId,
    required this.settingsMenuName,
    required this.buttonType,
    required this.description,
    required this.parentId,
    required this.orderNo,
    required this.menuType,
    required this.settingsValue,
  });

  factory CompanySettingsListData.fromJson(Map<String, dynamic> json) =>
      CompanySettingsListData(
        id: json["id"],
        companyId: json["companyID"],
        settingsMenuName: json["settingsMenuName"],
        buttonType: buttonTypeValues.map[json["buttonType"]]!,
        description: json["description"],
        parentId: json["parentId"],
        orderNo: json["orderNo"],
        menuType: menuTypeValues.map[json["menuType"]]!,
        settingsValue: json["settingsValue"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "companyID": companyId,
    "settingsMenuName": settingsMenuName,
    "buttonType": buttonTypeValues.reverse[buttonType],
    "description": description,
    "parentId": parentId,
    "orderNo": orderNo,
    "menuType": menuTypeValues.reverse[menuType],
    "settingsValue": settingsValueValues.reverse[settingsValue],
  };
}

enum ButtonType { TOGGLE }

final buttonTypeValues = EnumValues({"Toggle": ButtonType.TOGGLE});

enum MenuType { FREE }

final menuTypeValues = EnumValues({"Free": MenuType.FREE});

enum SettingsValue { EMPTY, YES }

final settingsValueValues = EnumValues({
  "": SettingsValue.EMPTY,
  "Yes": SettingsValue.YES,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
