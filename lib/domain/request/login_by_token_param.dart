import 'package:mpos_beat/core/param/param_builder.dart';

class LoginByTokenParam extends ToMap{
    LoginByTokenParam({
        required this.token,
    });

    final String? token;

    factory LoginByTokenParam.fromJson(Map<String, dynamic> json){ 
        return LoginByTokenParam(
            token: json["Token"],
        );
    }

@override
    Map<String, dynamic> toMap() => {
        "Token": token,
    };

}
