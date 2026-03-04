// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/sql_query_builder.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/mappers/party_master_sync_mapper.dart';
import 'package:mpos_beat/data/models/party_MasterSync_model.dart';
import 'package:mpos_beat/data/models/party_details.dart';
import 'package:mpos_beat/data/models/product.dart';
import 'package:mpos_beat/domain/request/party_MasterSync_params.dart';

@lazySingleton
class PartyMasterSync {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  final AppDb appDb;

  PartyMasterSync(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences, {
    required this.appDb,
  });

  ResultFuture<PartyMasterSyncModel> call(
    BaseParams<PartyMasterSyncParams> params,
  ) {
    return runSafely(
      () async {
        int page = 1;
        bool hasMore = true;
        PartyMasterSyncModel? lastResponse;

        await appDb.partyMasterDao.clearParties();

        while (hasMore) {
          final body = {
            "CompanyID": params.data.companyId.toString(),
            "PageNumber": page.toString(),
            "LastSyncDateTime": params.data.lastSyncDateTime
                .toUtc()
                .toIso8601String(),
          };
          Logger.logInfo("📡 PartyMaster Page $page request: $body");

          final response = await httpClient.get(
            Urls.partyMasterSync,
            queryParameters: body,
          );

          //  Logger.logInfo("PartyMasterSync Raw Response: ${response.body}");
          if (!response.isOk) {
            throw CustomException(errMsg: response.message);
          }

          final data = PartyMasterSyncModel.fromJson(response.data);
          lastResponse = data;

          Logger.logInfo("🧮 Page $page API rows: ${data.partyList.length}");

          // Stop when backend sends empty page
          if (data.partyList.isEmpty) {
            hasMore = false;
            break;
          }

          final companions = data.partyList.map((e) {
            return e.toCompanion(companyId: params.data.companyId);
          }).toList();

          Logger.logInfo("📦 Companion count: ${companions.length}");

          if (companions.isEmpty) {
            Logger.logInfo("❌ Mapper produced empty list");
          }
          //await appDb.partyMasterDao.clearParties();
          await appDb.partyMasterDao.insertOrUpdateParties(companions);
          //    await appDb.partyMasterDao.printAllPartyMasters();
          page++;
        }

        final rows = await appDb.partyMasterDao.getAllParties();

        Logger.logInfo("📥 After insert rows in DB: ${rows.length}");
        return lastResponse!;
      },

      failure: (error) {
        if (error.toLowerCase() == 'invalid referrel code!') {
          return InvalidReferralCode(errorMsg: error);
        }
        return MainFailure.genericError(errorMsg: error);
      },
    );
  }

  List<Product> _products = [];
  List<Product> get products => _products;

  Future<List<Product>> fetchProduct(
    int companyId,
    int ledgerId,
    int selectedPriceLevelId,
    String? groupName,
    String? categoryName,
    String? searchValue, {
    required int limit,
    required int offset,
  }) async {
    Logger.logInfo(DateTime.now());
    final (sql, args) = buildQuery(
      limit: limit,
      offset: offset,
      companyId: companyId,
      ledgerId: ledgerId,
      selectedPriceLevelId: selectedPriceLevelId,
      categoryName: categoryName,
      groupName: groupName,
      searchValue: searchValue,
    ).build();
    print(sql);
    print(args);
    final rows = await appDb
        .customSelect(sql, variables: args.map((e) => Variable(e)).toList())
        .get();

    print(rows.firstOrNull?.data);
    Logger.logInfo(DateTime.now());

    return rows.map((r) => Product.fromJson(r.data)).toList();
  }

  Stream<List<Category>> listCateGory(String? cName) {
    return appDb
        .select(appDb.categoryTable)
        .watch()
        .map(
          (rows) => rows
              .map(
                (row) =>
                    Category(companyId: row.companyId, name: row.categoryName),
              )
              .toList(),
        );
  }

  Stream<List<GroupName>> listGroup(String? cName) {
    return appDb
        .select(appDb.groupNameTable)
        .watch()
        .map(
          (rows) => rows
              .map(
                (row) =>
                    GroupName(companyId: row.companyId, name: row.groupName),
              )
              .toList(),
        );
  }

