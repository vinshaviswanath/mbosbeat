import 'package:drift/drift.dart';


class ItemPriceDetailsTables extends Table {
  IntColumn get id => integer()(); // PRIMARY KEY

  DateTimeColumn get applicableDate => dateTime().nullable()();

  IntColumn get itemId => integer().nullable()();

  IntColumn get companyId => integer().nullable()();

  IntColumn get priceList => integer().nullable()();

  RealColumn get rate => real().nullable()();

  RealColumn get discount => real().nullable()();

  TextColumn get discountType => text().nullable()();

  RealColumn get fromQty => real().nullable()();

  RealColumn get toQty => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
