import 'package:drift/drift.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/item_master_sync_model.dart';

extension ItemMasterMapper on StockItemList {
  ItemMasterCompanion toCompanion() {
    return ItemMasterCompanion(
      stockItemId: Value(stockItemId ?? 0),
      itemName: Value(itemName ?? ''),
      aliasName: Value(aliasName ?? ''),
      partNumber: Value(partNumber ?? ''),
      itemNameLcl: Value(itemNameLcl),
      groupName: Value(groupName),
      categoryName: Value(categoryName),
      unitName: Value(unitName ?? ''),
      decimalPlaces: Value(decimalPlaces ?? 0),
      altUnit: Value(altUnit),
      altDecimalPlaces: Value(
        altDecimalPlaces == null ? null : altDecimalPlaces as int,
      ),
      unitConversion: Value((unitConversion ?? 1).toDouble()),
      unitDenominator: Value((unitDenominator ?? 1).toDouble()),
      isActive: Value(isActive ?? true),
      isDeleted: Value(isDeleted ?? false),
      hsnCode: Value(hsnCode),
      taxPercent: Value(taxPercent?.toDouble()),
    );
  }
}
