class SkipReasonResponse {
    SkipReasonResponse({
        required this.skipReasons,
        required this.id,
        required this.status,
        required this.message,
    });

    final List<SkipReasonData> skipReasons;
    final int? id;
    final int? status;
    final String? message;

    factory SkipReasonResponse.fromJson(Map<String, dynamic> json){ 
        return SkipReasonResponse(
            skipReasons: json["skipReasons"] == null ? [] : List<SkipReasonData>.from(json["skipReasons"]!.map((x) => SkipReasonData.fromJson(x))),
            id: json["id"],
            status: json["status"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "skipReasons": skipReasons.map((x) => x.toJson()).toList(),
        "id": id,
        "status": status,
        "message": message,
    };

}

class SkipReasonData {
    SkipReasonData({
        required this.id,
        required this.reason,
    });

    final int? id;
    final String? reason;

    factory SkipReasonData.fromJson(Map<String, dynamic> json){ 
        return SkipReasonData(
            id: json["id"],
            reason: json["reason"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "reason": reason,
    };

}
