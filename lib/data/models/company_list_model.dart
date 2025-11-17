class CompaniesListResponse {
  CompaniesListResponse({
    required this.companyViewList,
    required this.id,
    required this.status,
    required this.message,
  });

  final List<CompanyViewList> companyViewList;
  final int? id;
  final int? status;
  final String? message;

  factory CompaniesListResponse.fromJson(Map<String, dynamic> json) {
    return CompaniesListResponse(
      companyViewList: json["companyViewList"] == null
          ? []
          : List<CompanyViewList>.from(
              json["companyViewList"]!.map((x) => CompanyViewList.fromJson(x)),
            ),
      id: json["id"],
      status: json["status"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "companyViewList": companyViewList.map((x) => x.toJson()).toList(),
    "id": id,
    "status": status,
    "message": message,
  };
}

class CompanyViewList {
  CompanyViewList({
    required this.id,
    required this.companyName,
    required this.mailingName,
    required this.localName,
    required this.companyCode,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.pinCode,
    required this.country,
    required this.state,
    required this.officeNo,
    required this.mobile,
    required this.email,
    required this.regType,
    required this.fssaiNo,
    required this.finYearStart,
    required this.voucherRepeat,
    required this.lastSyncDate,
    required this.createBy,
    required this.createdOn,
    required this.createdFrom,
    required this.bankName,
    required this.bankBranch,
    required this.accNo,
    required this.ifscCode,
    required this.gPayNumber,
    required this.upiAddress,
    required this.payeeName,
    required this.currency,
    required this.hasIntegrationSettings,
    required this.hasVoucherTypeSettings,
    required this.hasCompanySettings,
    required this.userList,
    required this.integrationType,
    required this.serialNumber,
    required this.stockInCloud,
    required this.registrationNo,
    required this.vchNumberingMode,
  });

  final int? id;
  final String? companyName;
  final String? mailingName;
  final String? localName;
  final String? companyCode;
  final String? address1;
  final String? address2;
  final String? address3;
  final String? pinCode;
  final String? country;
  final String? state;
  final String? officeNo;
  final String? mobile;
  final String? email;
  final String? regType;
  final String? fssaiNo;
  final DateTime? finYearStart;
  final String? voucherRepeat;
  final DateTime? lastSyncDate;
  final int? createBy;
  final DateTime? createdOn;
  final String? createdFrom;
  final String? bankName;
  final String? bankBranch;
  final String? accNo;
  final String? ifscCode;
  final String? gPayNumber;
  final String? upiAddress;
  final String? payeeName;
  final String? currency;
  final int? hasIntegrationSettings;
  final int? hasVoucherTypeSettings;
  final int? hasCompanySettings;
  final String? userList;
  dynamic integrationType;
  dynamic serialNumber;
  dynamic stockInCloud;
  final String? registrationNo;
  final String? vchNumberingMode;

  factory CompanyViewList.fromJson(Map<String, dynamic> json) {
    return CompanyViewList(
      id: json["id"],
      companyName: json["companyName"],
      mailingName: json["mailingName"],
      localName: json["localName"],
      companyCode: json["companyCode"],
      address1: json["address1"],
      address2: json["address2"],
      address3: json["address3"],
      pinCode: json["pinCode"],
      country: json["country"],
      state: json["state"],
      officeNo: json["officeNo"],
      mobile: json["mobile"],
      email: json["email"],
      regType: json["regType"],
      fssaiNo: json["fssaiNo"],
      finYearStart: DateTime.tryParse(json["finYearStart"] ?? ""),
      voucherRepeat: json["voucherRepeat"],
      lastSyncDate: DateTime.tryParse(json["lastSyncDate"] ?? ""),
      createBy: json["createBy"],
      createdOn: DateTime.tryParse(json["createdOn"] ?? ""),
      createdFrom: json["createdFrom"],
      bankName: json["bankName"],
      bankBranch: json["bankBranch"],
      accNo: json["accNo"],
      ifscCode: json["ifscCode"],
      gPayNumber: json["gPayNumber"],
      upiAddress: json["upiAddress"],
      payeeName: json["payeeName"],
      currency: json["currency"],
      hasIntegrationSettings: json["hasIntegrationSettings"],
      hasVoucherTypeSettings: json["hasVoucherTypeSettings"],
      hasCompanySettings: json["hasCompanySettings"],
      userList: json["userList"],
      integrationType: json["integrationType"],
      serialNumber: json["serialNumber"],
      stockInCloud: json["stockInCloud"],
      registrationNo: json["registrationNo"],
      vchNumberingMode: json["vchNumberingMode"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "companyName": companyName,
    "mailingName": mailingName,
    "localName": localName,
    "companyCode": companyCode,
    "address1": address1,
    "address2": address2,
    "address3": address3,
    "pinCode": pinCode,
    "country": country,
    "state": state,
    "officeNo": officeNo,
    "mobile": mobile,
    "email": email,
    "regType": regType,
    "fssaiNo": fssaiNo,
    "finYearStart": finYearStart?.toIso8601String(),
    "voucherRepeat": voucherRepeat,
    "lastSyncDate": lastSyncDate?.toIso8601String(),
    "createBy": createBy,
    "createdOn": createdOn?.toIso8601String(),
    "createdFrom": createdFrom,
    "bankName": bankName,
    "bankBranch": bankBranch,
    "accNo": accNo,
    "ifscCode": ifscCode,
    "gPayNumber": gPayNumber,
    "upiAddress": upiAddress,
    "payeeName": payeeName,
    "currency": currency,
    "hasIntegrationSettings": hasIntegrationSettings,
    "hasVoucherTypeSettings": hasVoucherTypeSettings,
    "hasCompanySettings": hasCompanySettings,
    "userList": userList,
    "integrationType": integrationType,
    "serialNumber": serialNumber,
    "stockInCloud": stockInCloud,
    "registrationNo": registrationNo,
    "vchNumberingMode": vchNumberingMode,
  };
}
