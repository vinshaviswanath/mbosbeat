import 'package:drift/drift.dart';

class Users extends Table {
  // PRIMARY KEY
  IntColumn get userId => integer()();

  // Columns
  IntColumn get customerId => integer().nullable()();
  TextColumn get fullName => text().nullable()();
  TextColumn get mobile => text().nullable()();
  TextColumn get whatsappNo => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get designation => text().nullable()();
  TextColumn get username => text().nullable()();
  IntColumn get userActive => integer().nullable()();
  TextColumn get companyName => text().nullable()();
  TextColumn get address => text().nullable()();
  IntColumn get countryId => integer().nullable()();
  IntColumn get stateId => integer().nullable()();
  TextColumn get activationType => text().nullable()();
  DateTimeColumn get expiryDate => dateTime().nullable()();
  IntColumn get custActive => integer().nullable()();
  TextColumn get token => text().nullable()();
  TextColumn get dbName => text().nullable()();

  @override
  Set<Column> get primaryKey => {userId};
}

