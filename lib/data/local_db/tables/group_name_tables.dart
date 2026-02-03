import 'package:drift/drift.dart';

class GroupNameTable extends Table {
  TextColumn get groupName => text()();

  IntColumn get companyId => integer()();


  @override
  Set<Column> get primaryKey => {groupName, companyId};
}
