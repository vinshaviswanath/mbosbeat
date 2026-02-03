import 'package:drift/drift.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/item_price_details_tables.dart';
import 'package:mpos_beat/presentation/views/transactions/transaction_order_booking/transaction_order_booking_screen.dart';

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

extension OrderItemQueries on AppDb {
  Stream<List<OrderItemFullView>> watchSelectedOrderItems({
    required int priceLevelId,
    required List<int> itemIds,
  }) {
    if (itemIds.isEmpty) {
      return Stream.value([]);
    }

    final query = select(itemMaster).join([
      innerJoin(
        itemPriceDetailsTables,
        itemPriceDetailsTables.itemId
            .equalsExp(itemMaster.stockItemId) &
        itemPriceDetailsTables.priceList.equals(priceLevelId),
      ),
    ])
      ..where(itemMaster.stockItemId.isIn(itemIds));

    return query.watch().map((rows) {
      final Map<int, List<ItemPriceDetailsTable>> priceMap = {};

      for (final row in rows) {
        final item = row.readTable(itemMaster);
        final price = row.readTable(itemPriceDetailsTables);

        priceMap.putIfAbsent(item.stockItemId, () => []).add(price);
      }

      return priceMap.entries.map((e) {
        return OrderItemFullView(
          item: rows
              .firstWhere(
                (r) =>
                    r.readTable(itemMaster).stockItemId == e.key,
              )
              .readTable(itemMaster),
          prices: e.value,
        );
      }).toList();
    });
  }
}


class OrderItemFullView {
  final ItemMasterData item;
  final List<ItemPriceDetailsTable> prices;

  OrderItemFullView({
    required this.item,
    required this.prices,
  });
}


