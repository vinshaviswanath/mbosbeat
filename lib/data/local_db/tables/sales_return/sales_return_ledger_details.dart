import 'package:drift/drift.dart';

class SaleReturnLedgerDetailsTable extends Table {
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
TextColumn get voucherName => text().nullable()();
  
  RealColumn get igst => real().nullable()();
  RealColumn get cgst => real().nullable()();
  RealColumn get sgst => real().nullable()();
  RealColumn get cess => real().nullable()();
}
