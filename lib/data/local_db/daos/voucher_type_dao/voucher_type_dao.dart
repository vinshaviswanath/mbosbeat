import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/user_settings_tables.dart';
import 'package:mpos_beat/data/local_db/tables/voucher_types_tables.dart';

part 'voucher_type_dao.g.dart';

@DriftAccessor(tables: [VoucherTypes,UserSettingsTable])
class VoucherTypesDao extends DatabaseAccessor<AppDb>
    with _$VoucherTypesDaoMixin {
  VoucherTypesDao(super.db);

  // Insert or replace
  Future<void> insertVoucherType(VoucherType voucher) async {
    await into(voucherTypes).insertOnConflictUpdate(voucher);
  }

  // Bulk insert
  Future<void> insertVoucherTypes(List<VoucherType> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(voucherTypes, list);
    });
  }

  // Get all
  Future<List<VoucherType>> getAllVoucherTypes() {
    return select(voucherTypes).get();
  }

  Stream<List<VoucherType>> watchAllVoucherTypes() {
    return select(voucherTypes).watch();
  }

  // Get by companyId
  Future<List<VoucherType>> getVoucherTypesByCompany(int companyId) {
    return (select(voucherTypes)
          ..where((tbl) => tbl.companyId.equals(companyId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.orderNo)]))
        .get();
  }

  Stream<List<VoucherType>> watchVoucherTypesByCompany(int companyId) {
    return (select(voucherTypes)
          ..where((tbl) => tbl.companyId.equals(companyId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.orderNo)]))
        .watch();
  }

  Stream<List<VoucherType>> watchEnabledVoucherTypesByCompany(int companyId) {
  return (select(voucherTypes)
        ..where((tbl) =>
            tbl.companyId.equals(companyId) & tbl.isEnabled.equals(1))
        ..orderBy([(tbl) => OrderingTerm.asc(tbl.orderNo)]))
      .watch();
}


  // Delete all
  Future<int> deleteAll() {
    return delete(voucherTypes).go();
  }

  Future<void> printAllVoucherTypes() async {
    final list = await select(voucherTypes).get();

    if (list.isEmpty) {
      debugPrint("VoucherTypes table is empty");
      return;
    }

    for (final row in list) {
      debugPrint(
        "Voucher Type → \n"
        "ID: ${row.id}, \n"
        "CompanyID: ${row.companyId}, \n"
        "VoucherMenuName: ${row.voucherMenuName}, \n"
        "Description: ${row.description}, \n"
        "HasB2BB2C: ${row.hasB2BB2C}, \n"
        "RequireDeclaration: ${row.requireDeclaration}, \n"
        "OrderNo: ${row.orderNo}, \n"
        "HasB2B: ${row.hasB2B}, \n"
        "B2B Prefix: ${row.b2BPrefix}, \n"
        "B2B Suffix: ${row.b2BSuffix}, \n"
        "B2B Width: ${row.b2BWidth}, \n"
        "B2B StartFrom: ${row.b2BStartFrom}, \n"
        "B2C Prefix: ${row.b2CPrefix}, \n"
        "B2C Suffix: ${row.b2CSuffix}, \n"
        "B2C Width: ${row.b2CWidth}, \n"
        "B2C StartFrom: ${row.b2CStartFrom}, \n"
        "B2B Declaration: ${row.b2BDeclaration}, \n"
        "B2C Declaration: ${row.b2CDeclaration}, \n"
        "IsEnabled: ${row.isEnabled} \n"
        "\n"
        "<<<<==============================>>>> \n",
      );
    }
  }

  Future<void> deleteByCompany(int companyId) {
  return (delete(voucherTypes)
        ..where((tbl) => tbl.companyId.equals(companyId)))
      .go();
}

Stream<List<VoucherType>> watchPermittedVoucherTypes({
  required int companyId,
  required int userId,
}) {
  final query = select(voucherTypes).join([
    innerJoin(
      userSettingsTable,
      userSettingsTable.menuName.equalsExp(voucherTypes.voucherMenuName) &
          userSettingsTable.userId.equals(userId) &
          userSettingsTable.active.equals(1) &
          userSettingsTable.value.equals('Yes'),
    ),
  ])
    ..where(voucherTypes.companyId.equals(companyId))
    ..where(voucherTypes.isEnabled.equals(1))
    ..orderBy([
      OrderingTerm.asc(voucherTypes.orderNo),
    ]);

  return query.watch().map(
        (rows) => rows.map((row) => row.readTable(voucherTypes)).toList(),
      );
}



}
