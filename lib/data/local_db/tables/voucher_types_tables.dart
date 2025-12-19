import 'package:drift/drift.dart';

class VoucherTypes extends Table {
  IntColumn get id => integer()();
  IntColumn get companyId => integer()();
  TextColumn get voucherMenuName => text()();
  TextColumn get description => text()();
  TextColumn get hasB2BB2C => text()();
  TextColumn get requireDeclaration => text()();
  IntColumn get orderNo => integer()();
  IntColumn get hasB2B => integer()();
  TextColumn get b2BPrefix => text()();
  TextColumn get b2BSuffix => text()();
  IntColumn get b2BWidth => integer()();
  IntColumn get b2BStartFrom => integer()();
  TextColumn get b2CPrefix => text()();
  TextColumn get b2CSuffix => text()();
  IntColumn get b2CWidth => integer()();
  IntColumn get b2CStartFrom => integer()();
  TextColumn get b2BDeclaration => text()();
  TextColumn get b2CDeclaration => text()();
  IntColumn get isEnabled => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
