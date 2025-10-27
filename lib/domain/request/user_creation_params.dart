import 'package:mpos_beat/core/param/param_builder.dart';

class UserCreationParams extends ToMap{
    UserCreationParams({
        required this.id,
        required this.customerId,
        required this.fullName,
        required this.mobile,
        required this.whatsappNo,
        required this.email,
        required this.designationId,
        required this.parentId,
        required this.userName,
        required this.passwordHash,
        required this.active,
    });

    final int? id;
    final int? customerId;
    final String? fullName;
    final String? mobile;
    final String? whatsappNo;
    final String? email;
    final int? designationId;
    final int? parentId;
    final String? userName;
    final String? passwordHash;
    final int? active;

    factory UserCreationParams.fromJson(Map<String, dynamic> json){ 
        return UserCreationParams(
            id: json["ID"],
            customerId: json["CustomerID"],
            fullName: json["FullName"],
            mobile: json["Mobile"],
            whatsappNo: json["WhatsappNo"],
            email: json["Email"],
            designationId: json["DesignationID"],
            parentId: json["ParentID"],
            userName: json["UserName"],
            passwordHash: json["PasswordHash"],
            active: json["Active"],
        );
    }


@override
    Map<String, dynamic> toMap() => {
        "ID": id,
        "CustomerID": customerId,
        "FullName": fullName,
        "Mobile": mobile,
        "WhatsappNo": whatsappNo,
        "Email": email,
        "DesignationID": designationId,
        "ParentID": parentId,
        "UserName": userName,
        "PasswordHash": passwordHash,
        "Active": active,
    };

}
