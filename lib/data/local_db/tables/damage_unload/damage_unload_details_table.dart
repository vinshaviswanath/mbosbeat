import 'package:drift/drift.dart';

class DamageUnloadDetailsTable extends Table {
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

  TextColumn get enteredUnit => text().nullable()();

  RealColumn get qtyFirst => real().withDefault(const Constant(0))();
  RealColumn get qtySecond => real().withDefault(const Constant(0))();

  RealColumn get altQtyFirst => real().withDefault(const Constant(0))();
  RealColumn get altQtySecond => real().withDefault(const Constant(0))();

  TextColumn get qtyStr => text().nullable()();

  RealColumn get qty1 => real().withDefault(const Constant(0))();
  RealColumn get qty2 => real().withDefault(const Constant(0))();
  RealColumn get qty3 => real().withDefault(const Constant(0))();
}