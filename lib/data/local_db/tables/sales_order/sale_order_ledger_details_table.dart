import 'package:drift/drift.dart';

class SaleOrderLedgerDetailsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get vchId => integer().nullable()();

  IntColumn get ledgerId => integer().nullable()();
  TextColumn get ledgerName => text().nullable()();

  RealColumn get rate => real().nullable()();
  RealColumn get amount => real().nullable()();
}
// class SaleOrderLedgerDetailsTable extends Table {
//   // Local primary key
//   IntColumn get id => integer().autoIncrement()();

//   // Master reference
//   IntColumn get mid => integer().nullable()();

//   IntColumn get vchId => integer().nullable()();
//   IntColumn get sync => integer().withDefault(const Constant(0))();

//   RealColumn get rate => real().nullable()();
//   RealColumn get amount => real().nullable()();

//   IntColumn get companyId => integer().nullable()();

//   TextColumn get voucherName => text().nullable()();
// }
