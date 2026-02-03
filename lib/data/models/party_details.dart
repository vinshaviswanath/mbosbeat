import 'dart:convert';

/// =======================================
/// Party Master Details (Single API Model)
/// =======================================
class PartyMasterDetails {
  final int ledgerId;
  final int companyId;
  final String ledgerName;
  final String ledgerNameLocal;
  final String aliasName;
  final String ledDesc;
  final int groupId;
  final String groupName;
  final bool isActive;
  final bool isDeleted;

  final double creditLimit;
  final int dueDays;

  final String address1;
  final String address2;
  final String address3;
  final String city;
  final int stateId;
  final String stateName;
  final int countryId;
  final String countryName;
  final String pinCode;

  final double latitude;
  final double longitude;
  final double distanceFromCompanyKm;

  final String mailingName;
  final String contactPerson;
  final String mobile;
  final String whatsappNo;
  final String email;

  final String taxType;
  final String taxNumber;
  final String stateCode;

  final double closingBalance;
  final double onAccountValue;

  final int routeId;
  final String routeName;

  final int priceList;
  final int lastSyncOn;
  final String syncAction;

  /// ✅ Decoded price levels
  final List<PriceLevelDetails> priceLevels;

  PartyMasterDetails({
    required this.ledgerId,
    required this.companyId,
    required this.ledgerName,
    required this.ledgerNameLocal,
    required this.aliasName,
    required this.ledDesc,
    required this.groupId,
    required this.groupName,
    required this.isActive,
    required this.isDeleted,
    required this.creditLimit,
    required this.dueDays,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.stateId,
    required this.stateName,
    required this.countryId,
    required this.countryName,
    required this.pinCode,
    required this.latitude,
    required this.longitude,
    required this.distanceFromCompanyKm,
    required this.mailingName,
    required this.contactPerson,
    required this.mobile,
    required this.whatsappNo,
    required this.email,
    required this.taxType,
    required this.taxNumber,
    required this.stateCode,
    required this.closingBalance,
    required this.onAccountValue,
    required this.routeId,
    required this.routeName,
    required this.priceList,
    required this.lastSyncOn,
    required this.syncAction,
    required this.priceLevels,
  });

  factory PartyMasterDetails.fromJson(Map<String, dynamic> json) {
    final rawPriceLevels = json['price_levels_json'];

    final List<PriceLevelDetails> parsedPriceLevels =
        (rawPriceLevels != null && rawPriceLevels.toString().isNotEmpty)
            ? (jsonDecode(rawPriceLevels) as List)
                .map(
                  (e) => PriceLevelDetails.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList()
            : <PriceLevelDetails>[];

    return PartyMasterDetails(
      ledgerId: json['ledger_id'],
      companyId: json['company_id'],
      ledgerName: json['ledger_name'] ?? '',
      ledgerNameLocal: json['ledger_name_local'] ?? '',
      aliasName: json['alias_name'] ?? '',
      ledDesc: json['led_desc'] ?? '',
      groupId: json['group_id'] ?? 0,
      groupName: json['group_name'] ?? '',
      isActive: json['is_active'] == 1,
      isDeleted: json['is_deleted'] == 1,
      creditLimit: (json['credit_limit'] ?? 0).toDouble(),
      dueDays: json['due_days'] ?? 0,
      address1: json['address1'] ?? '',
      address2: json['address2'] ?? '',
      address3: json['address3'] ?? '',
      city: json['city'] ?? '',
      stateId: json['state_id'] ?? 0,
      stateName: json['state_name'] ?? '',
      countryId: json['country_id'] ?? 0,
      countryName: json['country_name'] ?? '',
      pinCode: json['pin_code'] ?? '',
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      distanceFromCompanyKm:
          (json['distance_from_company_k_m'] ?? 0).toDouble(),
      mailingName: json['mailing_name'] ?? '',
      contactPerson: json['contact_person'] ?? '',
      mobile: (json['mobile'] ?? '').toString().trim(),
      whatsappNo: (json['whatsapp_no'] ?? '').toString().trim(),
      email: json['email'] ?? '',
      taxType: json['tax_type'] ?? '',
      taxNumber: json['tax_number'] ?? '',
      stateCode: json['state_code'] ?? '',
      closingBalance: (json['closing_balance'] ?? 0).toDouble(),
      onAccountValue: (json['on_account_value'] ?? 0).toDouble(),
      routeId: json['route_id'] ?? 0,
      routeName: json['route_name'] ?? '',
      priceList: json['price_list'] ?? 0,
      lastSyncOn: json['last_sync_on'] ?? 0,
      syncAction: json['sync_action'] ?? '',
      priceLevels: parsedPriceLevels,
    );
  }

  /// ✅ Default price level helper
  PriceLevelDetails? get defaultPriceLevel {
    try {
      return priceLevels.firstWhere((e) => e.isDefault);
    } catch (_) {
      return null;
    }
  }

  /// ✅ Encode back to string (for DB if needed)
  String encodePriceLevelsJson() {
    return jsonEncode(priceLevels.map((e) => e.toJson()).toList());
  }

  /// ✅ Auto-selected price level using priceList
PriceLevelDetails? get selectedPriceLevel {
  // 1️⃣ Match by price_list id
  for (final level in priceLevels) {
    if (level.id == priceList) {
      return level;
    }
  }

  // 2️⃣ Fallback to default price level
  final def = defaultPriceLevel;
  if (def != null) return def;

  // 3️⃣ Final fallback
  return priceLevels.isNotEmpty ? priceLevels.first : null;
}

}

/// ===============================
/// Price Level Details Model
/// ===============================
class PriceLevelDetails {
  final int id;
  final int companyId;
  final String priceLevel;
  final bool rateInclusive;
  final bool isDefault;
  final bool active;

  PriceLevelDetails({
    required this.id,
    required this.companyId,
    required this.priceLevel,
    required this.rateInclusive,
    required this.isDefault,
    required this.active,
  });

  factory PriceLevelDetails.fromJson(Map<String, dynamic> json) {
    return PriceLevelDetails(
      id: json['id'],
      companyId: json['company_id'],
      priceLevel: json['price_level'],
      rateInclusive: json['rate_inclusive'] == 1,
      isDefault: json['is_default'] == 1,
      active: json['active'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'price_level': priceLevel,
      'rate_inclusive': rateInclusive ? 1 : 0,
      'is_default': isDefault ? 1 : 0,
      'active': active ? 1 : 0,
    };
  }
}
