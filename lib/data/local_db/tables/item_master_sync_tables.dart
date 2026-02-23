import 'package:drift/drift.dart';

class ItemMaster extends Table {
  /// Local auto-increment primary key
  IntColumn get id => integer().autoIncrement()();

  IntColumn get companyId => integer()();

  /// Server ID
  IntColumn get stockItemId => integer()();

  TextColumn get itemName => text()();
  TextColumn get aliasName => text().withDefault(const Constant(''))();
  TextColumn get partNumber => text().withDefault(const Constant(''))();
  TextColumn get itemNameLcl => text().nullable()();

  TextColumn get groupName => text().nullable()();
  TextColumn get categoryName => text().nullable()();

  TextColumn get unitName => text()();
  IntColumn get decimalPlaces => integer()();

  TextColumn get altUnit => text().nullable()();
  RealColumn get altDecimalPlaces => real().nullable()();

  RealColumn get unitConversion => real().withDefault(const Constant(1))();
  RealColumn get unitDenominator => real().withDefault(const Constant(1))();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  TextColumn get hsnCode => text().nullable()();
  RealColumn get taxPercent => real().nullable()();

  IntColumn get closingStock => integer().nullable()();
  IntColumn get cess => integer().nullable()();
  IntColumn get cost => integer().nullable()();

  /// Avoid duplicate server data
  @override
  List<Set<Column>> get uniqueKeys => [
    {companyId, stockItemId},
  ];
}
