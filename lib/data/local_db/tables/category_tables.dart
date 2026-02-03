import 'package:drift/drift.dart';

class CategoryTable extends Table {
 

  TextColumn get categoryName => text().nullable()();

  IntColumn get companyId => integer().nullable()();


  @override
  Set<Column> get primaryKey => {categoryName, companyId};
}
