import 'package:drift/drift.dart';

class RouteVoucherTypes extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get companyId => integer().nullable()();
  IntColumn get voucherTypeId => integer().nullable()();
  TextColumn get voucherMenuName => text().nullable()();
  TextColumn get voucherMode => text().nullable()();
  IntColumn get voucherModeId => integer().nullable()();
  TextColumn get voucherModeName => text().nullable()();

  DateTimeColumn get applicableFrom => dateTime().nullable()();

  IntColumn get hasB2B => integer().nullable()();

  TextColumn get b2BPrefix => text().nullable()();
  TextColumn get b2BSuffix => text().nullable()();
  IntColumn get b2BWidth => integer().nullable()();
  IntColumn get b2BStartFrom => integer().nullable()();

  TextColumn get b2CPrefix => text().nullable()();
  TextColumn get b2CSuffix => text().nullable()();
  IntColumn get b2CWidth => integer().nullable()();
  IntColumn get b2CStartFrom => integer().nullable()();

  TextColumn get b2BDeclaration => text().nullable()();
  TextColumn get b2CDeclaration => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
