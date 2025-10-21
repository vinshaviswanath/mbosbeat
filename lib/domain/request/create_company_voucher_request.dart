import 'package:mpos_beat/core/param/param_builder.dart';

class CreateCompanyVocherParams extends ToMap {
  int? id;
  int? companyid;
  int? hasB2B;
  String? b2Bprefix;
  String? b2Bsuffix;
  int? b2Bwidth;
  String? b2Bdeclaration;
  String? b2Cprefix;
  String? b2Csuffix;
  int? b2Cwidth;
  String? b2Cdeclaration;
  int? isenabled;
  CreateCompanyVocherParams({
    required this.id,
    required this.companyid,
    required this.hasB2B,
    required this.b2Bprefix,
    required this.b2Bsuffix,
    required this.b2Bwidth,
    required this.b2Bdeclaration,
    required this.b2Cprefix,
    required this.b2Csuffix,
    required this.b2Cwidth,
    required this.b2Cdeclaration,
    required this.isenabled,
  });

  Map<String, dynamic> tojson() {
    return {
      "ID": id,
      "CompanyID": companyid,
      "HasB2B": hasB2B,
      "B2BPrefix": b2Bprefix,
      "B2BSuffix": b2Bsuffix,
      "B2BWidth": b2Bwidth,
      "B2BStartFrom": 0,
      "B2CPrefix": b2Cprefix,
      "B2CSuffix": b2Csuffix,
      "B2CWidth": b2Cwidth,
      "B2CStartFrom": 0,
      "B2BDeclaration": b2Bdeclaration,
      "B2CDeclaration": b2Cdeclaration,
      "IsEnabled": isenabled,
    };
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "ID": id,
      "CompanyID": companyid,
      "HasB2B": hasB2B,
      "B2BPrefix": b2Bprefix,
      "B2BSuffix": b2Bsuffix,
      "B2BWidth": b2Bwidth,
      "B2BStartFrom": 0,
      "B2CPrefix": b2Cprefix,
      "B2CSuffix": b2Csuffix,
      "B2CWidth": b2Cwidth,
      "B2CStartFrom": 0,
      "B2BDeclaration": b2Bdeclaration,
      "B2CDeclaration": b2Cdeclaration,
      "IsEnabled": isenabled,
    };
  }
}
