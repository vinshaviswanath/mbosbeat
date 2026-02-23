import 'package:drift/drift.dart';

class VoucherControlTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get companyId => integer()();

  /// SO / SI / PI etc
  TextColumn get vchType => text()();

  /// Prefix like SO/24-25
  TextColumn get prefix => text().nullable()();

  /// Financial year
  IntColumn get finId => integer().nullable()();

  /// Last issued number
  IntColumn get lastNo => integer().withDefault(const Constant(0))();

  TextColumn get createdTime => text().nullable()();
}