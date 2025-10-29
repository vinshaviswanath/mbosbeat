import 'package:mpos_beat/core/param/param_builder.dart';

class CreateComanyUserMappingParams extends ToMap{
    CreateComanyUserMappingParams({
        required this.companyId,
        required this.userList,
    });

    final int? companyId;
    final List<UserList> userList;

    factory CreateComanyUserMappingParams.fromJson(Map<String, dynamic> json){ 
        return CreateComanyUserMappingParams(
            companyId: json["CompanyID"],
            userList: json["UserList"] == null ? [] : List<UserList>.from(json["UserList"]!.map((x) => UserList.fromJson(x))),
        );
    }

@override
    Map<String, dynamic> toMap() => {
        "CompanyID": companyId,
        "UserList": userList.map((x) => x.toJson()).toList(),
    };

}

class UserList {
    UserList({
        required this.userId,
    });

    final int? userId;

    factory UserList.fromJson(Map<String, dynamic> json){ 
        return UserList(
            userId: json["UserID"],
        );
    }

    Map<String, dynamic> toJson() => {
        "UserID": userId,
    };

}
