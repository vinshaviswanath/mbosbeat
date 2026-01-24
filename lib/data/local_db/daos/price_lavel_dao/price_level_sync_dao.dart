import 'package:drift/drift.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/price_level_tables.dart';

part 'price_level_sync_dao.g.dart';

@DriftAccessor(tables: [PriceLevelsTable])
class PriceLevelDao extends DatabaseAccessor<AppDb>
    with _$PriceLevelDaoMixin {
  PriceLevelDao(super.db);

  Future<void> upsertPriceLevel(
    PriceLevelsTableCompanion item,
  ) {
    return into(priceLevelsTable).insertOnConflictUpdate(item);
  }

  Future<void> upsertPriceLevels(
    List<PriceLevelsTableCompanion> items,
  ) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(priceLevelsTable, items);
    });
  }

  Future<List<PriceLevelsTableData>> getAll() {
    return select(priceLevelsTable).get();
  }

  Stream<List<PriceLevelsTableData>> watchAll() {
    return select(priceLevelsTable).watch();
  }

  Future<List<PriceLevelsTableData>> getActive() {
    return (select(priceLevelsTable)
          ..where((tbl) => tbl.active.equals(true)))
        .get();
  }

    Stream<List<PriceLevelsTableData>> watchActive() {
    return (select(priceLevelsTable)
          ..where((tbl) => tbl.active.equals(true)))
        .watch();
  }

  Future<PriceLevelsTableData?> getDefault() {
    return (select(priceLevelsTable)
          ..where((tbl) => tbl.isDefault.equals(true))
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> getCount() async {
    final query = selectOnly(priceLevelsTable)
      ..addColumns([priceLevelsTable.id.count()]);

    final row = await query.getSingle();
    return row.read(priceLevelsTable.id.count()) ?? 0;
  }

  Future<void> clear() {
    return delete(priceLevelsTable).go();
  }
}


extension PriceLevelQueries on AppDb {

  /// Price levels for order screen dropdown
  /// - partyPriceListId == null → show ALL price levels
  /// - partyPriceListId != null → show ONLY mapped price level
  Stream<List<PriceLevelsTableData>> watchPriceLevelsForParty(
    int? partyPriceListId,
  ) {
    if (partyPriceListId == null) {
      // ✅ Party has no price list → show everything
      return select(priceLevelsTable).watch();
    }

    // ✅ Party has fixed price list → show only that
    return (select(priceLevelsTable)
          ..where((t) => t.id.equals(partyPriceListId)))
        .watch();
  }

  /// Helper for initial selection
  Future<PriceLevelsTableData?> getInitialPriceLevel(
    int? partyPriceListId,
  ) async {
    if (partyPriceListId == null) {
      return null; // user must choose
    }

    return (select(priceLevelsTable)
          ..where((t) => t.id.equals(partyPriceListId)))
        .getSingleOrNull();
  }
}
