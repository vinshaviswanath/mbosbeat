import 'package:drift/drift.dart';

class SaleReturnMasterTable extends Table {
  // Auto increment & nullable by default in Drift
  IntColumn get id => integer().autoIncrement()();

  IntColumn get vchId => integer().nullable()();
  TextColumn get voucherNo => text().nullable()();

  IntColumn get partyId => integer().nullable()();
  TextColumn get party => text().nullable()();

  TextColumn get address => text().nullable()();
  TextColumn get address2 => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get mob => text().nullable()();

  TextColumn get voucherDate => text().nullable()();

  RealColumn get voucherAmount => real()();

  IntColumn get status => integer().nullable()();

  TextColumn get priceList => text().nullable()();
  TextColumn get narration => text().nullable()();

  RealColumn get lattitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  RealColumn get accuracy => real().nullable()();

  IntColumn get userId => integer().nullable()();
  IntColumn get companyId => integer().nullable()();

  IntColumn get itemCount => integer().nullable()();

  TextColumn get gstin => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get partyParent => text().nullable()();

  TextColumn get addDiscType => text().nullable()();
  RealColumn get addDiscEntered => real().nullable()();

  TextColumn get prefix => text().nullable()();
  TextColumn get suffix => text().nullable()();
  TextColumn get voucherNumber => text().nullable()();

  TextColumn get vchType => text().nullable()();
  IntColumn get invNo => integer().nullable()();

  TextColumn get godown => text().nullable()();

  IntColumn get tripId => integer().nullable()();
  IntColumn get visitId => integer().nullable()();

  IntColumn get stockStatus => integer().nullable()();
  IntColumn get finId => integer().nullable()();

  TextColumn get createdTime => text().nullable()();
  TextColumn get updatedTime => text().nullable()();
  TextColumn get deliveryDate => text().nullable()();

  IntColumn get printCount => integer().nullable()();
  IntColumn get sync => integer().withDefault(const Constant(0))();

  TextColumn get pinCode => text().nullable()();

  IntColumn get uploadedServerId => integer().nullable()();

  TextColumn get mailingName => text().nullable()();
}
