import 'package:drift/drift.dart';

class SaleOrderDetailsTable extends Table {
  // Local primary key
  IntColumn get id => integer().autoIncrement()();

  // Master reference
  IntColumn get mid => integer().nullable()();

  IntColumn get itemId => integer().nullable()();
  TextColumn get itemName => text().nullable()();

  RealColumn get qty => real().nullable()();
  TextColumn get unit => text().nullable()();

  RealColumn get rate => real().nullable()();
  RealColumn get vat => real().nullable()();
  RealColumn get vatAmt => real().nullable()();

  RealColumn get total => real().nullable()();

  RealColumn get disc => real().nullable()();
  RealColumn get discVal => real().nullable()();

  TextColumn get ledger => text().nullable()();

  IntColumn get companyId => integer().nullable()();

  IntColumn get sync => integer().withDefault(const Constant(0))();

  RealColumn get igst => real().nullable()();
  RealColumn get cgst => real().nullable()();
  RealColumn get sgst => real().nullable()();
  RealColumn get cess => real().nullable()();

  TextColumn get hsn => text().nullable()();

  RealColumn get enteredRate => real().nullable()();
  RealColumn get enteredDisc => real().nullable()();

  TextColumn get eneteredQty => text().nullable()();
  TextColumn get enteredFQty => text().nullable()();

  RealColumn get fQty => real().nullable()();

  RealColumn get addDiscVal => real().nullable()();
  RealColumn get cessAmt => real().nullable()();

  TextColumn get stkNegPermission => text().nullable()();
  TextColumn get discType => text().nullable()();

  TextColumn get priceList => text().nullable()();

  RealColumn get convQty => real().nullable()();
  RealColumn get fConvQty => real().nullable()();

  TextColumn get qtyString => text().nullable()();
  TextColumn get fQtyString => text().nullable()();

  TextColumn get fUnit => text().nullable()();

  RealColumn get aConvQty => real().nullable()();
  RealColumn get aFConvQty => real().nullable()();

  TextColumn get rateUnit => text().nullable()();
}
