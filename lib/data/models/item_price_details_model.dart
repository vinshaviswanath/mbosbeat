class ItemPriceDetailsModel {
  ItemPriceDetailsModel({
    required this.priceListDetailModels,
    required this.id,
    required this.status,
    required this.message,
  });

  final List<PriceListDetailModel> priceListDetailModels;
  final int? id;
  final int? status;
  final String? message;

  factory ItemPriceDetailsModel.fromJson(Map<String, dynamic> json) {
    return ItemPriceDetailsModel(
      priceListDetailModels: json["priceListDetailModels"] == null
          ? []
          : List<PriceListDetailModel>.from(
              json["priceListDetailModels"]
                  .map((x) => PriceListDetailModel.fromJson(x)),
            ),
      id: json["id"],
      status: json["status"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "priceListDetailModels":
            priceListDetailModels.map((x) => x.toJson()).toList(),
        "id": id,
        "status": status,
        "message": message,
      };
}

class PriceListDetailModel {
  PriceListDetailModel({
    required this.id,
    required this.applicableDate,
    required this.itemId,
    required this.companyId,
    required this.priceList,
    required this.rate,
    required this.discount,
    required this.discountType,
    required this.fromQty,
    required this.toQty,
  });

  final int? id;
  final DateTime? applicableDate;
  final int? itemId;
  final int? companyId;
  final int? priceList;
  final double? rate;
  final double? discount;
  final String? discountType;
  final double? fromQty;
  final double? toQty;

  factory PriceListDetailModel.fromJson(Map<String, dynamic> json) {
    return PriceListDetailModel(
      id: json["id"],
      applicableDate: DateTime.tryParse(json["applicableDate"] ?? ""),
      itemId: json["itemID"],
      companyId: json["companyID"],
      priceList: json["priceList"],
      rate: (json["rate"] as num?)?.toDouble(),
      discount: (json["discount"] as num?)?.toDouble(),
      discountType: json["discountType"],
      fromQty: (json["fromQty"] as num?)?.toDouble(),
      toQty: (json["toQty"] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "applicableDate": applicableDate?.toIso8601String(),
        "itemID": itemId,
        "companyID": companyId,
        "priceList": priceList,
        "rate": rate,
        "discount": discount,
        "discountType": discountType,
        "fromQty": fromQty,
        "toQty": toQty,
      };
}

