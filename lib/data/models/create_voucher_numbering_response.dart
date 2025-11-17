class ResponseModel {
    ResponseModel({
        required this.id,
        required this.status,
        required this.message,
    });

    final int? id;
    final int? status;
    final String? message;

    factory ResponseModel.fromJson(Map<String, dynamic> json){ 
        return ResponseModel(
            id: json["id"],
            status: json["status"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "message": message,
    };

}
