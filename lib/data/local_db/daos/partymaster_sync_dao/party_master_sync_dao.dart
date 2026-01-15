import 'package:drift/drift.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/partymaster_sync_tables.dart';

part 'party_master_sync_dao.g.dart';

@DriftAccessor(tables: [PartyMaster])
class PartyMasterDao extends DatabaseAccessor<AppDb>
    with _$PartyMasterDaoMixin {
  PartyMasterDao(AppDb db) : super(db);

  // 🔹 Insert or Update (UPSERT) single party
  Future<void> insertOrUpdateParty(PartyMasterCompanion party) async {
    await into(partyMaster).insert(party, mode: InsertMode.insertOrReplace);
  }

  // 🔹 Bulk Insert (for API sync)
  Future<void> insertOrUpdateParties(List<PartyMasterCompanion> parties) async {
    await batch((batch) {
      batch.insertAll(partyMaster, parties, mode: InsertMode.insertOrReplace);
    });
  }

  // 🔹 Get all parties
  Future<List<PartyMasterData>> getAllParties() {
    return select(partyMaster).get();
  }

  Stream<List<PartyMasterData>> watchAllParties() {
    return select(partyMaster).watch();
  }

  // 🔹 Get only active parties
  Future<List<PartyMasterData>> getActiveParties() {
    return (select(partyMaster)..where((t) => t.isActive.equals(true))).get();
  }

  // 🔹 Get parties by route
  Future<List<PartyMasterData>> getPartiesByRoute(int routeId) {
    return (select(partyMaster)..where((t) => t.routeId.equals(routeId))).get();
  }

  // 🔹 Search by ledger name
  Future<List<PartyMasterData>> searchParty(String keyword) {
    return (select(
      partyMaster,
    )..where((t) => t.ledgerName.like('%$keyword%'))).get();
  }

  // 🔹 Get single party
  Future<PartyMasterData?> getPartyById(int ledgerId) {
    return (select(
      partyMaster,
    )..where((t) => t.ledgerId.equals(ledgerId))).getSingleOrNull();
  }

  // 🔹 Delete one
  Future<int> deleteParty(int ledgerId) {
    return (delete(
      partyMaster,
    )..where((t) => t.ledgerId.equals(ledgerId))).go();
  }

  // 🔹 Delete all (during full re-sync)
  Future<void> clearParties() async {
    await delete(partyMaster).go();
  }

  //to print
  Future<void> printAllPartyMasters() async {
    final list = await select(partyMaster).get();

    debugPrint(
      "partmaster List Length ........................................:: ${list.length}",
    );

    if (list.isEmpty) {
      debugPrint("❌ PartyMaster table is empty");
      return;
    }

    debugPrint("📦 PartyMaster rows: ${list.length}");

    for (final row in list) {
      debugPrint(
        "Party → \n"
        "LedgerID: ${row.ledgerId}, \n"
        "Name: ${row.ledgerName}, \n"
        "Local Name: ${row.ledgerNameLocal}, \n"
        "Alias: ${row.aliasName}, \n"
        "Group: ${row.groupName}, \n"
        "Active: ${row.isActive}, \n"
        "Deleted: ${row.isDeleted}, \n"
        "CreditLimit: ${row.creditLimit}, \n"
        "DueDays: ${row.dueDays}, \n"
        "Mobile: ${row.mobile}, \n"
        "WhatsApp: ${row.whatsappNo}, \n"
        "Email: ${row.email}, \n"
        "City: ${row.city}, \n"
        "State: ${row.stateName}, \n"
        "Country: ${row.countryName}, \n"
        "Route: ${row.routeName}, \n"
        "ClosingBalance: ${row.closingBalance}, \n"
        "SyncAction: ${row.syncAction}, \n"
        "LastSync: ${row.lastSyncOn} \n"
        "<<<<==============================>>>>\n",
      );
    }
  }
}
