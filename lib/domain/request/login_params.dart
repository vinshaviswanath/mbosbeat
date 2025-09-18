import 'package:mpos_beat/core/param/param_builder.dart';

class LoginParams extends ToMap{
    LoginParams({
        required this.username,
        required this.password,
    });

    final String? username;
    final String? password;

    factory LoginParams.fromJson(Map<String, dynamic> json){ 
        return LoginParams(
            username: json["Username"],
            password: json["Password"],
        );
    }

@override
    Map<String, dynamic> toMap() => {
        "Username": username,
        "Password": password,
    };

}
