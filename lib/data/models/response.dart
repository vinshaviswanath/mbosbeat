class DefaultResponse {
    DefaultResponse({
        required this.id,
        required this.status,
        required this.message,
    });

    final int? id;
    final int? status;
    final String? message;

    factory DefaultResponse.fromJson(Map<String, dynamic> json){ 
        return DefaultResponse(
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
