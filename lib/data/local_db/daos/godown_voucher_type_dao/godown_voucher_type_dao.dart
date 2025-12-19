import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/godown_voucher_types_tables.dart';

part 'godown_voucher_type_dao.g.dart';

@DriftAccessor(tables: [GodownVoucherTypes])
class GodownVoucherTypesDao extends DatabaseAccessor<AppDb>
    with _$GodownVoucherTypesDaoMixin {
  GodownVoucherTypesDao(super.db);

  // Insert or update single row
  Future<void> insertOne(GodownVoucherTypesCompanion voucher) async {
    await into(godownVoucherTypes).insertOnConflictUpdate(voucher);
  }

  // ✅ Correct bulk insert
  Future<void> insertAll(List<GodownVoucherTypesCompanion> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(godownVoucherTypes, list);
    });
  }

  Future<List<GodownVoucherType>> getAllGodownVoucherTypes() {
    return select(godownVoucherTypes).get();
  }

  Stream<List<GodownVoucherType>> watchAll() {
    return select(godownVoucherTypes).watch();
  }

  Future<int> deleteAll() {
    return delete(godownVoucherTypes).go();
  }

  Future<void> printAllGodownVoucherTypes() async {
    final list = await select(godownVoucherTypes).get();

    if (list.isEmpty) {
      debugPrint("GodownVoucherTypes table is empty");
      return;
    }

    for (final row in list) {
      debugPrint(
        "Godown Voucher Type → \n"
        "ID: ${row.id}, \n"
        "CompanyID: ${row.companyId}, \n"
        "VoucherTypeID: ${row.voucherTypeId}, \n"
        "VoucherMenuName: ${row.voucherMenuName}, \n"
        "VoucherMode: ${row.voucherMode}, \n"
        "VoucherModeID: ${row.voucherModeId}, \n"
        "VoucherModeName: ${row.voucherModeName}, \n"
        "ApplicableFrom: ${row.applicableFrom}, \n"
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
        "\n"
        "<<<<==============================>>>> \n",
      );
    }
  }
}
