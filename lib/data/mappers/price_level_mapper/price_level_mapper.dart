

import 'package:drift/drift.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/price_level_model.dart';

extension PriceLevelMapper on PriceLevelData {
  PriceLevelsTableCompanion toCompanion() {
    return PriceLevelsTableCompanion(
      id: Value(id!),
      priceLevel: Value(priceLevel),
      rateInclusive: Value(rateInclusive ?? false),
      isDefault: Value(isDefault ?? false),
      active: Value(active ?? true),
    );
  }
}

