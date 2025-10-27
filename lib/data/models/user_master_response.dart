class UserMasterResponse {
    UserMasterResponse({
        required this.userMasterList,
        required this.id,
        required this.status,
        required this.message,
    });

    final List<dynamic> userMasterList;
    final int? id;
    final int? status;
    final String? message;

    factory UserMasterResponse.fromJson(Map<String, dynamic> json){ 
        return UserMasterResponse(
            userMasterList: json["userMasterList"] == null ? [] : List<dynamic>.from(json["userMasterList"]!.map((x) => x)),
            id: json["id"],
            status: json["status"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "userMasterList": userMasterList.map((x) => x).toList(),
        "id": id,
        "status": status,
        "message": message,
    };

}