import 'package:mpos_beat/core/param/param_builder.dart';

class UserSettingsParams extends ToMap {
  UserSettingsParams({
    required this.id,
    required this.userId,
    required this.value,
  });

  final int? id;
  final int? userId;
  final String? value;

  factory UserSettingsParams.fromJson(Map<String, dynamic> json) {
    return UserSettingsParams(
      id: json["ID"],
      userId: json["UserID"],
      value: json["Value"],
    );
  }

  @override
  Map<String, dynamic> toMap() => {"ID": id, "UserID": userId, "Value": value};
}
