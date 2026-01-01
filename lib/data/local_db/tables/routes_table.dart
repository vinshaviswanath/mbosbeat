import 'package:drift/drift.dart';

class GodownRoutes extends Table {
  IntColumn get id => integer().nullable()(); // API id
  IntColumn get companyId => integer().nullable()();

  TextColumn get routeCode =>
      text().nullable().withLength(min: 0, max: 50)();

  TextColumn get routeName =>
      text().nullable().withLength(min: 0, max: 100)();

  IntColumn get active => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
