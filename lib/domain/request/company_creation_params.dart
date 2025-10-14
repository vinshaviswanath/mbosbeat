import 'package:mpos_beat/core/param/param_builder.dart';

class CompanyCreationParams extends ToMap {
  int id;
  String? companyName;
  String? displayName;
  String? address1;
  String? address2;
  String? address3;
  String? pincode;
  String? countryId;
  String? stateId;
  String? regType;

  CompanyCreationParams({
    required this.id,
    required this.companyName,
    required this.displayName,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.pincode,
    required this.countryId,
    required this.stateId,
    required this.regType,
  });

  @override
  Map<String, dynamic> toMap() => {
    "ID": id,
    "CompanyName": companyName,
    "DisplayName": displayName,
    "Address1": address1,
    "Address2": address2,
    "Address3": address3,
    "PinCode": pincode,
    "Country": countryId,
    "State": stateId,
    "RegistrationType": regType,
  };
}
