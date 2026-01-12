import 'package:mpos_beat/core/param/param_builder.dart';

class LoginParams extends ToMap{
    LoginParams({
        required this.username,
        required this.password,
        required this.isAdmin
    });

    final String? username;
    final String? password;
    final bool isAdmin;

    factory LoginParams.fromJson(Map<String, dynamic> json){ 
        return LoginParams(
            username: json["Username"],
            password: json["Password"],
            isAdmin:  json["IsAdmin"]
        );
    }

@override
    Map<String, dynamic> toMap() => {
        "Username": username,
        "Password": password,
        "IsAdmin" : isAdmin
    };

}
