import 'package:drift/drift.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/sales_order/sale_order_master_table.dart';

part 'sales_order_master_dao.g.dart';

@DriftAccessor(tables: [SaleOrderMasterTable])
class SaleOrderMasterDao extends DatabaseAccessor<AppDb>
    with _$SaleOrderMasterDaoMixin {
  SaleOrderMasterDao(super.db);

  /// 🔹 Insert
  Future<int> insertMaster(SaleOrderMasterTableCompanion data) {
    return into(saleOrderMasterTable).insert(data);
  }

  /// 🔹 Update
  Future<bool> updateMaster(SaleOrderMasterTableData data) {
    return update(saleOrderMasterTable).replace(data);
  }

  /// 🔹 Delete by id
  Future<int> deleteMaster(int id) {
    return (delete(saleOrderMasterTable)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  /// 🔹 Get all
  Future<List<SaleOrderMasterTableData>> getAll() {
    return select(saleOrderMasterTable).get();
  }

  /// 🔹 Watch all
  Stream<List<SaleOrderMasterTableData>> watchAll() {
    return select(saleOrderMasterTable).watch();
  }

  /// 🔥 IMPORTANT — last voucher number
  Future<String?> getLastVoucherNo(int companyId) async {
    final query =
        (select(saleOrderMasterTable)
              ..where((tbl) => tbl.companyId.equals(companyId))
              ..orderBy([(t) => OrderingTerm.desc(t.id)])
              ..limit(1));

    final row = await query.getSingleOrNull();

    return row?.voucherNo.toString();
  }

  Future<int?> getLastVchId(int companyId) async {
  final row = await customSelect(
    'SELECT MAX(vch_id) AS maxId FROM sale_order_master_table WHERE company_id = ?',
    variables: [Variable(companyId)],
  ).getSingle();

  return row.data['maxId'] as int?;
}

Future<int> getNextVchId(int companyId) async {
  final last = await getLastVchId(companyId);
  return (last ?? 0) + 1;
}

  /// 🔹 Print debug
  Future<void> printAll() async {
    final list = await getAll();

    for (final row in list) {
      print("MASTER → ID:${row.id} Voucher:${row.voucherNo}");
    }
  }

  /// 🔹 Delete by company
  Future<int> deleteByCompany(int companyId) {
    return (delete(saleOrderMasterTable)
          ..where((tbl) => tbl.companyId.equals(companyId)))
        .go();
  }

  Future<int> clearTable() {
  return delete(saleOrderMasterTable).go();
}
}