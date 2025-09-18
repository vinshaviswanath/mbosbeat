import 'package:mpos_beat/data/models/data/login_data.dart';

class LoginResponse {
    LoginResponse({
        required this.loginData,
        required this.id,
        required this.status,
        required this.message,
    });

    final LoginData? loginData;
    final int? id;
    final int? status;
    final String? message;

    factory LoginResponse.fromJson(Map<String, dynamic> json){ 
        return LoginResponse(
            loginData: json["loginData"] == null ? null : LoginData.fromJson(json["loginData"]),
            id: json["id"],
            status: json["status"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "loginData": loginData?.toJson(),
        "id": id,
        "status": status,
        "message": message,
    };

}


