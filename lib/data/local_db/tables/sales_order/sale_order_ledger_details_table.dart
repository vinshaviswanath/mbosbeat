import 'package:drift/drift.dart';

class SaleOrderLedgerDetailsTable extends Table {
  // Local primary key
  IntColumn get id => integer().autoIncrement()();

  // Master reference
  IntColumn get mid => integer().nullable()();

  IntColumn get vchId => integer().nullable()();

  TextColumn get ledger => text().nullable()();

  RealColumn get rate => real().nullable()();
  RealColumn get amount => real().nullable()();

  IntColumn get companyId => integer().nullable()();
}
