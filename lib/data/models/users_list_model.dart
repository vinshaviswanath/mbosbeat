import 'package:mpos_beat/presentation/common/widgets/custom_dropdown.dart';
import 'package:mpos_beat/presentation/common/widgets/custom_dropdown_type_generic.dart';

class UsersListModel {
  UsersListModel({
    required this.userMasterList,
    required this.id,
    required this.status,
    required this.message,
  });

  final List<UserMasterList> userMasterList;
  final int? id;
  final int? status;
  final String? message;

  factory UsersListModel.fromJson(Map<String, dynamic> json) {
    return UsersListModel(
      userMasterList: json["userMasterList"] == null
          ? []
          : List<UserMasterList>.from(
              json["userMasterList"]!.map((x) => UserMasterList.fromJson(x)),
            ),
      id: json["id"],
      status: json["status"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "userMasterList": userMasterList.map((x) => x?.toJson()).toList(),
    "id": id,
    "status": status,
    "message": message,
  };
}

class UserMasterList implements ObjectWithIdAndName {
  UserMasterList({
    required this.id,
    required this.customerId,
    required this.name,
    required this.mobile,
    required this.whatsappNo,
    required this.email,
    required this.designationId,
    required this.designation,
    required this.parentId,
    required this.parentName,
    required this.mPin,
    required this.username,
    required this.passwordHash,
    required this.active,
    required this.createdOn,
    required this.companyList,
  });

  @override
  final int? id;
  final int? customerId;
  @override
  final String? name;
  final String? mobile;
  final String? whatsappNo;
  final String? email;
  final int? designationId;
  final String? designation;
  final int? parentId;
  final String? parentName;
  final dynamic mPin;
  final String? username;
  final String? passwordHash;
  final int? active;
  final DateTime? createdOn;
  final String? companyList;

  bool get isBlocked => active == 0;
  factory UserMasterList.fromJson(Map<String, dynamic> json) {
    return UserMasterList(
      id: json["id"],
      customerId: json["customerID"],
      name: json["fullName"],
      mobile: json["mobile"],
      whatsappNo: json["whatsappNo"],
      email: json["email"],
      designationId: json["designationId"],
      designation: json["designation"],
      parentId: json["parentId"],
      parentName: json["parentName"],
      mPin: json["mPin"],
      username: json["username"],
      passwordHash: json["passwordHash"],
      active: json["active"],
      createdOn: DateTime.tryParse(json["createdOn"] ?? ""),
      companyList: json["companyList"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "customerID": customerId,
    "fullName": name,
    "mobile": mobile,
    "whatsappNo": whatsappNo,
    "email": email,
    "designationId": designationId,
    "designation": designation,
    "parentId": parentId,
    "parentName": parentName,
    "mPin": mPin,
    "username": username,
    "passwordHash": passwordHash,
    "active": active,
    "createdOn": createdOn?.toIso8601String(),
    "companyList": companyList,
  };

  copyWith({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String whatsAppNumber,
    required String designation,
    required String reportingTo,
  }) {}
}
