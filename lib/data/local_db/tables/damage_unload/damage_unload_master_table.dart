import 'package:drift/drift.dart';

class DamageUnloadMasterTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get custId => integer().nullable()();
  IntColumn get companyId => integer().nullable()();

  IntColumn get tripId => integer().nullable()();
  IntColumn get checkInId => integer().nullable()();

  IntColumn get fromGodown => integer().nullable()();
  IntColumn get toGodown => integer().nullable()();

  IntColumn get userId => integer().nullable()();
  IntColumn get androidId => integer().nullable()();

  IntColumn get vchSeriesId => integer().nullable()();
  IntColumn get vchNo => integer().nullable()();

  TextColumn get vchNumber => text().nullable()();

  DateTimeColumn get vchDate => dateTime().nullable()();

  TextColumn get referenceNo => text().nullable()();

  DateTimeColumn get referenceDate => dateTime().nullable()();

  TextColumn get narration => text().nullable()();

  IntColumn get itemCount => integer().nullable()();

  IntColumn get status => integer().nullable()();

  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  RealColumn get accuracy => real().nullable()();

  TextColumn get mobileCreatedOn => text().nullable()();
  TextColumn get createdOn => text().nullable()();

  IntColumn get importStatus => integer().nullable()();

  IntColumn get sync => integer().withDefault(const Constant(0))();
}
