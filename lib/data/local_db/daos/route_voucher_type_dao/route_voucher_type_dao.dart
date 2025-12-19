import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/route_voucher_types_tables.dart';

part 'route_voucher_type_dao.g.dart';

@DriftAccessor(tables: [RouteVoucherTypes])
class RouteVoucherTypesDao extends DatabaseAccessor<AppDb>
    with _$RouteVoucherTypesDaoMixin {
  RouteVoucherTypesDao(super.db);

  // Insert or update single row
  Future<void> insertOne(RouteVoucherTypesCompanion voucher) async {
    await into(routeVoucherTypes).insertOnConflictUpdate(voucher);
  }

  // ✅ Correct bulk insert
  Future<void> insertAll(List<RouteVoucherTypesCompanion> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(routeVoucherTypes, list);
    });
  }

  Future<List<RouteVoucherType>> getAllRouteVoucherTypes() {
    return select(routeVoucherTypes).get();
  }

  Stream<List<RouteVoucherType>> watchAllRouteVoucherTypes() {
    return select(routeVoucherTypes).watch();
  }

  Future<int> deleteAll() {
    return delete(routeVoucherTypes).go();
  }

  Future<void> printAllRouteVoucherTypes() async {
    final list = await select(routeVoucherTypes).get();

    if (list.isEmpty) {
      debugPrint("RouteVoucherTypes table is empty");
      return;
    }

    for (final row in list) {
      debugPrint(
        "Route Voucher Type → \n"
        "ID: ${row.id}, \n"
        "CompanyID: ${row.companyId}, \n"
        "VoucherTypeID: ${row.voucherTypeId}, \n"
        "VoucherMenuName: ${row.voucherMenuName}, \n"
        "VoucherMode: ${row.voucherMode}, \n"
        "VoucherModeID: ${row.voucherModeId}, \n"
        "VoucherModeName: ${row.voucherModeName}, \n"
        "ApplicableFrom: ${row.applicableFrom}, \n"
        "HasB2B: ${row.hasB2B}, \n"
        "B2B Prefix: ${row.b2BPrefix}, \n"
        "B2B Suffix: ${row.b2BSuffix}, \n"
        "B2B Width: ${row.b2BWidth}, \n"
        "B2B StartFrom: ${row.b2BStartFrom}, \n"
        "B2C Prefix: ${row.b2CPrefix}, \n"
        "B2C Suffix: ${row.b2CSuffix}, \n"
        "B2C Width: ${row.b2CWidth}, \n"
        "B2C StartFrom: ${row.b2CStartFrom}, \n"
        "B2B Declaration: ${row.b2BDeclaration}, \n"
        "B2C Declaration: ${row.b2CDeclaration}, \n"
        "\n"
        "<<<<==============================>>>> \n",
      );
    }
  }
}
