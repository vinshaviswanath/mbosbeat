import 'package:drift/drift.dart';

class ReceiptMasterTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get custId => integer().nullable()();
  IntColumn get companyId => integer().nullable()();

  IntColumn get tripId => integer().nullable()();
  IntColumn get visitId => integer().nullable()();

  IntColumn get userId => integer().nullable()();

  IntColumn get vchSeries => integer().nullable()();
  TextColumn get vchNo => text().nullable()(); 
  TextColumn get vchNumber => text().nullable()(); 

TextColumn get vchdate => text().nullable()();

  IntColumn get partyId => integer().nullable()();
  TextColumn get partyName => text().nullable()();

  RealColumn get amount => real().withDefault(const Constant(0))();
  RealColumn get discount => real().withDefault(const Constant(0))();
  RealColumn get receivedAmt => real().withDefault(const Constant(0))();
  RealColumn get advance => real().withDefault(const Constant(0))();

  TextColumn get recMode => text().nullable()(); // CASH / UPI / BANK

  IntColumn get accountId => integer().nullable()();
  TextColumn get accountName => text().nullable()();

  TextColumn get chequeNo => text().nullable()();
   TextColumn get chequeDate => text().nullable()();

  TextColumn get bankName => text().nullable()();
  TextColumn get branchName => text().nullable()();

  TextColumn get refNo => text().nullable()();
  TextColumn get narration => text().nullable()();

  RealColumn get latitude => real().withDefault(const Constant(0))();
  RealColumn get longitude => real().withDefault(const Constant(0))();
  RealColumn get accuracy => real().withDefault(const Constant(0))();

  TextColumn get createdOn => text().nullable()();
  TextColumn get updatedOn => text().nullable()();

  IntColumn get status => integer().nullable()();
}
// class ReceiptMasterTable extends Table {
//   IntColumn get id => integer().autoIncrement()();

//   IntColumn get mid => integer().nullable()();
//   IntColumn get companyId => integer().nullable()();

//   IntColumn get receiptNo => integer().nullable()();
//   RealColumn get amount => real().nullable()();

//   TextColumn get paymentMode => text().nullable()();
//   IntColumn get chequeNo => integer().nullable()();
//   TextColumn get chequeDate => text().nullable()();
//   TextColumn get bankname => text().nullable()();
//   TextColumn get branchname => text().nullable()();
//   TextColumn get narration => text().nullable()();
//   IntColumn get advance => integer().nullable()();
// }
