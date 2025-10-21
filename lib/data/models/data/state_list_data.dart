class StateListData {
  int id;
  int countryId;
  String stateName;
  String? stateCode;

  StateListData({
    required this.id,
    required this.countryId,
    required this.stateName,
    this.stateCode,
  });

  factory StateListData.fromJson(Map<String, dynamic> json) => StateListData(
    id: json["id"],
    countryId: json["countryID"],
    stateName: json["stateName"],
    stateCode: json["stateCode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "countryID": countryId,
    "stateName": stateName,
    "stateCode": stateCode,
  };
}
