import 'package:drift/drift.dart';

class PriceLevelsTable extends Table {
  IntColumn get id => integer()();

  IntColumn get companyId => integer().nullable()();

  TextColumn get priceLevel => text().nullable()();

  BoolColumn get rateInclusive =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isDefault => boolean().withDefault(const Constant(false))();

  BoolColumn get active => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}
