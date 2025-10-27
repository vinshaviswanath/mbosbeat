class DesignationResponse {
    DesignationResponse({
        required this.userDesignationList,
        required this.id,
        required this.status,
        required this.message,
    });

    final List<dynamic> userDesignationList;
    final int? id;
    final int? status;
    final String? message;

    factory DesignationResponse.fromJson(Map<String, dynamic> json){ 
        return DesignationResponse(
            userDesignationList: json["userDesignationList"] == null ? [] : List<dynamic>.from(json["userDesignationList"]!.map((x) => x)),
            id: json["id"],
            status: json["status"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "userDesignationList": userDesignationList.map((x) => x).toList(),
        "id": id,
        "status": status,
        "message": message,
    };

}
