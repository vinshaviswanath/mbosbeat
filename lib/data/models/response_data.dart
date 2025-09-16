class ResponseData {
    ResponseData({
        required this.loginData,
        required this.id,
        required this.status,
        required this.message,
    });

    final dynamic loginData;
    final int? id;
    final int? status;
    final String? message;

    factory ResponseData.fromJson(Map<String, dynamic> json){ 
        return ResponseData(
            loginData: json["loginData"],
            id: json["id"],
            status: json["status"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "loginData": loginData,
        "id": id,
        "status": status,
        "message": message,
    };

}
