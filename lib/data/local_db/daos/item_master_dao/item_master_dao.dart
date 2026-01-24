import 'package:drift/drift.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/item_master_sync_tables.dart';

part 'item_master_dao.g.dart';

@DriftAccessor(tables: [ItemMaster])
class ItemMasterDao extends DatabaseAccessor<AppDb> with _$ItemMasterDaoMixin {
  ItemMasterDao(AppDb db) : super(db);

  /// Insert or update single item
  Future<void> upsertItem(ItemMasterCompanion item) async {
    await into(itemMaster).insertOnConflictUpdate(item);
  }

  /// Bulk insert (sync API)
  Future<void> upsertItems(List<ItemMasterCompanion> items) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(itemMaster, items);
    });
  }

  /// Search by itemName / aliasName / partNumber
  Future<List<ItemMasterData>> searchItems(String query) {
    final q = '%$query%';

    return (select(itemMaster)
          ..where(
            (tbl) =>
                tbl.itemName.like(q) |
                tbl.aliasName.like(q) |
                tbl.partNumber.like(q),
          )
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.itemName)]))
        .get();
  }

  /// Get all active items
  Future<List<ItemMasterData>> getAllActiveItems() {
    return (select(
      itemMaster,
    )..where((tbl) => tbl.isActive.equals(true))).get();
  }

  Stream<List<ItemMasterData>> watchAllActiveItems() {
    return (select(
      itemMaster,
    )..where((tbl) => tbl.isActive.equals(true))).watch();
  }

  /// Get all items
  Future<List<ItemMasterData>> getAllParties() {
    return select(itemMaster).get();
  }

  Stream<List<ItemMasterData>> watchAllParties() {
    return select(itemMaster).watch();
  }

  /// Clear table before fresh sync
  Future<void> clearItems() async {
    await delete(itemMaster).go();
  }

  /// Total item count
  Future<int> getItemCount() async {
    final query = selectOnly(itemMaster)..addColumns([itemMaster.id.count()]);

    final row = await query.getSingle();
    Logger.logInfo("Length :: ${row.read(itemMaster.id.count()) ?? 0}");
    return row.read(itemMaster.id.count()) ?? 0;
  }

  /// Watch all active items
  Stream<List<ItemMasterData>> watchActiveItems() {
    return (select(
      itemMaster,
    )..where((tbl) => tbl.isActive.equals(true))).watch();
  }

  /// Watch distinct group names
  Stream<List<String>> watchGroups() {
    final query = selectOnly(itemMaster, distinct: true)
      ..addColumns([itemMaster.groupName])
      ..where(itemMaster.groupName.isNotNull());

    return query.watch().map(
      (rows) => rows.map((row) => row.read(itemMaster.groupName)!).toList(),
    );
  }

  /// Watch distinct category names
  Stream<List<String>> watchCategories() {
    final query = selectOnly(itemMaster, distinct: true)
      ..addColumns([itemMaster.categoryName])
      ..where(itemMaster.categoryName.isNotNull());

    return query.watch().map(
      (rows) => rows.map((row) => row.read(itemMaster.categoryName)!).toList(),
    );
  }

  Stream<List<ItemMasterData>> watchFilteredItems({
    String? group,
    String? category,
    String? search,
    required int limit,
    required int offset,
  }) {
    final query = select(itemMaster)..where((tbl) => tbl.isActive.equals(true));

    if (group != null && group != 'All') {
      query.where((tbl) => tbl.groupName.equals(group));
    }

    if (category != null && category != 'All') {
      query.where((tbl) => tbl.categoryName.equals(category));
    }

    if (search != null && search.isNotEmpty) {
      final q = '%${search.toLowerCase()}%';
      query.where(
        (tbl) =>
            tbl.itemName.lower().like(q) |
            tbl.aliasName.lower().like(q) |
            tbl.partNumber.lower().like(q) |
            tbl.stockItemId.cast<String>().like(q),
      );
    }

    query
      ..limit(limit, offset: offset)
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.itemName)]);

    return query.watch();
  }
}


