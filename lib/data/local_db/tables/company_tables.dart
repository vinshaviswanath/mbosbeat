import 'package:drift/drift.dart';

class Companies extends Table {
  IntColumn get id => integer().nullable()();
  TextColumn get companyName => text().nullable()();
  TextColumn get mailingName => text().nullable()();
  TextColumn get localName => text().nullable()();
  TextColumn get companyCode => text().nullable()();
  TextColumn get address1 => text().nullable()();
  TextColumn get address2 => text().nullable()();
  TextColumn get address3 => text().nullable()();
  TextColumn get pinCode => text().nullable()();
  TextColumn get country => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get officeNo => text().nullable()();
  TextColumn get mobile => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get regType => text().nullable()();
  TextColumn get fssaiNo => text().nullable()();
  DateTimeColumn get finYearStart => dateTime().nullable()();
  TextColumn get voucherRepeat => text().nullable()();
  DateTimeColumn get lastSyncDate => dateTime().nullable()();
  IntColumn get createBy => integer().nullable()();
  DateTimeColumn get createdOn => dateTime().nullable()();
  TextColumn get createdFrom => text().nullable()();
  TextColumn get bankName => text().nullable()();
  TextColumn get bankBranch => text().nullable()();
  TextColumn get accNo => text().nullable()();
  TextColumn get ifscCode => text().nullable()();
  TextColumn get gPayNumber => text().nullable()();
  TextColumn get upiAddress => text().nullable()();
  TextColumn get payeeName => text().nullable()();
  TextColumn get currency => text().nullable()();
  IntColumn get hasIntegrationSettings => integer().nullable()();
  IntColumn get hasVoucherTypeSettings => integer().nullable()();
  IntColumn get hasCompanySettings => integer().nullable()();
  TextColumn get userList => text().nullable()();
  TextColumn get integrationType => text().nullable()();
  TextColumn get serialNumber => text().nullable()();
  TextColumn get stockInCloud => text().nullable()();
  TextColumn get registrationNo => text().nullable()();
  TextColumn get vchNumberingMode => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
