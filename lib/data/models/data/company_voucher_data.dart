class CompanyVoucherTypesListData {
  int id;
  int companyId;
  String voucherMenuName;
  String description;
  String hasB2BB2C;
  String requireDeclaration;
  int orderNo;
  int hasB2B;
  String b2BPrefix;
  String b2BSuffix;
  int b2BWidth;
  int b2BStartFrom;
  String b2CPrefix;
  String b2CSuffix;
  int b2CWidth;
  int b2CStartFrom;
  String b2BDeclaration;
  String b2CDeclaration;
  int isEnabled;

  CompanyVoucherTypesListData({
    required this.id,
    required this.companyId,
    required this.voucherMenuName,
    required this.description,
    required this.hasB2BB2C,
    required this.requireDeclaration,
    required this.orderNo,
    required this.hasB2B,
    required this.b2BPrefix,
    required this.b2BSuffix,
    required this.b2BWidth,
    required this.b2BStartFrom,
    required this.b2CPrefix,
    required this.b2CSuffix,
    required this.b2CWidth,
    required this.b2CStartFrom,
    required this.b2BDeclaration,
    required this.b2CDeclaration,
    required this.isEnabled,
  });

  factory CompanyVoucherTypesListData.fromJson(Map<String, dynamic> json) =>
      CompanyVoucherTypesListData(
        id: json["id"],
        companyId: json["companyID"],
        voucherMenuName: json["voucherMenuName"],
        description: json["description"],
        hasB2BB2C: json["hasB2bB2c"],
        requireDeclaration: json["requireDeclaration"],
        orderNo: json["orderNo"],
        hasB2B: json["hasB2B"],
        b2BPrefix: json["b2BPrefix"],
        b2BSuffix: json["b2BSuffix"],
        b2BWidth: json["b2BWidth"],
        b2BStartFrom: json["b2BStartFrom"],
        b2CPrefix: json["b2CPrefix"],
        b2CSuffix: json["b2CSuffix"],
        b2CWidth: json["b2CWidth"],
        b2CStartFrom: json["b2CStartFrom"],
        b2BDeclaration: json["b2BDeclaration"],
        b2CDeclaration: json["b2CDeclaration"],
        isEnabled: json["isEnabled"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "companyID": companyId,
    "voucherMenuName": voucherMenuName,
    "description": description,
    "hasB2bB2c": hasB2BB2C,
    "requireDeclaration": requireDeclaration,
    "orderNo": orderNo,
    "hasB2B": hasB2B,
    "b2BPrefix": b2BPrefix,
    "b2BSuffix": b2BSuffix,
    "b2BWidth": b2BWidth,
    "b2BStartFrom": b2BStartFrom,
    "b2CPrefix": b2CPrefix,
    "b2CSuffix": b2CSuffix,
    "b2CWidth": b2CWidth,
    "b2CStartFrom": b2CStartFrom,
    "b2BDeclaration": b2BDeclaration,
    "b2CDeclaration": b2CDeclaration,
    "isEnabled": isEnabled,
  };
}
