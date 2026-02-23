class Product {
  final int id;
  final int companyId;
  final int stockItemId;
  final String itemName;
  final String aliasName;
  final String partNumber;
  final String itemNameLcl;
  final String groupName;
  final String categoryName;
  final String unitName;
  final int decimalPlaces;
  final String altUnit;
  final double? altDecimalPlaces;
  final double unitConversion;
  final double unitDenominator;
  final int isActive;
  final int isDeleted;
  final String hsnCode;
  final double taxPercent;
  final int? closingStock;
  final int? cess;
  final int? cost;
  final int applicableDate;
  final int itemId;
  final int priceList;
  final double rate;
  final double discount;
  final String discountType;
  final double fromQty;
  final double toQty;
  final int? priceLevelId;
  final String? priceLevelName;
  final bool? rateInclusive;
  final bool? isDefaultPriceLevel;
  final bool? priceLevelActive;

  Product({
    required this.id,
    required this.companyId,
    required this.stockItemId,
    required this.itemName,
    required this.aliasName,
    required this.partNumber,
    required this.itemNameLcl,
    required this.groupName,
    required this.categoryName,
    required this.unitName,
    required this.decimalPlaces,
    required this.altUnit,
    this.altDecimalPlaces,
    required this.unitConversion,
    required this.unitDenominator,
    required this.isActive,
    required this.isDeleted,
    required this.hsnCode,
    required this.taxPercent,
    required this.closingStock,
    required this.cess,
    required this.cost,
    required this.applicableDate,
    required this.itemId,
    required this.priceList,
    required this.rate,
    required this.discount,
    required this.discountType,
    required this.fromQty,
    required this.toQty,
    this.priceLevelId,
    this.priceLevelName,
    this.rateInclusive,
    this.isDefaultPriceLevel,
    this.priceLevelActive,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      companyId: json['company_id'] ?? 0,
      stockItemId: json['stock_item_id'] ?? 0,
      itemName: json['item_name'] ?? '',
      aliasName: json['alias_name'] ?? '',
      partNumber: json['part_number'] ?? '',
      itemNameLcl: json['item_name_lcl'] ?? '',
      groupName: json['group_name'] ?? '',
      categoryName: json['category_name'] ?? '',
      unitName: json['unit_name'] ?? '',
      decimalPlaces: json['decimal_places'] ?? 0,
      altUnit: json['alt_unit'] ?? '',
      altDecimalPlaces: json['alt_decimal_places'],
      unitConversion: (json['unit_conversion'] ?? 1).toDouble(),
      unitDenominator: (json['unit_denominator'] ?? 1).toDouble(),
      isActive: json['is_active'] ?? 0,
      isDeleted: json['is_deleted'] ?? 0,
      hsnCode: json['hsn_code'] ?? '',
      taxPercent: (json['tax_percent'] ?? 0).toDouble(),
      closingStock: json["closingStock"],
      cess: json["cess"],
      cost: json["cost"],
      applicableDate: json['applicable_date'] ?? 0,
      itemId: json['item_id'] ?? 0,
      priceList: json['price_list'] ?? 0,
      rate: (json['rate'] ?? 0).toDouble(),
      discount: (json['discount'] ?? 0).toDouble(),
      discountType: json['discount_type'] ?? '',
      fromQty: (json['from_qty'] ?? 0).toDouble(),
      toQty: (json['to_qty'] ?? 0).toDouble(),
      priceLevelId: json['price_level_id'] as int?,
      priceLevelName: json['price_level_name'] as String?,
      rateInclusive:
          json['rate_inclusive'] == 1 || json['rate_inclusive'] == true,
      isDefaultPriceLevel:
          json['is_default_price_level'] == 1 ||
          json['is_default_price_level'] == true,
      priceLevelActive:
          json['price_level_active'] == 1 || json['price_level_active'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'stock_item_id': stockItemId,
      'item_name': itemName,
      'alias_name': aliasName,
      'part_number': partNumber,
      'item_name_lcl': itemNameLcl,
      'group_name': groupName,
      'category_name': categoryName,
      'unit_name': unitName,
      'decimal_places': decimalPlaces,
      'alt_unit': altUnit,
      'alt_decimal_places': altDecimalPlaces,
      'unit_conversion': unitConversion,
      'unit_denominator': unitDenominator,
      'is_active': isActive,
      'is_deleted': isDeleted,
      'hsn_code': hsnCode,
      'tax_percent': taxPercent,
      "closingStock": closingStock,
      "cess": cess,
      "cost": cost,
      'applicable_date': applicableDate,
      'item_id': itemId,
      'price_list': priceList,
      'rate': rate,
      'discount': discount,
      'discount_type': discountType,
      'from_qty': fromQty,
      'to_qty': toQty,
      'price_level_id': priceLevelId,
      'price_level_name': priceLevelName,
      'rate_inclusive': rateInclusive,
      'is_default_price_level': isDefaultPriceLevel,
      'price_level_active': priceLevelActive,
    };
  }
}
