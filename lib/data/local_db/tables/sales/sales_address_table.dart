import 'package:drift/drift.dart';

class SaleAddressTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get vchId => integer().nullable()();

  TextColumn get transactionType => text().nullable()();

  TextColumn get address1 => text().nullable()();
  TextColumn get address2 => text().nullable()();
  TextColumn get address3 => text().nullable()();

  TextColumn get city => text().nullable()();
  TextColumn get pin => text().nullable()();

  TextColumn get contactPerson => text().nullable()();
  TextColumn get mobile => text().nullable()();
  TextColumn get email => text().nullable()();

  TextColumn get state => text().nullable()();
  TextColumn get country => text().nullable()();
}
