import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/godown_vehicles_tables.dart';
import 'package:mpos_beat/data/models/godown_list_model.dart';

part 'godown_vehicle_dao.g.dart';

@DriftAccessor(tables: [GodownVehicles])
class GodownVehicleDao extends DatabaseAccessor<AppDb>
    with _$GodownVehicleDaoMixin {
  GodownVehicleDao(super.db);

  Future<void> insertVehicles(List<VehicleList> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        godownVehicles,
        list.map(
          (e) => GodownVehiclesCompanion(
            id: Value(e.id ?? 0),
            companyId: Value(e.companyId),
            code: Value(e.code),
            name: Value(e.name),
            active: Value(e.active),
          ),
        ),
      );
    });
  }


  Future<List<GodownVehicle>> getAllVehicles() {
    return select(godownVehicles).get();
  }


  Stream<List<GodownVehicle>> watchVehicles() {
    return select(godownVehicles).watch();
  }


  Stream<List<GodownVehicle>> watchByCompany(int companyId) {
    return (select(
      godownVehicles,
    )..where((tbl) => tbl.companyId.equals(companyId))).watch();
  }


  Future<void> clearAll() async {
    await delete(godownVehicles).go();
  }

  Future<void> printGodownVehicles() async {
    final list = await select(godownVehicles).get();

    //debugPrint("Godown Vehicles List Length :: ${list.length}");
    //debugPrint("===== GODOWN VEHICLES TABLE JSON =====");

    for (final v in list) {
      debugPrint(
        const JsonEncoder.withIndent("  ").convert({
          "id": v.id,
          "companyId": v.companyId,
          "code": v.code,
          "name": v.name,
          "active": v.active,
        }),
      );
    }

   // debugPrint("=====================================");
  }

  Stream<List<GodownVehicle>> watchActiveVehiclesByCompany(int companyId) {
  return (select(godownVehicles)
        ..where(
          (tbl) =>
              tbl.companyId.equals(companyId) &
              tbl.active.equals(1),
        ))
      .watch();
}

}
