import 'package:drift/drift.dart';

class SaleAutoReceiptTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get mid => integer().nullable()();
  IntColumn get companyId => integer().nullable()();

  TextColumn get paymentMode => text().nullable()();
  RealColumn get amount => real().nullable()();

  TextColumn get upiReference => text().nullable()();

  TextColumn get chequeNumber => text().nullable()();
  TextColumn get chequeDate => text().nullable()();

  IntColumn get sync => integer().withDefault(const Constant(0))();
}
