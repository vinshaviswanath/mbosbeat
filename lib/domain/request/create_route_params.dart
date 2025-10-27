import 'package:mpos_beat/core/param/param_builder.dart';

class CreateRouteParams extends ToMap{
    CreateRouteParams({
        required this.id,
        required this.companyId,
        required this.routeCode,
        required this.routeName,
    });

    final int? id;
    final int? companyId;
    final String? routeCode;
    final String? routeName;

    factory CreateRouteParams.fromJson(Map<String, dynamic> json){ 
        return CreateRouteParams(
            id: json["ID"],
            companyId: json["CompanyID"],
            routeCode: json["RouteCode"],
            routeName: json["RouteName"],
        );
    }

@override
    Map<String, dynamic> toMap() => {
        "ID": id,
        "CompanyID": companyId,
        "RouteCode": routeCode,
        "RouteName": routeName,
        "Active": 1,
    };

}
