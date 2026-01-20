import 'dart:io';
import 'package:mpos_beat/core/param/param_builder.dart';

class CompanyProfileModel extends ToMap {
  final String companyId;
  final String companyCode;
  final String officeNumber;
  final String mobileNumber;
  final String emailId;
  final File? cmpLogo;

  CompanyProfileModel({
    required this.companyId,
    required this.companyCode,
    required this.officeNumber,
    required this.mobileNumber,
    required this.emailId,
    this.cmpLogo,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'CompanyID': companyId,
      'CompanyCode': companyCode,
      'OfficeNumber': officeNumber,
      'MobileNumber': mobileNumber,
      'EmailID': emailId,
      'CmpLogo': cmpLogo == null ? '' : null,
    };
  }

  /// Files ONLY (used by postFormData)
  Map<String, File> toFiles() {
    return {
      if (cmpLogo != null) 'CmpLogo': cmpLogo!,
    };
  }

  CompanyProfileModel copyWith({
    String? companyId,
    String? companyCode,
    String? officeNumber,
    String? mobileNumber,
    String? emailId,
    File? cmpLogo,
  }) {
    return CompanyProfileModel(
      companyId: companyId ?? this.companyId,
      companyCode: companyCode ?? this.companyCode,
      officeNumber: officeNumber ?? this.officeNumber,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      emailId: emailId ?? this.emailId,
      cmpLogo: cmpLogo ?? this.cmpLogo,
    );
  }
}
