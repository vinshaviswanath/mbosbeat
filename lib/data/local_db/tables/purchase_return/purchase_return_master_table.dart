
import 'package:drift/drift.dart';

class PurchaseReturnMasterTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get custid => integer().nullable()();
  IntColumn get companyId => integer().nullable()();

  IntColumn get tripId => integer().nullable()();
  IntColumn get checkinId => integer().nullable()();
  TextColumn get gr => text().nullable()();
  IntColumn get godownId => integer().nullable()();
  IntColumn get routeId => integer().nullable()();
  IntColumn get userId => integer().nullable()();
  IntColumn get androidId => integer().nullable()();
  IntColumn get pricelistId => integer().nullable()();
  IntColumn get vchseriesId => integer().nullable()();
  IntColumn get vchno => integer().nullable()();

  TextColumn get vchnumber => text().nullable()();
  TextColumn get vchdate => text().nullable()();
  TextColumn get vchType => text().nullable()();

  TextColumn get vchtype => text().withDefault(const Constant("B2C"))();

  TextColumn get vchmode => text().nullable()();
  TextColumn get referenceno => text().nullable()();
  DateTimeColumn get referencedate => dateTime().nullable()();
  TextColumn get narration => text().nullable()();

  RealColumn get grossAmount => real()();
  RealColumn get discountAmount => real()();
  RealColumn get taxableAmount => real()();
  RealColumn get cgst => real()();
  RealColumn get sgst => real()();
  RealColumn get igst => real()();
  RealColumn get vataAmount => real()();
  RealColumn get cessAmount => real()();
  RealColumn get additionalcessAmount => real()();
  RealColumn get roundoff => real()();
  RealColumn get netAmount => real()();
  IntColumn get itemcount => integer().nullable()();
  IntColumn get autoreceipt => integer().nullable()();

  IntColumn get partyId => integer().nullable()();

  TextColumn get partyname => text().nullable()();

  TextColumn get statecode => text().nullable()();

  TextColumn get gstno => text().nullable()();
  RealColumn get distance => real()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  RealColumn get accuracy => real()();

  TextColumn get mobilecreatedon => text().nullable()();

  TextColumn get createdon => text().nullable()();

  IntColumn get status => integer().nullable()();

  IntColumn get importstatus => integer().nullable()();
  IntColumn get sync => integer().withDefault(const Constant(0))();
}