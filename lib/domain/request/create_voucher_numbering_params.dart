import 'package:mpos_beat/core/param/param_builder.dart';

class CreateVoucherNumberingParams extends ToMap{
    CreateVoucherNumberingParams({
        required this.companyId,
        required this.voucherMode,
        required this.voucherModeId,
        required this.voucherNumbers,
    });

    final int? companyId;
    final String? voucherMode;
    final int? voucherModeId;
    final List<VoucherNumber> voucherNumbers;

    factory CreateVoucherNumberingParams.fromJson(Map<String, dynamic> json){ 
        return CreateVoucherNumberingParams(
            companyId: json["companyID"],
            voucherMode: json["voucherMode"],
            voucherModeId: json["voucherModeID"],
            voucherNumbers: json["VoucherNumbers"] == null ? [] : List<VoucherNumber>.from(json["VoucherNumbers"]!.map((x) => VoucherNumber.fromJson(x))),
        );
    }

@override
    Map<String, dynamic> toMap() => {
        "companyID": companyId,
        "voucherMode": voucherMode,
        "voucherModeID": voucherModeId,
        "VoucherNumbers": voucherNumbers.map((x) => x.toJson()).toList(),
    };

}

class VoucherNumber {
    VoucherNumber({
        required this.voucherTypeId,
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

    final int? voucherTypeId;
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

    factory VoucherNumber.fromJson(Map<String, dynamic> json){ 
        return VoucherNumber(
            voucherTypeId: json["VoucherTypeID"],
            applicableFrom: DateTime.tryParse(json["ApplicableFrom"] ?? ""),
            hasB2B: json["HasB2B"],
            b2BPrefix: json["B2BPrefix"],
            b2BSuffix: json["B2BSuffix"],
            b2BWidth: json["B2BWidth"],
            b2BStartFrom: json["B2BStartFrom"],
            b2CPrefix: json["B2CPrefix"],
            b2CSuffix: json["B2CSuffix"],
            b2CWidth: json["B2CWidth"],
            b2CStartFrom: json["B2CStartFrom"],
            b2BDeclaration: json["B2BDeclaration"],
            b2CDeclaration: json["B2CDeclaration"],
        );
    }

    Map<String, dynamic> toJson() => {
        "VoucherTypeID": voucherTypeId,
        "ApplicableFrom": "${applicableFrom?.year.toString().padLeft(4,'0')}-${applicableFrom?.month.toString().padLeft(2,'0')}-${applicableFrom?.day.toString().padLeft(2,'0')}",
        "HasB2B": hasB2B,
        "B2BPrefix": b2BPrefix,
        "B2BSuffix": b2BSuffix,
        "B2BWidth": b2BWidth,
        "B2BStartFrom": b2BStartFrom,
        "B2CPrefix": b2CPrefix,
        "B2CSuffix": b2CSuffix,
        "B2CWidth": b2CWidth,
        "B2CStartFrom": b2CStartFrom,
        "B2BDeclaration": b2BDeclaration,
        "B2CDeclaration": b2CDeclaration,
    };

}
