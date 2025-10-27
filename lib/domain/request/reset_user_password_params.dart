import 'package:mpos_beat/core/param/param_builder.dart';

class ResetUserPasswordParams extends ToMap {
  final String userId;
  final String password;

  ResetUserPasswordParams(  {required this.userId,required this.password,});

  @override
  Map<String, dynamic> toMap() {
    return {
      "UserID": userId,
      "Password" : password
    };
  }
}