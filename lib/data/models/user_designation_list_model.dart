import 'package:mpos_beat/presentation/common/widgets/custom_dropdown_type_generic.dart';

class UserDesignationListModel {
  UserDesignationListModel({
    required this.userDesignationList,
    required this.id,
    required this.status,
    required this.message,
  });

  final List<UserDesignationList> userDesignationList;
  final int? id;
  final int? status;
  final String? message;

  factory UserDesignationListModel.fromJson(Map<String, dynamic> json) {
    return UserDesignationListModel(
      userDesignationList: json["userDesignationList"] == null
          ? []
          : List<UserDesignationList>.from(
              json["userDesignationList"]!.map(
                (x) => UserDesignationList.fromJson(x),
              ),
            ),
      id: json["id"],
      status: json["status"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "userDesignationList": userDesignationList.map((x) => x?.toJson()).toList(),
    "id": id,
    "status": status,
    "message": message,
  };
}

class UserDesignationList extends ObjectWithIdAndName {
  UserDesignationList({
    required this.id,
    required this.customerId,
    required this.name,
    required this.active,
  });

  @override
  final int? id;
  final int? customerId;
  @override
  final String? name;
  final int? active;

  factory UserDesignationList.fromJson(Map<String, dynamic> json) {
    return UserDesignationList(
      id: json["id"],
      customerId: json["customerId"],
      name: json["designation"],
      active: json["active"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "customerId": customerId,
    "designation": name,
    "active": active,
  };
}
