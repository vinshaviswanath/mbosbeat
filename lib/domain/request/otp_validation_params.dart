import 'package:mpos_beat/core/param/param_builder.dart';

class OtpParams extends ToMap {
  OtpParams({
    required this.id,
    required this.otp,
  });

  final int? id;
  final String? otp;

  factory OtpParams.fromJson(Map<String, dynamic> json) {
    return OtpParams(
      id: json["ID"],
      otp: json["OTP"],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        "ID": id,
        "OTP": otp,
      };
}
