import 'package:drift/drift.dart';

class PartyMaster extends Table {
  // Primary Key
  IntColumn get ledgerId => integer()();

  IntColumn get companyId => integer()();

  // Basic info
  TextColumn get ledgerName => text().nullable()();
  TextColumn get ledgerNameLocal => text().nullable()();
  TextColumn get aliasName => text().nullable()();
  TextColumn get ledDesc => text().nullable()();

  // Group
  IntColumn get groupId => integer().nullable()();
  TextColumn get groupName => text().nullable()();

  // Status
  BoolColumn get isActive => boolean().withDefault(const Constant(false))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  // Credit & due
  RealColumn get creditLimit => real().nullable()();
  IntColumn get dueDays => integer().nullable()();

  // Address
  TextColumn get address1 => text().nullable()();
  TextColumn get address2 => text().nullable()();
  TextColumn get address3 => text().nullable()();
  TextColumn get city => text().nullable()();

  // Location
  IntColumn get stateId => integer().nullable()();
  TextColumn get stateName => text().nullable()();
  IntColumn get countryId => integer().nullable()();
  TextColumn get countryName => text().nullable()();
  TextColumn get pinCode => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  RealColumn get distanceFromCompanyKM => real().nullable()();

  // Contact
  TextColumn get mailingName => text().nullable()();
  TextColumn get contactPerson => text().nullable()();
  TextColumn get mobile => text().nullable()();
  TextColumn get whatsappNo => text().nullable()();
  TextColumn get email => text().nullable()();

  // Tax
  TextColumn get taxType => text().nullable()();
  TextColumn get taxNumber => text().nullable()();
  TextColumn get stateCode => text().nullable()();

  // Balance
  RealColumn get closingBalance => real().nullable()();
  RealColumn get onAccountValue => real().nullable()();

  // Route
  IntColumn get routeId => integer().nullable()();
  TextColumn get routeName => text().nullable()();
  
  //Price list
  IntColumn get priceList => integer().nullable()();

  // Sync
  DateTimeColumn get lastSyncOn => dateTime().nullable()();
  TextColumn get syncAction => text().nullable()();

  @override
  Set<Column> get primaryKey => {ledgerId};
}
