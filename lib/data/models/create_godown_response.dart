class GodownResponse {
    GodownResponse({
        required this.vehicleList,
        required this.id,
        required this.status,
        required this.message,
    });

    final List<dynamic> vehicleList;
    final int? id;
    final int? status;
    final String? message;

    factory GodownResponse.fromJson(Map<String, dynamic> json){ 
        return GodownResponse(
            vehicleList: json["vehicleList"] == null ? [] : List<dynamic>.from(json["vehicleList"]!.map((x) => x)),
            id: json["id"],
            status: json["status"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "vehicleList": vehicleList.map((x) => x).toList(),
        "id": id,
        "status": status,
        "message": message,
    };

}
