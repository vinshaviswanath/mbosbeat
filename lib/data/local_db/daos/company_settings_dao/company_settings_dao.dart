import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/company_settings_tables.dart';

part 'company_settings_dao.g.dart';

@DriftAccessor(tables: [CompanySettingsTable])
class CompanySettingsDao extends DatabaseAccessor<AppDb>
    with _$CompanySettingsDaoMixin {
  CompanySettingsDao(super.db);

  /// Insert or update single row
  Future<void> insertOne(CompanySettingsTableCompanion data) async {
    await into(companySettingsTable).insertOnConflictUpdate(data);
  }

  /// Bulk insert or update
  Future<void> insertAll(List<CompanySettingsTableCompanion> list) async {
    if (list.isEmpty) return;

    await batch((batch) {
      batch.insertAllOnConflictUpdate(companySettingsTable, list);
    });
  }

  Future<List<CompanySettingsTableData>> getAll() {
    return select(companySettingsTable).get();
  }

  Stream<List<CompanySettingsTableData>> watchAll() {
    return select(companySettingsTable).watch();
  }

  Future<List<CompanySettingsTableData>> getByCompany(int companyId) {
    return (select(companySettingsTable)
          ..where((tbl) => tbl.companyId.equals(companyId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.orderNo)]))
        .get();
  }

  /// Stream settings by company
  Stream<List<CompanySettingsTableData>> watchByCompany(int companyId) {
    return (select(companySettingsTable)
          ..where((tbl) => tbl.companyId.equals(companyId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.orderNo)]))
        .watch();
  }

  Stream<CompanySettingsTableData?> watchRouteSetting(int companyId) {
    return (select(companySettingsTable)
          ..where((tbl) => tbl.companyId.equals(companyId) & tbl.id.equals(5)))
        .watchSingleOrNull();
  }

  Stream<CompanySettingsTableData?> watchcheckInOutSetting(int companyId) {
    return (select(companySettingsTable)
          ..where((tbl) => tbl.companyId.equals(companyId) & tbl.id.equals(15)))
        .watchSingleOrNull();
  }

  /// Get child settings (for nested menus)
  Future<List<CompanySettingsTableData>> getByParent(
    int companyId,
    int parentId,
  ) {
    return (select(companySettingsTable)
          ..where(
            (tbl) =>
                tbl.companyId.equals(companyId) & tbl.parentId.equals(parentId),
          )
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.orderNo)]))
        .get();
  }

  /* ───────────────────────── UPDATE ───────────────────────── */

  // /// Update settings value only
  // Future<bool> updateSettingsValue({
  //   required int id,
  //   required int companyId,
  //   required String settingsValue,
  // }) {
  //   return (update(companySettingsTable)
  //         ..where((tbl) =>
  //             tbl.id.equals(id) & tbl.companyId.equals(companyId)))
  //       .write(
  //         CompanySettingsTableCompanion(
  //           settingsValue: Value(settingsValue),
  //         ),
  //       );
  // }

  /// Full update using companion
  Future<bool> updateOne(CompanySettingsTableCompanion data) {
    return update(companySettingsTable).replace(data);
  }

  /* ───────────────────────── DELETE ───────────────────────── */

  /// Delete one row
  Future<int> deleteOne({required int id, required int companyId}) {
    return (delete(companySettingsTable)
          ..where((tbl) => tbl.id.equals(id) & tbl.companyId.equals(companyId)))
        .go();
  }

  /// Delete by company
  Future<int> deleteByCompany(int companyId) {
    return (delete(
      companySettingsTable,
    )..where((tbl) => tbl.companyId.equals(companyId))).go();
  }

  Future<int> deleteAll() {
    return delete(companySettingsTable).go();
  }

  /* ───────────────────────── DEBUG ───────────────────────── */

  /// Print all rows to console
  Future<void> printAll() async {
    final list = await getAll();

    if (list.isEmpty) {
      debugPrint('CompanySettingsTable is empty');
      return;
    }

    for (final row in list) {
      debugPrint(
        'Company Setting →\n'
        'ID: ${row.id}\n'
        'CompanyID: ${row.companyId}\n'
        'MenuName: ${row.settingsMenuName}\n'
        'ButtonType: ${row.buttonType}\n'
        'Description: ${row.description}\n'
        'ParentID: ${row.parentId}\n'
        'OrderNo: ${row.orderNo}\n'
        'MenuType: ${row.menuType}\n'
        'SettingsValue: ${row.settingsValue}\n'
        '-------------------------------',
      );
    }
  }

  Future<bool> isItemwiseDiscountEnabled(int companyId) async {
    final result =
        await (select(companySettingsTable)
              ..where(
                (tbl) =>
                    tbl.companyId.equals(companyId) &
                    // tbl.settingsMenuName.equals("Itemwise Discount %"))
                    tbl.id.equals(8),
              )
              ..limit(1))
            .getSingleOrNull();

    return result?.settingsValue.toLowerCase() == "true";
  }

  Stream<bool> watchItemwiseDiscountEnabled(int companyId) {
    return (select(companySettingsTable)
          ..where((tbl) => tbl.companyId.equals(companyId) & tbl.id.equals(8))
          ..limit(1))
        .watchSingleOrNull()
        .map((row) => row?.settingsValue.toLowerCase() == "yes");
  }

  Future<bool> isFreeQuantityEnabled(int companyId) async {
    final result =
        await (select(companySettingsTable)
              ..where(
                (tbl) =>
                    tbl.companyId.equals(companyId) &
                    // tbl.settingsMenuName.equals("Itemwise Discount %"))
                    tbl.id.equals(1),
              )
              ..limit(1))
            .getSingleOrNull();

    return result?.settingsValue.toLowerCase() == "yes";
  }

  Stream<bool> watchFreeQuantitytEnabled({required int companyId}) {
    return (select(companySettingsTable)
          ..where(
            (tbl) =>
                tbl.companyId.equals(companyId) &
                // tbl.settingsMenuName.equals("Itemwise Discount %"))
                tbl.id.equals(1),
          )
          ..limit(1))
        .watchSingleOrNull()
        .map((row) => row?.settingsValue.toLowerCase() == "yes");
  }
}
