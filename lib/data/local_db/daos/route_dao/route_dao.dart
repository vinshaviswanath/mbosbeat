import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/routes_table.dart';
import 'package:mpos_beat/data/models/route_list_model.dart';

part 'route_dao.g.dart';

@DriftAccessor(tables: [GodownRoutes])
class RouteDao extends DatabaseAccessor<AppDb> with _$RouteDaoMixin {
  RouteDao(super.db);

  Future<void> insertRoutes(List<RouteList> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        godownRoutes,
        list.map(
          (e) => GodownRoutesCompanion(
            id: Value(e.id),
            companyId: Value(e.companyId),
            routeCode: Value(e.routeCode),
            routeName: Value(e.routeName),
            active: Value(e.active),
          ),
        ),
      );
    });
  }

  Future<List<GodownRoute>> getAllRoutes() {
    return select(godownRoutes).get();
  }

  Stream<List<GodownRoute>> watchRoutes() {
    return select(godownRoutes).watch();
  }

  Future<void> clearAll() async {
    await delete(godownRoutes).go();
  }

  Future<void> clearByCompany(int companyId) async {
    await (delete(
      godownRoutes,
    )..where((tbl) => tbl.companyId.equals(companyId))).go();
  }


  Future<void> printRoutes() async {
    final list = await select(godownRoutes).get();

    debugPrint("Routes List Length :: ${list.length}");
    debugPrint("===== ROUTES TABLE JSON =====");

    for (final r in list) {
      debugPrint(
        const JsonEncoder.withIndent("  ").convert({
          "id": r.id,
          "companyId": r.companyId,
          "routeCode": r.routeCode,
          "routeName": r.routeName,
          "active": r.active,
        }),
      );
    }

    debugPrint("================================");
  }

  Future<void> printRoutesByCompany(int companyId) async {
    final list = await (select(
      godownRoutes,
    )..where((tbl) => tbl.companyId.equals(companyId))).get();

    debugPrint("Routes (companyId=$companyId) Length :: ${list.length}");
    debugPrint("===== ROUTES TABLE JSON =====");

    for (final r in list) {
      debugPrint(
        const JsonEncoder.withIndent("  ").convert({
          "id": r.id,
          "companyId": r.companyId,
          "routeCode": r.routeCode,
          "routeName": r.routeName,
          "active": r.active,
        }),
      );
    }

    debugPrint("================================");
  }

  Stream<List<GodownRoute>> watchActiveRoutesByCompany(int companyId) {
  return (select(godownRoutes)
        ..where(
          (tbl) =>
              tbl.companyId.equals(companyId) &
              tbl.active.equals(1),
        ))
      .watch();
}

}
