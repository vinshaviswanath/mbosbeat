import 'package:drift/drift.dart';

class PurchaseLedgerDetailsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get vchId => integer().nullable()();

  IntColumn get ledgerId => integer().nullable()();
  TextColumn get ledgerName => text().nullable()();

  RealColumn get rate => real().nullable()();
  RealColumn get amount => real().nullable()();
}