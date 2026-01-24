class PartyMasterListData {
  int ledgerId;
  String ledgerName;
  String ledgerNameLocal;
  String aliasName;
  String ledDesc;
  int groupId;
  Name groupName;
  bool isActive;
  bool isDeleted;
  double creditLimit;
  int dueDays;
  String address1;
  String address2;
  String address3;
  City city;
  int stateId;
  StateName stateName;
  int countryId;
  CountryName countryName;
  String? pinCode;
  double latitude;
  double longitude;
  double distanceFromCompanyKm;
  String mailingName;
  String contactPerson;
  String mobile;
  String whatsappNo;
  Email email;
  TaxType taxType;
  String taxNumber;
  String stateCode;
  double closingBalance;
  double onAccountValue;
  int routeId;
  Name routeName;
  int priceList;
  DateTime lastSyncOn;
  SyncAction syncAction;

  PartyMasterListData({
    required this.ledgerId,
    required this.ledgerName,
    required this.ledgerNameLocal,
    required this.aliasName,
    required this.ledDesc,
    required this.groupId,
    required this.groupName,
    required this.isActive,
    required this.isDeleted,
    required this.creditLimit,
    required this.dueDays,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.stateId,
    required this.stateName,
    required this.countryId,
    required this.countryName,
    required this.pinCode,
    required this.latitude,
    required this.longitude,
    required this.distanceFromCompanyKm,
    required this.mailingName,
    required this.contactPerson,
    required this.mobile,
    required this.whatsappNo,
    required this.email,
    required this.taxType,
    required this.taxNumber,
    required this.stateCode,
    required this.closingBalance,
    required this.onAccountValue,
    required this.routeId,
    required this.routeName,
    required this.priceList,
    required this.lastSyncOn,
    required this.syncAction,
  });

  factory PartyMasterListData.fromJson(Map<String, dynamic> json) =>
      PartyMasterListData(
        ledgerId: json["ledgerID"],
        ledgerName: json["ledgerName"],
        ledgerNameLocal: json["ledgerNameLocal"],
        aliasName: json["aliasName"],
        ledDesc: json["ledDesc"],
        groupId: json["groupID"],
        groupName: nameValues.map[json["groupName"]] ?? Name.UNKNOWN,
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        creditLimit: (json["creditLimit"] as num).toDouble(),
        dueDays: json["dueDays"],
        address1: json["address1"],
        address2: json["address2"],
        address3: json["address3"],
        city: cityValues.map[json["city"]] ?? City.EMPTY,
        stateId: json["stateID"],
        stateName: stateNameValues.map[json["stateName"]]??StateName.UNKNOWN,
        countryId: json["countryID"],
        countryName: countryNameValues.map[json["countryName"]]??CountryName.UNKNOWN,
        pinCode: json["pinCode"]?.toString(),

        latitude: (json["latitude"] as num).toDouble(),
        longitude: (json["longitude"] as num).toDouble(),
        distanceFromCompanyKm: (json["distanceFromCompanyKM"] as num)
            .toDouble(),
        mailingName: json["mailingName"],
        contactPerson: json["contactPerson"],
        mobile: json["mobile"],
        whatsappNo: json["whatsappNo"],
        email: emailValues.map[json["email"]] ?? Email.EMPTY,
        taxType: taxTypeValues.map[json["taxType"]] ?? TaxType.UNKNOWN,
        taxNumber: json["taxNumber"],
        stateCode: json["stateCode"],
        closingBalance: json["closingBalance"]?.toDouble(),
        onAccountValue: (json["onAccountValue"] as num).toDouble(),
        routeId: json["routeID"],
        routeName: nameValues.map[json["routeName"]] ?? Name.UNKNOWN,
        priceList: json["priceList"],
        lastSyncOn: DateTime.parse(json["lastSyncOn"]),
        syncAction: syncActionValues.map[json["syncAction"]]??SyncAction.UNKNOWN,
      );

  Map<String, dynamic> toJson() => {
    "ledgerID": ledgerId,
    "ledgerName": ledgerName,
    "ledgerNameLocal": ledgerNameLocal,
    "aliasName": aliasName,
    "ledDesc": ledDesc,
    "groupID": groupId,
    "groupName": nameValues.reverse[groupName],
    "isActive": isActive,
    "isDeleted": isDeleted,
    "creditLimit": creditLimit,
    "dueDays": dueDays,
    "address1": address1,
    "address2": address2,
    "address3": address3,
    "city": cityValues.reverse[city],
    "stateID": stateId,
    "stateName": stateNameValues.reverse[stateName],
    "countryID": countryId,
    "countryName": countryNameValues.reverse[countryName],
    "pinCode": pinCode,
    "latitude": latitude,
    "longitude": longitude,
    "distanceFromCompanyKM": distanceFromCompanyKm,
    "mailingName": mailingName,
    "contactPerson": contactPerson,
    "mobile": mobile,
    "whatsappNo": whatsappNo,
    "email": emailValues.reverse[email],
    "taxType": taxTypeValues.reverse[taxType],
    "taxNumber": taxNumber,
    "stateCode": stateCode,
    "closingBalance": closingBalance,
    "onAccountValue": onAccountValue,
    "routeID": routeId,
    "routeName": nameValues.reverse[routeName],
    "priceList": priceList,
    "lastSyncOn": lastSyncOn.toIso8601String(),
    "syncAction": syncActionValues.reverse[syncAction],
  };
}

