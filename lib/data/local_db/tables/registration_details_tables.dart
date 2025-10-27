import 'package:drift/drift.dart';

class RegistrationDetails extends Table {
  IntColumn? get id => integer().withDefault(const Variable(0))();
  TextColumn? get productName => text().withDefault(const Variable("mPosBeat"))();
  TextColumn get companyName => text().nullable()();
  TextColumn get mobile => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get adminUsername => text().nullable()();
  TextColumn get password => text().nullable()();
}
