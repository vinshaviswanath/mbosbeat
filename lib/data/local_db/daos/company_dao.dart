import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/company_tables.dart';
import 'package:mpos_beat/data/models/company_list_model.dart';

part 'company_dao.g.dart';

@DriftAccessor(tables: [Companies])
class CompanyDao extends DatabaseAccessor<AppDb> with _$CompanyDaoMixin {
  CompanyDao(super.db);

  Future<void> insertCompanies(List<CompanyViewList> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        companies,
        list.map((e) {
          return CompaniesCompanion.insert(
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
            finYearStart: Value(e.finYearStart),
            voucherRepeat: Value(e.voucherRepeat),
            lastSyncDate: Value(e.lastSyncDate),
            createBy: Value(e.createBy),
            createdOn: Value(e.createdOn),
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

  Future<List<Company>> getAllCompanies() async {
    return select(companies).get();
  }

  Future<void> printCompaniesAsJson() async {
    final list = await select(companies).get();
    final jsonList = list.map((c) => companyToJson(c)).toList();

    final prettyJson = const JsonEncoder.withIndent('  ').convert(jsonList);

    print("===== COMPANY TABLE JSON =====");
    print(prettyJson);
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
