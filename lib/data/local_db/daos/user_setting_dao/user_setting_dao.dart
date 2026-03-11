import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/user_settings_tables.dart';

part 'user_setting_dao.g.dart';

@DriftAccessor(tables: [UserSettingsTable])
class UserSettingsDao extends DatabaseAccessor<AppDb>
    with _$UserSettingsDaoMixin {
  UserSettingsDao(super.db);

  Future<void> insertSettings(List<UserSettingsTableCompanion> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(userSettingsTable, list);
    });
  }

  Future<List<UserSettingsTableData>> getSettings(int userId) async {
    return (select(
      userSettingsTable,
    )..where((tbl) => tbl.userId.equals(userId))).get();
  }

    Stream<List<UserSettingsTableData>> watchSettings(int userId){
    return (select(
      userSettingsTable,
    )..where((tbl) => tbl.userId.equals(userId))).watch();
  }

  Future<void> printAllSettings() async {
    final list = await select(userSettingsTable).get();

    if (list.isEmpty) {
      debugPrint("UserSettingsTable is empty");
      return;
    }

    for (final row in list) {
      debugPrint(
        "User Setting → \n"
        "ID: ${row.id}, \n"
        "UserID: ${row.userId}, \n"
        "MenuName: ${row.menuName}, \n"
        "ButtonType: ${row.buttonType}, \n"
        "Description: ${row.description}, \n"
        "OrderNo: ${row.orderNo}, \n"
        "Active: ${row.active}, \n"
        "Value: ${row.value} \n"
        "\n"
        "<<<<==============================>>>> \n",
      );
    }
  }

  Future<void> clearAll() => delete(userSettingsTable).go();

  Future<String?> getCompanySwitchingValue(int userId) async {
  final query = select(userSettingsTable)
    ..where((tbl) => tbl.userId.equals(userId) & tbl.id.equals(6))
    ..limit(1);

  final result = await query.getSingleOrNull();
  return result?.value;
}

Future<bool> isEditDiscountEnabled(int userId) async {
  final result = await (select(userSettingsTable)
        ..where((tbl) =>
            tbl.userId.equals(userId) &
            tbl.menuName.equals("Edit Discount"))
        ..limit(1))
      .getSingleOrNull();

  return result?.value?.toLowerCase() == "true";
}

Stream<bool> watchEditDiscountEnabled(int userId) {
  return (select(userSettingsTable)
        ..where((tbl) =>
            tbl.userId.equals(userId) &
            tbl.menuName.equals("Edit Discount"))
        ..limit(1))
      .watchSingleOrNull()
      .map((row) => row?.value?.toLowerCase() == "yes");
}

}
