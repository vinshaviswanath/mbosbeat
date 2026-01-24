class ItemMasterSyncModel {
    ItemMasterSyncModel({
        required this.stockItemList,
        required this.id,
        required this.status,
        required this.message,
    });

    final List<StockItemList> stockItemList;
    final int? id;
    final int? status;
    final String? message;

    factory ItemMasterSyncModel.fromJson(Map<String, dynamic> json){ 
        return ItemMasterSyncModel(
            stockItemList: json["stockItemList"] == null ? [] : List<StockItemList>.from(json["stockItemList"]!.map((x) => StockItemList.fromJson(x))),
            id: json["id"],
            status: json["status"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "stockItemList": stockItemList.map((x) => x.toJson()).toList(),
        "id": id,
        "status": status,
        "message": message,
    };

}

class StockItemList {
    StockItemList({
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
        required this.altDecimalPlaces,
        required this.unitConversion,
        required this.unitDenominator,
        required this.isActive,
        required this.isDeleted,
        required this.hsnCode,
        required this.taxPercent,
    });

    final int? stockItemId;
    final String? itemName;
    final String? aliasName;
    final String? partNumber;
    final String? itemNameLcl;
    final String? groupName;
    final String? categoryName;
    final String? unitName;
    final int? decimalPlaces;
    final String? altUnit;
    final double? altDecimalPlaces;
    final double? unitConversion;
    final double? unitDenominator;
    final bool? isActive;
    final bool? isDeleted;
    final String? hsnCode;
    final double? taxPercent;

    factory StockItemList.fromJson(Map<String, dynamic> json){ 
        return StockItemList(
            stockItemId: json["stockItemID"],
            itemName: json["itemName"],
            aliasName: json["aliasName"],
            partNumber: json["partNumber"],
            itemNameLcl: json["itemName_LCL"],
            groupName: json["groupName"],
            categoryName: json["categoryName"],
            unitName: json["unitName"],
            decimalPlaces: json["decimalPlaces"],
            altUnit: json["altUnit"],
            altDecimalPlaces: json["altDecimalPlaces"],
            unitConversion: json["unitConversion"],
            unitDenominator: json["unitDenominator"],
            isActive: json["isActive"],
            isDeleted: json["isDeleted"],
            hsnCode: json["hsnCode"],
            taxPercent: json["taxPercent"],
        );
    }

    Map<String, dynamic> toJson() => {
        "stockItemID": stockItemId,
        "itemName": itemName,
        "aliasName": aliasName,
        "partNumber": partNumber,
        "itemName_LCL": itemNameLcl,
        "groupName": groupName,
        "categoryName": categoryName,
        "unitName": unitName,
        "decimalPlaces": decimalPlaces,
        "altUnit": altUnit,
        "altDecimalPlaces": altDecimalPlaces,
        "unitConversion": unitConversion,
        "unitDenominator": unitDenominator,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "hsnCode": hsnCode,
        "taxPercent": taxPercent,
    };

}
