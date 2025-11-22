// import 'dart:io';

// import 'package:drift/drift.dart';
// // These imports are used to open the database
// import 'package:drift/native.dart';
// import 'package:injectable/injectable.dart';
// import 'package:mpos_beat/data/local_db/daos/company_dao.dart';
// import 'package:mpos_beat/data/local_db/tables/company_tables.dart';
// import 'package:mpos_beat/data/local_db/tables/registration_details_tables.dart';
// import 'package:mpos_beat/data/local_db/tables/user_tables.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
// import 'package:sqlite3/sqlite3.dart';
// import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
// part 'app_db.g.dart';

// @singleton
// @DriftDatabase(tables: [Users,RegistrationDetails,Companies],daos: [
//   CompanyDao,
// ])
// class AppDb extends _$AppDb {
//   AppDb() : super(_openConnection());

//   @override
//   int get schemaVersion => 1;
// }

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));

//     if (Platform.isAndroid) {
//       await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
//     }

//     final catcebase = (await getTemporaryDirectory()).path;

//     sqlite3.tempDirectory = catcebase;

//     return NativeDatabase.createInBackground(file);
//   });
// }


import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:mpos_beat/data/local_db/tables/registration_details_tables.dart';
import 'package:mpos_beat/data/local_db/tables/user_tables.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'tables/company_tables.dart';
import 'daos/company_dao.dart';

part 'app_db.g.dart';

@DriftDatabase(
  tables: [
    Users,
    RegistrationDetails,
    Companies,
  ],
  daos: [
    CompanyDao,
  ],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  /// IMPORTANT: Schema version updated to 2
  @override
  int get schemaVersion => 2;

  /// MIGRATION: Ensures Companies table is created for existing DB files
  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from == 1) {
            await m.createTable(companies);
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    sqlite3.tempDirectory = (await getTemporaryDirectory()).path;

    return NativeDatabase.createInBackground(file);
  });
}
