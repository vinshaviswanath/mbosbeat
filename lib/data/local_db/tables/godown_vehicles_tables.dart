import 'package:drift/drift.dart';

class GodownVehicles extends Table {
  IntColumn get id => integer()(); 
  IntColumn get companyId => integer().nullable()();

  TextColumn get code =>
      text().nullable().withLength(min: 0, max: 50)();

  TextColumn get name =>
      text().nullable().withLength(min: 0, max: 100)();

  IntColumn get active =>
      integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
