class RegistrationTypeData {
  int id;
  int countryId;
  String registrationType;

  RegistrationTypeData({
    required this.id,
    required this.countryId,
    required this.registrationType,
  });

  factory RegistrationTypeData.fromJson(Map<String, dynamic> json) =>
      RegistrationTypeData(
        id: json["id"],
        countryId: json["countryID"],
        registrationType: json["registrationType"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "countryID": countryId,
    "registrationType": registrationType,
  };
}