enum City { ALUVA, EMPTY }

final cityValues = EnumValues({"Aluva": City.ALUVA, "": City.EMPTY});

enum CountryName { UNKNOWN, INDIA }

final countryNameValues = EnumValues({"India": CountryName.INDIA});

enum Email {
  ACCOUNTS_ELITEPALAZZO_COM,
  BAKERSINTERNATIONAL0421_GMAIL_COM,
  BAKERSPARKRESTAURENT_GMAIL_COM,
  BEKTASH_TURKISHCAFE_GMAIL_COM,
  BESTOWTRADING2017_GMAIL_COM,
  EMPTY,
  PURCHASE_FNB_RAJAGIRIHOSPITAL_COM,
  SHIJU_PLACKAL_TAJHOTELS_COM,
  STORESATHIRAPPILLY_STERLINGHOLIDAYS_COM,
  STORES_CAFS_IN,
  STORES_RDKOCHI_COM,
  STORES_SAJEARTH_COM,
  SUNILKUMAR_KG_FOODSTOPDINER_COM,
  SURYARESTAURANTALUVA_GMAIL_COM,
  TP_COKTX_RECEIVING_TRIBUTEPORTFOLIO,
}

final emailValues = EnumValues({
  "accounts@elitepalazzo.com                         ":
      Email.ACCOUNTS_ELITEPALAZZO_COM,
  "bakersinternational0421@gmail.com                 ":
      Email.BAKERSINTERNATIONAL0421_GMAIL_COM,
  "bakersparkrestaurent@gmail.com                    ":
      Email.BAKERSPARKRESTAURENT_GMAIL_COM,
  "bektash.turkishcafe@gmail.com                     ":
      Email.BEKTASH_TURKISHCAFE_GMAIL_COM,
  "bestowtrading2017@gmail.com                       ":
      Email.BESTOWTRADING2017_GMAIL_COM,
  "                                                  ": Email.EMPTY,
  "purchase.fnb@rajagirihospital.com                 ":
      Email.PURCHASE_FNB_RAJAGIRIHOSPITAL_COM,
  "shiju.plackal@tajhotels.com                       ":
      Email.SHIJU_PLACKAL_TAJHOTELS_COM,
  "storesathirappilly@sterlingholidays.com           ":
      Email.STORESATHIRAPPILLY_STERLINGHOLIDAYS_COM,
  "stores@cafs.in                                    ": Email.STORES_CAFS_IN,
  "stores@rdkochi.com                                ":
      Email.STORES_RDKOCHI_COM,
  "stores@sajearth.com                               ":
      Email.STORES_SAJEARTH_COM,
  "sunilkumar.kg@foodstopdiner.com                   ":
      Email.SUNILKUMAR_KG_FOODSTOPDINER_COM,
  "suryarestaurantaluva@gmail.com                    ":
      Email.SURYARESTAURANTALUVA_GMAIL_COM,
  "tp.coktx.receiving@tributeportfolio               ":
      Email.TP_COKTX_RECEIVING_TRIBUTEPORTFOLIO,
});

enum Name {
  UNKNOWN,
  ALAPPUZHA,
  ALUVA_BAKERY_AND_MANUFACTURING,
  ALUVA_HORECA,
  ALUVA_WHOLESALE,
  AL_TAZA,
  BAKERY_AND_MANUFACTURING,
  BEKTASH_TURKISH,
}

final nameValues = EnumValues({
  "ALAPPUZHA": Name.ALAPPUZHA,
  "Aluva - Bakery and Manufacturing": Name.ALUVA_BAKERY_AND_MANUFACTURING,
  "Aluva - Horeca": Name.ALUVA_HORECA,
  "Aluva - Wholesale": Name.ALUVA_WHOLESALE,
  "AL-TAZA": Name.AL_TAZA,
  "Bakery and Manufacturing": Name.BAKERY_AND_MANUFACTURING,
  "BEKTASH TURKISH": Name.BEKTASH_TURKISH,
});

enum StateName { UNKNOWN, KERALA }

final stateNameValues = EnumValues({"Kerala": StateName.KERALA});

enum SyncAction { UNKNOWN, U }

final syncActionValues = EnumValues({"U": SyncAction.U});

enum TaxType { UNKNOWN, COMPOSITION, REGULAR, UNREGISTERED_CONSUMER }

final taxTypeValues = EnumValues({
  "Composition": TaxType.COMPOSITION,
  "Regular": TaxType.REGULAR,
  "Unregistered/Consumer": TaxType.UNREGISTERED_CONSUMER,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
