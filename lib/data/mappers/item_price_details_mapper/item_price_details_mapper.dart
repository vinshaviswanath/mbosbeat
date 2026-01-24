

import 'package:drift/drift.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/item_price_details_model.dart';

extension PriceListDetailCompanionMapper on PriceListDetailModel {
  ItemPriceDetailsTablesCompanion toCompanion() {
    return ItemPriceDetailsTablesCompanion(
      id: Value(id!),
      applicableDate: Value(applicableDate),
      itemId: Value(itemId),
      companyId: Value(companyId),
      priceList: Value(priceList),
      rate: Value(rate),
      discount: Value(discount),
      discountType: Value(discountType),
      fromQty: Value(fromQty),
      toQty: Value(toQty),
    );
  }
}


extension ItemPriceDetailsDataMapper on ItemPriceDetailsTable {
  PriceListDetailModel toDomain() {
    return PriceListDetailModel(
      id: id,
      applicableDate: applicableDate,
      itemId: itemId,
      companyId: companyId,
      priceList: priceList,
      rate: rate,
      discount: discount,
      discountType: discountType,
      fromQty: fromQty,
      toQty: toQty,
    );
  }
}


