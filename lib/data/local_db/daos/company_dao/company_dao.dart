import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/company_tables.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';

part 'company_dao.g.dart';

@DriftAccessor(tables: [Companies])
class CompanyDao extends DatabaseAccessor<AppDb> with _$CompanyDaoMixin {
  CompanyDao(super.db);

  // Convert empty string to null DateTime
  DateTime? _safeDate(dynamic value) {
    if (value == null || value == "" || value.toString().trim().isEmpty) {
      return null;
    }
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }

  Future<void> insertCompanies(List<CompanyViewList> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        companies,
        list.map((e) {
          return CompaniesCompanion(
            id: Value(e.id),
            companyName: Value(e.companyName),
            mailingName: Value(e.mailingName),
            localName: Value(e.localName),
            companyCode: Value(e.companyCode),
            address1: Value(e.address1),
            address2: Value(e.address2),
            address3: Value(e.address3),
            pinCode: Value(e.pinCode),
            country: Value(e.country),
            state: Value(e.state),
            officeNo: Value(e.officeNo),
            mobile: Value(e.mobile),
            email: Value(e.email),
            regType: Value(e.regType),
            fssaiNo: Value(e.fssaiNo),
            finYearStart: Value(_safeDate(e.finYearStart)),
            voucherRepeat: Value(e.voucherRepeat),
            lastSyncDate: Value(_safeDate(e.lastSyncDate)),
            createBy: Value(e.createBy),
            createdOn: Value(_safeDate(e.createdOn)),
            createdFrom: Value(e.createdFrom),
            bankName: Value(e.bankName),
            bankBranch: Value(e.bankBranch),
            accNo: Value(e.accNo),
            ifscCode: Value(e.ifscCode),
            gPayNumber: Value(e.gPayNumber),
            upiAddress: Value(e.upiAddress),
            payeeName: Value(e.payeeName),
            currency: Value(e.currency),
            hasIntegrationSettings: Value(e.hasIntegrationSettings),
            hasVoucherTypeSettings: Value(e.hasVoucherTypeSettings),
            hasCompanySettings: Value(e.hasCompanySettings),
            userList: Value(e.userList),
            integrationType: Value(e.integrationType?.toString()),
            serialNumber: Value(e.serialNumber?.toString()),
            stockInCloud: Value(e.stockInCloud?.toString()),
            registrationNo: Value(e.registrationNo),
            vchNumberingMode: Value(e.vchNumberingMode),
          );
        }).toList(),
      );
    });
  }

  /// 🔹 Get All Companies (one time)
  Future<List<Company>> getAllCompanies() async {
    return select(companies).get();
  }

  /// 🔥 STREAM OF COMPANIES (LIVE UPDATES)
  Stream<List<Company>> watchAllCompanies() {
    return select(companies).watch();
  }

  /// SAFE JSON PRINTING
  Future<void> printCompaniesAsJson() async {
    final list = await select(companies).get();

    Logger.logInfo("COMPANY List Length :: ${list.length}");
    print("===== COMPANY TABLE JSON =====");

    for (var c in list) {
      try {
        final jsonMap = companyToJson(c);
        print(const JsonEncoder.withIndent("  ").convert(jsonMap));
      } catch (e) {
        print("Error printing row with ID ${c.id}: $e");
      }
    }

    print("================================");
  }

  Map<String, dynamic> companyToJson(Company c) {
    String? _d(DateTime? d) => d?.toIso8601String();

    return {
      "id": c.id,
      "companyName": c.companyName,
      "mailingName": c.mailingName,
      "localName": c.localName,
      "companyCode": c.companyCode,
      "address1": c.address1,
      "address2": c.address2,
      "address3": c.address3,
      "pinCode": c.pinCode,
      "country": c.country,
      "state": c.state,
      "officeNo": c.officeNo,
      "mobile": c.mobile,
      "email": c.email,
      "regType": c.regType,
      "fssaiNo": c.fssaiNo,
      "finYearStart": _d(c.finYearStart),
      "voucherRepeat": c.voucherRepeat,
      "lastSyncDate": _d(c.lastSyncDate),
      "createBy": c.createBy,
      "createdOn": _d(c.createdOn),
      "createdFrom": c.createdFrom,
      "bankName": c.bankName,
      "bankBranch": c.bankBranch,
      "accNo": c.accNo,
      "ifscCode": c.ifscCode,
      "gPayNumber": c.gPayNumber,
      "upiAddress": c.upiAddress,
      "payeeName": c.payeeName,
      "currency": c.currency,
      "hasIntegrationSettings": c.hasIntegrationSettings,
      "hasVoucherTypeSettings": c.hasVoucherTypeSettings,
      "hasCompanySettings": c.hasCompanySettings,
      "userList": c.userList,
      "integrationType": c.integrationType,
      "serialNumber": c.serialNumber,
      "stockInCloud": c.stockInCloud,
      "registrationNo": c.registrationNo,
      "vchNumberingMode": c.vchNumberingMode,
    };
  }

  Future<void> clearAll() async {
    await delete(companies).go();
  }
}

