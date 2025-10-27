import 'package:mpos_beat/core/param/param_builder.dart';

class CreateGodownParams extends ToMap{
    CreateGodownParams({
        required this.id,
        required this.companyId,
        required this.code,
        required this.name,
    });

    final int? id;
    final int? companyId;
    final String? code;
    final String? name;

    factory CreateGodownParams.fromJson(Map<String, dynamic> json){ 
        return CreateGodownParams(
            id: json["ID"],
            companyId: json["CompanyID"],
            code: json["Code"],
            name: json["Name"],
        );
    }

@override
    Map<String, dynamic> toMap() => {
        "ID": id,
        "CompanyID": companyId,
        "Code": code,
        "Name": name,
        "Active": 1,
    };

}
