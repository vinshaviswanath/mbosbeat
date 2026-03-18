import 'package:drift/drift.dart';

class ReceiptMasterTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get mid => integer().nullable()();
  IntColumn get companyId => integer().nullable()();

  IntColumn get receiptNo => integer().nullable()();
  RealColumn get amount => real().nullable()();

  TextColumn get paymentMode => text().nullable()();
  IntColumn get chequeNo => integer().nullable()();
  TextColumn get chequeDate => text().nullable()();
  TextColumn get bankname => text().nullable()();
  TextColumn get branchname => text().nullable()();
  TextColumn get narration => text().nullable()();
  IntColumn get advance => integer().nullable()();
}
