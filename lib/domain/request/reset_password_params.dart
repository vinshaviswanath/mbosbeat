import 'package:mpos_beat/core/param/param_builder.dart';

class ResetPasswordParam extends ToMap{
    ResetPasswordParam({
        required this.username,
    });

    final String? username;

    factory ResetPasswordParam.fromJson(Map<String, dynamic> json){ 
        return ResetPasswordParam(
            username: json["Username"],
        );
    }
@override
    Map<String, dynamic> toMap() => {
        "Username": username,
    };

}
