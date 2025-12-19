import 'package:drift/drift.dart';

class UserSettingsTable extends Table {
  IntColumn get id => integer().nullable()();
  IntColumn get userId => integer().nullable().named('user_id')();
  TextColumn get menuName => text().nullable().named('menu_name')();
  TextColumn get buttonType => text().nullable().named('button_type')();
  TextColumn get description => text().nullable()();
  IntColumn get orderNo => integer().nullable().named('order_no')();
  IntColumn get active => integer().nullable()();
  TextColumn get value => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