  QueryBuilder buildQuery({
    required int companyId,
    required int ledgerId,
    required int selectedPriceLevelId,
    String? groupName,
    String? categoryName,
    String? searchValue,
    required int limit,
    required int offset,
  }) {
    final builder = QueryBuilder();

    builder
        .select(['*'])
        .from('item_master i')
        .join(
          'LEFT JOIN item_price_details_tables ip '
          'ON ip.item_id = i.stock_item_id AND ip.price_list = ?',
          [selectedPriceLevelId],
        )
        .where('i.company_id = ?', [companyId]);

    if (categoryName != null && categoryName != 'All') {
      builder.where('i.category_name = ?', [categoryName]);
    }

    if (groupName != null && groupName != 'All') {
      builder.where('i.group_name = ?', [groupName]);
    }

    if (searchValue != null && searchValue.isNotEmpty) {
      builder.where(
        '('
        'i.item_name LIKE ? COLLATE NOCASE OR '
        'i.alias_name LIKE ? COLLATE NOCASE OR '
        'i.part_number LIKE ?'
        ')',
        ['%$searchValue%', '%$searchValue%', '%$searchValue%'],
      );
    }

    builder.orderBy('i.item_name COLLATE NOCASE').limit(limit).offset(offset);

    return builder;
    // builder
    //     .select(['*'])
    //     .from('item_master i')
    //     .join(
    //       'LEFT JOIN item_price_details_tables ip'
    //       ' ON ip.item_id = i.stock_item_id AND ip.price_list = ?',
    //     )
    //     .where(
    //       'i.company_id = ?'
    //       ' AND  (:category IS NULL OR i.category_name = :category) '
    //       'AND (:group IS NULL OR i.group_name = :group) '
    //       'AND (:search IS NULL OR i.item_name LIKE :search COLLATE NOCASE'
    //       ' OR i.alias_name LIKE :search COLLATE NOCASE'
    //       ' OR i.part_number LIKE :search) ',
    //     );

    // return '${builder.build()} '
    //     'ORDER BY i.item_name COLLATE NOCASE '
    //     'LIMIT ? OFFSET ?';
  }

  Future<PartyMasterDetails?> fetchParty(int companyId, int ledgerId) async {
    final priceLevelCTE = """
    SELECT
       pl.company_id,
       json_group_array(
         json_object(
           'id',  pl.id,
           'company_id', pl.company_id,
           'price_level', pl.price_level,
           'rate_inclusive', pl.rate_inclusive,
           'is_default', pl.is_default,
           'active', pl.active
         )
       ) AS price_levels_json
    FROM price_levels_table pl
   """;

    final builder = SqlQueryBuilder();

    builder
        .withClause('price_levels_cet', priceLevelCTE)
        .select(['*'])
        .from('party_master pm')
        .join('LEFT JOIN price_levels_cet p ON p.company_id  = ?')
        .where('pm.ledger_id = ?');

    final row = await appDb
        .customSelect(
          builder.build(),
          variables: [Variable(companyId), Variable(ledgerId)],
        )
        .getSingleOrNull();

    if (row == null) return null;

    final party = PartyMasterDetails.fromJson(row.data);

    Logger.logInfo(row.data);

    return party;
  }

  Future<void> _savePartyDetails(PartyMasterDetails party) async {
    await appDb.transaction(() async {
      /// 1️⃣ Save / update party master
      await appDb
          .into(appDb.partyMaster)
          .insertOnConflictUpdate(
            PartyMasterCompanion(
              ledgerId: Value(party.ledgerId),
              companyId: Value(party.companyId),
              ledgerName: Value(party.ledgerName),
              ledgerNameLocal: Value(party.ledgerNameLocal),
              aliasName: Value(party.aliasName),
              ledDesc: Value(party.ledDesc),
              groupId: Value(party.groupId),
              groupName: Value(party.groupName),
              isActive: Value(party.isActive),
              isDeleted: Value(party.isDeleted),
              creditLimit: Value(party.creditLimit),
              dueDays: Value(party.dueDays),
              address1: Value(party.address1),
              address2: Value(party.address2),
              address3: Value(party.address3),
              city: Value(party.city),
              stateId: Value(party.stateId),
              stateName: Value(party.stateName),
              countryId: Value(party.countryId),
              countryName: Value(party.countryName),
              pinCode: Value(party.pinCode),
              latitude: Value(party.latitude),
              longitude: Value(party.longitude),
              mailingName: Value(party.mailingName),
              contactPerson: Value(party.contactPerson),
              mobile: Value(party.mobile),
              whatsappNo: Value(party.whatsappNo),
              email: Value(party.email),
              taxType: Value(party.taxType),
              taxNumber: Value(party.taxNumber),
              stateCode: Value(party.stateCode),
              closingBalance: Value(party.closingBalance),
              onAccountValue: Value(party.onAccountValue),
              routeId: Value(party.routeId),
              routeName: Value(party.routeName),
              priceList: Value(party.priceList),
              lastSyncOn: Value(
                DateTime.fromMillisecondsSinceEpoch(party.lastSyncOn * 1000),
              ),
              syncAction: Value(party.syncAction),
            ),
          );

      /// 2️⃣ Save price levels
      await _savePriceLevels(party.companyId, party.priceLevels);
    });
  }

