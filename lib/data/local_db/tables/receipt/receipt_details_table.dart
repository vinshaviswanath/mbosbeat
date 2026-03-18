import 'package:drift/drift.dart';

class ReceiptEntryLedgerTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get mid => integer().nullable()();
  IntColumn get companyId => integer().nullable()();

  TextColumn get ledger => text().nullable()();

  RealColumn get balance => real().nullable()();
  TextColumn get receiptdate => text().nullable()();
}
