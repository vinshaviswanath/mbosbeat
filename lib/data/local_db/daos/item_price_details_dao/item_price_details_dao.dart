import 'package:drift/drift.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/item_price_details_tables.dart';

part 'item_price_details_dao.g.dart';

@DriftAccessor(tables: [ItemPriceDetailsTables])
class PriceListDetailsDao extends DatabaseAccessor<AppDb>
    with _$PriceListDetailsDaoMixin {
  PriceListDetailsDao(super.db);

  /* ---------------- INSERT ---------------- */

  Future<void> insertPriceListDetails(
    List<ItemPriceDetailsTablesCompanion> data,
  ) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(itemPriceDetailsTables, data);
    });
  }

  /* ---------------- CLEAR ---------------- */

  Future<void> clearAll() async {
    await delete(itemPriceDetailsTables).go();
  }

  /* ---------------- FETCH ---------------- */

  Future<List<ItemPriceDetailsTable>> getAll() {
    return select(itemPriceDetailsTables).get();
  }

  /* ---------------- STREAM ---------------- */

  Stream<List<ItemPriceDetailsTable>> watchAll() {
    return select(itemPriceDetailsTables).watch();
  }

  Stream<List<ItemPriceDetailsTable>> watchByItemId(int itemId) {
    return (select(
      itemPriceDetailsTables,
    )..where((t) => t.itemId.equals(itemId))).watch();
  }

  Stream<List<ItemPriceDetailsTable>> watchByCompanyId(int companyId) {
    return (select(
      itemPriceDetailsTables,
    )..where((t) => t.companyId.equals(companyId))).watch();
  }

  /* ---------------- COUNT ---------------- */

  Future<int> getCount() async {
    final result = await customSelect(
      'SELECT COUNT(*) AS count FROM item_price_details_tables',
      readsFrom: {itemPriceDetailsTables},
    ).getSingle();

    return result.data['count'] as int;
  }

  Stream<ItemPriceDetailsTable?> watchByItemAndPriceList({
    required int itemId,
    required int priceListId,
  }) {
    return (select(itemPriceDetailsTables)
          ..where(
            (t) => t.itemId.equals(itemId) & t.priceList.equals(priceListId),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  Future<ItemPriceDetailsTable?> getItemPriceByQty({
    required int itemId,
    required int priceListId,
    required double quantity,
  }) {
    return (select(itemPriceDetailsTables)
          ..where(
            (t) =>
                t.itemId.equals(itemId) &
                t.priceList.equals(priceListId) &
                t.fromQty.isSmallerOrEqualValue(quantity) &
                (t.toQty.isBiggerOrEqualValue(quantity) | t.toQty.equals(0)),
          )
          ..orderBy([
            // safest: lowest slab first
            (t) => OrderingTerm.asc(t.fromQty),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  Stream<ItemPriceDetailsTable?> watchItemPriceByQty({
    required int itemId,
    required int priceListId,
    required double quantity,
  }) {
    return (select(itemPriceDetailsTables)
          ..where(
            (t) =>
                t.itemId.equals(itemId) &
                t.priceList.equals(priceListId) &
                t.fromQty.isSmallerOrEqualValue(quantity) &
                (t.toQty.isBiggerOrEqualValue(quantity) | t.toQty.equals(0)),
          )
          ..orderBy([(t) => OrderingTerm.asc(t.fromQty)])
          ..limit(1))
        .watchSingleOrNull();
  }
}
