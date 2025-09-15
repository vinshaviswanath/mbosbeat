class CompanyRegistrationResponse {
    CompanyRegistrationResponse({
        required this.registrationList,
        required this.id,
        required this.status,
        required this.message,
    });

    final List<dynamic> registrationList;
    final int? id;
    final int? status;
    final String? message;

factory CompanyRegistrationResponse.fromJson(Map<String, dynamic> json) {
  return CompanyRegistrationResponse(
    registrationList: json["registrationList"] == null
        ? []
        : List<dynamic>.from(json["registrationList"]!.map((x) => x)),
    id: json["id"] == null ? null : int.tryParse(json["id"].toString()),
    status: json["status"] == null ? null : int.tryParse(json["status"].toString()),
    message: json["message"]?.toString(),
  );
}

Map<String, dynamic> toJson() {
    return {
      "registrationList": registrationList,
      "id": id,
      "status": status,
      "message": message,
    };
  }
}