  Future<void> _savePriceLevels(
    int companyId,
    List<PriceLevelDetails> levels,
  ) async {
    /// Optional: clear old price levels for company
    await (appDb.delete(
      appDb.priceLevelsTable,
    )..where((tbl) => tbl.companyId.equals(companyId))).go();

    /// Insert fresh ones
    await appDb.batch((batch) {
      for (final p in levels) {
        batch.insert(
          appDb.priceLevelsTable,
          PriceLevelsTableCompanion(
            id: Value(p.id),
            companyId: Value(p.companyId),
            priceLevel: Value(p.priceLevel),
            rateInclusive: Value(p.rateInclusive),
            isDefault: Value(p.isDefault),
            active: Value(p.active),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }
}

// Future<List<Product>> fetchProduct(
//   int companyId,
//   int ledgerId,
//   int selectedPriceLevelId,
// ) async {
//   try {
//     final rows = await appDb
//         .customSelect(
//           buildQuery(),
//           variables: [Variable(selectedPriceLevelId), Variable(companyId)],
//         )
//         .get();

//     _products = rows.map((row) => Product.fromJson(row.data)).toList();

//     Logger.logInfo(rows.map((e) => e.data).toList());

//     return _products; // ✅ return the list
//   } catch (e) {
//     Logger.logError(e.toString());
//     return [];
//   }
// }

//   String buildQuery() {
//     final itemPriceCTE = """
//       SELECT
//         ip.item_id,
//         ip.price_list,
//         json_group_array(
//           json_object(
//             'item_id', ip.item_id,
//             'applicable_date', ip.applicable_date,
//             'company_id', ip.company_id,
//             'price_list', ip.price_list,
//             'rate', ip.rate,
//             'discount', ip.discount,
//             'discount_type', ip.discount_type,
//             'from_qty', ip.from_qty,
//             'to_qty', ip.to_qty
//           )
//         ) AS price_list_json
//       FROM item_price_details_tables ip
//       GROUP BY ip.id, ip.price_list
//       """;

//     SqlQueryBuilder builder = SqlQueryBuilder();

//     builder
//         // .withClause('item_price_cte', itemPriceCTE)
//         .select(['*'])
//         .from('item_master i')
//         .join(
//           'LEFT JOIN item_price_details_tables ip '
//           'ON ip.item_id = i.stock_item_id AND ip.price_list = ?',
//         )
//         .where('i.company_id = ?  ');

//     return builder.build();
//   }

//   Future<PartyMasterDetails?> fetchParty(int companyId, int ledgerId) async {
//     final priceLevelCTE = """
//     SELECT
//        pl.company_id,
//        json_group_array(
//          json_object(
//            'id',  pl.id,
//            'company_id', pl.company_id,
//            'price_level', pl.price_level,
//            'rate_inclusive', pl.rate_inclusive,
//            'is_default', pl.is_default,
//            'active', pl.active
//          )
//        ) AS price_levels_json
//     FROM price_levels_table pl
//   """;

//     final builder = SqlQueryBuilder();

//     builder
//         .withClause('price_levels_cet', priceLevelCTE)
//         .select(['*'])
//         .from('party_master pm')
//         .join('LEFT JOIN price_levels_cet p ON p.company_id  = ?')
//         .where('pm.ledger_id = ?');

//     final row = await appDb
//         .customSelect(
//           builder.build(),
//           variables: [Variable(companyId), Variable(ledgerId)],
//         )
//         .getSingleOrNull();

//     if (row == null) return null;

//     final party = PartyMasterDetails.fromJson(row.data);

//     Logger.logInfo(row.data);

//     return party;
//   }

class GroupName {
  final String? name;
  final int? companyId;

  GroupName({required this.companyId, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'companyId': companyId};
  }

  factory GroupName.fromMap(Map<String, dynamic> map) {
    return GroupName(name: map['name'], companyId: map['companyId']);
  }
}

class Category {
  final String? name;
  final int? companyId;

  Category({required this.companyId, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'companyId': companyId};
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(name: map['name'], companyId: map['companyId']);
  }
}
