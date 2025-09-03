class LocalUser {
  final String name;
  final String email;
  final String phone;
  final String password;
  final bool isOtpVerified;

  LocalUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.isOtpVerified = false,
  });

  LocalUser copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
    bool? isOtpVerified,
  }) {
    return LocalUser(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      isOtpVerified: isOtpVerified ?? this.isOtpVerified,
    );
  }

  factory LocalUser.fromJson(Map<String, dynamic> json) {
    return LocalUser(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',
      isOtpVerified: json['isOtpVerified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "isOtpVerified": isOtpVerified,
    };
  }
}
