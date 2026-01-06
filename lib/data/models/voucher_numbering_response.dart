class VoucherNumberingResponse {
    VoucherNumberingResponse({
        required this.voucherNumberingModels,
        required this.id,
        required this.status,
        required this.message,
    });

    final List<VoucherNumberingModel> voucherNumberingModels;
    final int? id;
    final int? status;
    final String? message;

    factory VoucherNumberingResponse.fromJson(Map<String, dynamic> json){ 
        return VoucherNumberingResponse(
            voucherNumberingModels: json["voucherNumberingModels"] == null ? [] : List<VoucherNumberingModel>.from(json["voucherNumberingModels"]!.map((x) => VoucherNumberingModel.fromJson(x))),
            id: json["id"],
            status: json["status"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "voucherNumberingModels": voucherNumberingModels.map((x) => x.toJson()).toList(),
        "id": id,
        "status": status,
        "message": message,
    };

}

class VoucherNumberingModel {
    VoucherNumberingModel({
        required this.companyId,
        required this.voucherTypeId,
        required this.voucherMenuName,
        required this.voucherMode,
        required this.voucherModeId,
        required this.voucherModeName,
        required this.applicableFrom,
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
    });

    final int? companyId;
    final int? voucherTypeId;
    final String? voucherMenuName;
    final String? voucherMode;
    final int? voucherModeId;
    final String? voucherModeName;
    final DateTime? applicableFrom;
    final int? hasB2B;
    final String? b2BPrefix;
    final String? b2BSuffix;
    final int? b2BWidth;
    final int? b2BStartFrom;
    final String? b2CPrefix;
    final String? b2CSuffix;
    final int? b2CWidth;
    final int? b2CStartFrom;
    final String? b2BDeclaration;
    final String? b2CDeclaration;

    factory VoucherNumberingModel.fromJson(Map<String, dynamic> json){ 
        return VoucherNumberingModel(
            companyId: json["companyID"],
            voucherTypeId: json["voucherTypeID"],
            voucherMenuName: json["voucherMenuName"],
            voucherMode: json["voucherMode"],
            voucherModeId: json["voucherModeID"],
            voucherModeName: json["voucherModeName"],
            applicableFrom: DateTime.tryParse(json["applicableFrom"] ?? ""),
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
        );
    }

    Map<String, dynamic> toJson() => {
        "companyID": companyId,
        "voucherTypeID": voucherTypeId,
        "voucherMenuName": voucherMenuName,
        "voucherMode": voucherMode,
        "voucherModeID": voucherModeId,
        "voucherModeName": voucherModeName,
        "applicableFrom": applicableFrom?.toIso8601String(),
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
    };

}
