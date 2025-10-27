import 'package:mpos_beat/core/param/param_builder.dart';

class CreateUserCompanyMappingParams extends ToMap {
  CreateUserCompanyMappingParams({
    required this.userId,
    required this.companyList,
  });

  final int? userId;
  final List<CompanyList> companyList;

  factory CreateUserCompanyMappingParams.fromJson(Map<String, dynamic> json) {
    return CreateUserCompanyMappingParams(
      userId: json["UserID"],
      companyList: json["CompanyList"] == null
          ? []
          : List<CompanyList>.from(
              json["CompanyList"]!.map((x) => CompanyList.fromJson(x)),
            ),
    );
  }

  @override
  Map<String, dynamic> toMap() => {
    "UserID": userId,
    "CompanyList": companyList.map((x) => x.toJson()).toList(),
  };
}

class CompanyList {
  CompanyList({required this.companyId});

  final int? companyId;

  factory CompanyList.fromJson(Map<String, dynamic> json) {
    return CompanyList(companyId: json["CompanyID"]);
  }

  Map<String, dynamic> toJson() => {"CompanyID": companyId};
}
