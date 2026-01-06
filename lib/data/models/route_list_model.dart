class RouteListModel {
    RouteListModel({
        required this.routeList,
        required this.id,
        required this.status,
        required this.message,
    });

    final List<RouteList> routeList;
    final int? id;
    final int? status;
    final String? message;

    factory RouteListModel.fromJson(Map<String, dynamic> json){ 
        return RouteListModel(
            routeList: json["routeList"] == null ? [] : List<RouteList>.from(json["routeList"]!.map((x) => RouteList.fromJson(x))),
            id: json["id"],
            status: json["status"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "routeList": routeList.map((x) => x.toJson()).toList(),
        "id": id,
        "status": status,
        "message": message,
    };

}

class RouteList {
    RouteList({
        required this.id,
        required this.companyId,
        required this.routeCode,
        required this.routeName,
        required this.active,
    });

    final int? id;
    final int? companyId;
    final String? routeCode;
    final String? routeName;
    final int? active;

    factory RouteList.fromJson(Map<String, dynamic> json){ 
        return RouteList(
            id: json["id"],
            companyId: json["companyID"],
            routeCode: json["routeCode"],
            routeName: json["routeName"],
            active: json["active"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "companyID": companyId,
        "routeCode": routeCode,
        "routeName": routeName,
        "active": active,
    };

}
