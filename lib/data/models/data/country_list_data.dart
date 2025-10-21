class CountryListData {
  int id;
  String countryName;
  String stateTitle;
  String pinTitle;
  String currency;
  dynamic altCurrency;
  int currencyNod;
  dynamic currencySymbol;
  dynamic taxApplicable;
  dynamic taxType;
  String taxRegNoTitle;
  dynamic cessApplicable;
  dynamic exciseApplicable;

  CountryListData({
    required this.id,
    required this.countryName,
    required this.stateTitle,
    required this.pinTitle,
    required this.currency,
    required this.altCurrency,
    required this.currencyNod,
    required this.currencySymbol,
    required this.taxApplicable,
    required this.taxType,
    required this.taxRegNoTitle,
    required this.cessApplicable,
    required this.exciseApplicable,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CountryListData && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory CountryListData.fromJson(Map<String, dynamic> json) =>
      CountryListData(
        id: json["id"] ?? 0,
        countryName: json["countryName"] ?? "",
        stateTitle: json["stateTitle"] ?? "",
        pinTitle: json["pinTitle"] ?? "",
        currency: json["currency"] ?? "",
        altCurrency: json["altCurrency"],
        currencyNod: json["currencyNOD"] ?? 0,
        currencySymbol: json["currencySymbol"],
        taxApplicable: json["taxApplicable"],
        taxType: json["taxType"] ?? "",
        taxRegNoTitle: json["taxRegNoTitle"] ?? "",
        cessApplicable: json["cessApplicable"],
        exciseApplicable: json["exciseApplicable"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "countryName": countryName,
    "stateTitle": stateTitle,
    "pinTitle": pinTitle,
    "currency": currency,
    "altCurrency": altCurrency,
    "currencyNOD": currencyNod,
    "currencySymbol": currencySymbol,
    "taxApplicable": taxApplicable,
    "taxType": taxType,
    "taxRegNoTitle": taxRegNoTitle,
    "cessApplicable": cessApplicable,
    "exciseApplicable": exciseApplicable,
  };
}
