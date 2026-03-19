import 'package:drift/drift.dart';

class SaleReturnDetailsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get vchId => integer()();
  IntColumn get lineNo => integer().nullable()();

  IntColumn get itemId => integer().nullable()();
  TextColumn get itemName => text().nullable()();
  TextColumn get itemDesc => text().nullable()();

  RealColumn get stkQtyFirst => real().withDefault(const Constant(0))();
  RealColumn get stkQtySecond => real().withDefault(const Constant(0))();

  RealColumn get enteredQtyFirst => real().withDefault(const Constant(0))();
  RealColumn get enteredQtySecond => real().withDefault(const Constant(0))();

  RealColumn get enteredActualQtyFirst =>
      real().withDefault(const Constant(0))();
  RealColumn get enteredActualQtySecond =>
      real().withDefault(const Constant(0))();

  TextColumn get enteredUnit => text().nullable()();

  RealColumn get qtyFirst => real().withDefault(const Constant(0))();
  RealColumn get qtySecond => real().withDefault(const Constant(0))();

  RealColumn get qtyActualFirst => real().withDefault(const Constant(0))();
  RealColumn get qtyActualSecond => real().withDefault(const Constant(0))();

  RealColumn get altQtyFirst => real().withDefault(const Constant(0))();
  RealColumn get altQtySecond => real().withDefault(const Constant(0))();

  RealColumn get altQtyActualFirst => real().withDefault(const Constant(0))();
  RealColumn get altQtyActualSecond => real().withDefault(const Constant(0))();

  TextColumn get qtyStr => text().nullable()();
  TextColumn get actualQtyStr => text().nullable()();

  RealColumn get qty1 => real().withDefault(const Constant(0))();
  RealColumn get qty2 => real().withDefault(const Constant(0))();
  RealColumn get qty3 => real().withDefault(const Constant(0))();

  RealColumn get rate => real().withDefault(const Constant(0))();
  TextColumn get rateUnit => text().nullable()();

  RealColumn get taxPerc => real().withDefault(const Constant(0))();
  RealColumn get cessPer => real().withDefault(const Constant(0))();
  RealColumn get addCessPer => real().withDefault(const Constant(0))();

  RealColumn get igstVal => real().withDefault(const Constant(0))();
  RealColumn get cgstVal => real().withDefault(const Constant(0))();
  RealColumn get sgstVal => real().withDefault(const Constant(0))();

  RealColumn get cessVal => real().withDefault(const Constant(0))();
  RealColumn get addCessVal => real().withDefault(const Constant(0))();
  RealColumn get otherVal => real().withDefault(const Constant(0))();

  RealColumn get discountPer => real().withDefault(const Constant(0))();
  RealColumn get discountAmt => real().withDefault(const Constant(0))();

  RealColumn get taxableAmount => real().withDefault(const Constant(0))();
  RealColumn get amount => real().withDefault(const Constant(0))();

  RealColumn get rateInc => real().withDefault(const Constant(0))();
  RealColumn get amountInc => real().withDefault(const Constant(0))();
}
// class SaleReturnDetailsTable extends Table {
//   // Local primary key
//   IntColumn get id => integer().autoIncrement()();

//   // Master reference
//   IntColumn get mid => integer().nullable()();

//   IntColumn get itemId => integer().nullable()();
//   TextColumn get itemName => text().nullable()();

//   RealColumn get qty => real().nullable()();
//   TextColumn get unit => text().nullable()();

//   RealColumn get rate => real().nullable()();
//   RealColumn get vat => real().nullable()();
//   RealColumn get vatAmt => real().nullable()();

//   RealColumn get total => real().nullable()();

//   RealColumn get disc => real().nullable()();
//   RealColumn get discVal => real().nullable()();

//   TextColumn get ledger => text().nullable()();

//   IntColumn get companyId => integer().nullable()();

//   IntColumn get sync => integer().withDefault(const Constant(0))();

//   TextColumn get hsn => text().nullable()();

//   RealColumn get enteredRate => real().nullable()();
//   RealColumn get enteredDisc => real().nullable()();

//   TextColumn get eneteredQty => text().nullable()();
//   TextColumn get enteredFQty => text().nullable()();

//   RealColumn get fQty => real().nullable()();

//   RealColumn get addDiscVal => real().nullable()();
//   RealColumn get cessAmt => real().nullable()();

//   TextColumn get stkNegPermission => text().nullable()();
//   TextColumn get discType => text().nullable()();

//   TextColumn get priceList => text().nullable()();

//   RealColumn get convQty => real().nullable()();
//   RealColumn get fConvQty => real().nullable()();

//   TextColumn get qtyString => text().nullable()();
//   TextColumn get fQtyString => text().nullable()();

//   TextColumn get fUnit => text().nullable()();

//   RealColumn get aConvQty => real().nullable()();
//   RealColumn get aFConvQty => real().nullable()();

//   TextColumn get rateUnit => text().nullable()();
// }
