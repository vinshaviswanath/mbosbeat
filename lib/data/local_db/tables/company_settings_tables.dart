import 'package:drift/drift.dart';

class CompanySettingsTable extends Table {
  // API ID
  IntColumn get id => integer()();

  IntColumn get companyId => integer()();

  TextColumn get settingsMenuName => text()();

  /// Stored as TEXT → "Toggle"
  TextColumn get buttonType => text()();

  TextColumn get description => text()();

  IntColumn get parentId => integer()();

  IntColumn get orderNo => integer()();

  /// Stored as TEXT → "Free"
  TextColumn get menuType => text()();

  /// Stored as TEXT → "", "Yes"
  TextColumn get settingsValue => text()();

  /// Prevent duplicate settings per company
  @override
  Set<Column> get primaryKey => {id, companyId};
}
