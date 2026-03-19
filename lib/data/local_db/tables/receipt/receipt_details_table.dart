import 'package:drift/drift.dart';

class ReceiptDetailsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get vchId => integer()(); // link to ReceiptMaster

  TextColumn get androidId => text().nullable()();

  TextColumn get billName => text().nullable()();

  DateTimeColumn get billDate => dateTime().nullable()();

  RealColumn get billAmount => real().withDefault(const Constant(0))();
  RealColumn get balanceAmt => real().withDefault(const Constant(0))();
  RealColumn get paidAmount => real().withDefault(const Constant(0))();
}
// class ReceiptDetailsTable extends Table {
//   IntColumn get id => integer().autoIncrement()();

//   IntColumn get mid => integer().nullable()();
//   IntColumn get companyId => integer().nullable()();

//   TextColumn get ledger => text().nullable()();

//   RealColumn get balance => real().nullable()();
//   TextColumn get receiptdate => text().nullable()();
// }
