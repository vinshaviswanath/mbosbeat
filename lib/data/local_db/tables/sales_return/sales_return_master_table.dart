import 'package:drift/drift.dart';
class SaleReturnMasterTable extends Table {
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
// class SaleReturnMasterTable extends Table {
//   IntColumn get id => integer().autoIncrement()();

//   IntColumn get vchId => integer().nullable()();
//   TextColumn get voucherNo => text().nullable()();

//   IntColumn get partyId => integer().nullable()();
//   TextColumn get party => text().nullable()();

//   TextColumn get address => text().nullable()();
//   TextColumn get address2 => text().nullable()();
//   TextColumn get email => text().nullable()();
//   TextColumn get mob => text().nullable()();

//   TextColumn get voucherDate => text().nullable()();

//   RealColumn get voucherAmount => real()();
//   TextColumn get priceList => text().nullable()();
//   TextColumn get narration => text().nullable()();

//   RealColumn get lattitude => real().nullable()();
//   RealColumn get longitude => real().nullable()();
//   RealColumn get accuracy => real().nullable()();

//   IntColumn get userId => integer().nullable()();
//   IntColumn get companyId => integer().nullable()();

//   IntColumn get itemCount => integer().nullable()();

//   TextColumn get gstin => text().nullable()();
//   TextColumn get state => text().nullable()();
//   RealColumn get addDiscEntered => real().nullable()();

//   TextColumn get prefix => text().nullable()();
//   TextColumn get suffix => text().nullable()();

//   TextColumn get vchType => text().nullable()();
//   IntColumn get invNo => integer().nullable()();

//   TextColumn get godown => text().nullable()();

//   IntColumn get tripId => integer().nullable()();
//   IntColumn get visitId => integer().nullable()();

//   DateTimeColumn get createdTime => dateTime().nullable()();
//   DateTimeColumn get updatedTime => dateTime().nullable()();
//   TextColumn get deliveryDate => text().nullable()();

//   IntColumn get sync => integer().withDefault(const Constant(0))();

//   TextColumn get pinCode => text().nullable()();

//   IntColumn get uploadedServerId => integer().nullable()();

//   TextColumn get mailingName => text().nullable()();
// }
