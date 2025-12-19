import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:mpos_beat/core/utils/logger.dart';
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
}
