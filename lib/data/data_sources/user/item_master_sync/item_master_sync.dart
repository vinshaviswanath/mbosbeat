import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/mappers/item_master_sync_mapper/item_master_sync_mapper.dart';
import 'package:mpos_beat/data/models/category_model.dart';
import 'package:mpos_beat/data/models/group_model.dart';
import 'package:mpos_beat/data/models/item_master_sync_model.dart';
import 'package:mpos_beat/domain/request/item_master_quary_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class ItemMasterSync {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  final AppDb appDb;

  ItemMasterSync(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences, {
    required this.appDb,
  });

  ResultFuture<ItemMasterSyncModel> call(
    BaseParams<ItemMasterQueryParams> params,
  ) {
    return runSafely(
      () async {
        int page = 1;
        bool hasMore = true;
        ItemMasterSyncModel? lastResponse;

        final allCompanions = <ItemMasterCompanion>[];

        while (hasMore) {
          final queryParams = params.data.copyWith(pageNumber: page).toMap();

          Logger.logInfo("📡 ItemMaster Page $page request: $queryParams");

          final response = await httpClient.get(
            Urls.itemMasterSync,
            queryParameters: queryParams.toQueryMap(),
          );

          if (!response.isOk) {
            throw CustomException(errMsg: response.message);
          }

          final data = ItemMasterSyncModel.fromJson(response.data);
          lastResponse = data;

          Logger.logInfo(
            "🧮 Page $page API rows: ${data.stockItemList.length}",
          );

          if (data.stockItemList.isEmpty) {
            hasMore = false;
            break;
          }

          final category = data.stockItemList
              .where(
                (e) => e.categoryName != null && e.categoryName!.isNotEmpty,
              )
              .map(
                (e) => CategoryTableCompanion(
                  categoryName: Value(e.categoryName),
                  companyId: Value(params.data.companyId),
                ),
              );

          final groupName = data.stockItemList
              .where((e) => e.groupName != null && e.groupName!.isNotEmpty)
              .map(
                (e) => GroupNameTableCompanion(
                  groupName: Value(e.groupName!),
                  companyId: Value(params.data.companyId),
                ),
              );

          await appDb.batch((batch) {
            batch.insertAll(
              appDb.categoryTable,
              category,
              mode: InsertMode.insertOrReplace,
            );
          });

          await appDb.batch((batch) {
            batch.insertAll(
              appDb.groupNameTable,
              groupName,
              mode: InsertMode.insertOrReplace,
            );
          });

          allCompanions.addAll(
            data.stockItemList.map(
              (e) => e.toCompanion(companyId: params.data.companyId),
            ),
          );

          page++;
        }

        if (allCompanions.isNotEmpty) {
          await appDb.itemMasterDao.clearItems();
          await appDb.itemMasterDao.upsertItems(allCompanions);

          await appDb.itemMasterDao.getItemCount();
        }

        final rows = await appDb.itemMasterDao.getAllActiveItems();
        Logger.logInfo("📥 After insert rows in DB: ${rows.length}");

        return lastResponse ??
            ItemMasterSyncModel(
              stockItemList: const [],
              id: null,
              status: 1,
              message: 'No data',
            );
      },
      failure: (error) {
        if (error.toLowerCase() == 'invalid referrel code!') {
          return InvalidReferralCode(errorMsg: error);
        }
        return MainFailure.genericError(errorMsg: error);
      },
    );
  }

  Stream<List<GroupModel>> groupNameList(int companyId) {
    return (appDb.select(
      appDb.groupNameTable,
    )..where((t) => t.companyId.equals(companyId))).watch().map(
      (rows) => rows
          .map(
            (e) => GroupModel(groupName: e.groupName, companyId: e.companyId),
          )
          .toList(),
    );
  }

  Stream<List<CategoryModel>> categoryList(int companyId) {
    return (appDb.select(
      appDb.categoryTable,
    )..where((t) => t.companyId.equals(companyId))).watch().map(
      (rows) => rows
          .map(
            (e) => CategoryModel(
              catgoryName: e.categoryName ?? "",
              companyId: e.companyId ?? 0,
            ),
          )
          .toList(),
    );
  }
}
