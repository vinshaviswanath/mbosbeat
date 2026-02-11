import 'package:drift/drift.dart';

class SaleOrderLedgerDetailsTable extends Table {
  // Local primary key
  IntColumn get id => integer().autoIncrement()();

  // Master reference
  IntColumn get mid => integer().nullable()();

  IntColumn get vchId => integer().nullable()();
IntColumn get sync => integer().withDefault(const Constant(0))();

  TextColumn get ledger => text().nullable()();

  RealColumn get rate => real().nullable()();
  RealColumn get amount => real().nullable()();

  IntColumn get companyId => integer().nullable()();
}
