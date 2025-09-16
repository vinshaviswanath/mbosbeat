import 'dart:convert';

import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:encrypt/encrypt.dart';

class ResendOtpParams extends ToMap {
  ResendOtpParams({
    required this.userId,
  }) : secret = _generateSecret();

  final int userId;
  final String secret;

  factory ResendOtpParams.fromJson(Map<String, dynamic> json) {
    return ResendOtpParams(
      userId: json["UserID"],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        "UserID": userId,
        "Secret": secret,
      };

  static String _generateSecret() {
    final now = DateTime.now();
    const key = 'ManvishInfoSolutionspvtltd123456';

    final keyBytes = Key.fromUtf8(key.padRight(32, '0').substring(0, 32));
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(keyBytes));

    final dateString = now.toIso8601String();
    final encrypted = encrypter.encrypt(dateString, iv: iv);

    return '${encrypted.base64}:${base64.encode(iv.bytes)}';
  }
}
