import 'package:mpos_beat/data/models/data/otp_response_data.dart';

class OtpResponse {
    OtpResponse({
        required this.loginData,
        required this.id,
        required this.status,
        required this.message,
    });

    final OtpResponseData? loginData;
    final int? id;
    final int? status;
    final String? message;

    factory OtpResponse.fromJson(Map<String, dynamic> json){ 
        return OtpResponse(
            loginData: json["loginData"] == null ? null : OtpResponseData.fromJson(json["loginData"]),
            id: json["id"] ?? 0,
            status: json["status"] ?? 0,
            message: json["message"] ?? '',
        );
    }

 Map<String, dynamic> toJson() => {
        "loginData": loginData?.toJson(),
        "id": id,
        "status": status,
        "message": message,
      };
}


