// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserSettingsResponse {
  UserSettingsResponse({
    required this.userSettingsList,
    required this.id,
    required this.status,
    required this.message,
  });

  final List<UserSettingsList> userSettingsList;
  final int? id;
  final int? status;
  final String? message;

  factory UserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UserSettingsResponse(
      userSettingsList: json["userSettingsList"] == null
          ? []
          : List<UserSettingsList>.from(
              json["userSettingsList"]!.map(
                (x) => UserSettingsList.fromJson(x),
              ),
            ),
      id: json["id"],
      status: json["status"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "userSettingsList": userSettingsList.map((x) => x.toJson()).toList(),
    "id": id,
    "status": status,
    "message": message,
  };

  UserSettingsResponse copyWith({
    List<UserSettingsList>? userSettingsList,
    int? id,
    int? status,
    String? message,
  }) {
    return UserSettingsResponse(
      userSettingsList: userSettingsList ?? this.userSettingsList,
      id: id ?? this.id,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

class UserSettingsList {
  UserSettingsList({
    required this.id,
    required this.userId,
    required this.menuName,
    required this.buttonType,
    required this.description,
    required this.orderNo,
    required this.active,
    required this.value,
  });

  final int? id;
  final int? userId;
  final String? menuName;
  final String? buttonType;
  final String? description;
  final int? orderNo;
  final int? active;
  final String? value;

  factory UserSettingsList.fromJson(Map<String, dynamic> json) {
    return UserSettingsList(
      id: json["id"],
      userId: json["userID"],
      menuName: json["menuName"],
      buttonType: json["buttonType"],
      description: json["description"],
      orderNo: json["orderNo"],
      active: json["active"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "userID": userId,
    "menuName": menuName,
    "buttonType": buttonType,
    "description": description,
    "orderNo": orderNo,
    "active": active,
    "value": value,
  };
}
