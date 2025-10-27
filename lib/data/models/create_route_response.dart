class RouteResponse {
    RouteResponse({
        required this.routeList,
        required this.id,
        required this.status,
        required this.message,
    });

    final List<dynamic> routeList;
    final int? id;
    final int? status;
    final String? message;

    factory RouteResponse.fromJson(Map<String, dynamic> json){ 
        return RouteResponse(
            routeList: json["routeList"] == null ? [] : List<dynamic>.from(json["routeList"]!.map((x) => x)),
            id: json["id"],
            status: json["status"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "routeList": routeList.map((x) => x).toList(),
        "id": id,
        "status": status,
        "message": message,
    };

}
