class PriceLevelModel {
    PriceLevelModel({
        required this.priceLevels,
        required this.id,
        required this.status,
        required this.message,
    });

    final List<PriceLevelData> priceLevels;
    final int? id;
    final int? status;
    final String? message;

    factory PriceLevelModel.fromJson(Map<String, dynamic> json){ 
        return PriceLevelModel(
            priceLevels: json["priceLevels"] == null ? [] : List<PriceLevelData>.from(json["priceLevels"]!.map((x) => PriceLevelData.fromJson(x))),
            id: json["id"],
            status: json["status"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "priceLevels": priceLevels.map((x) => x.toJson()).toList(),
        "id": id,
        "status": status,
        "message": message,
    };

}

class PriceLevelData {
    PriceLevelData({
        required this.id,
        required this.priceLevel,
        required this.rateInclusive,
        required this.isDefault,
        required this.active,
    });

    final int? id;
    final String? priceLevel;
    final bool? rateInclusive;
    final bool? isDefault;
    final bool? active;

    factory PriceLevelData.fromJson(Map<String, dynamic> json){ 
        return PriceLevelData(
            id: json["id"],
            priceLevel: json["priceLevel"],
            rateInclusive: json["rateInclusive"],
            isDefault: json["isDefault"],
            active: json["active"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "priceLevel": priceLevel,
        "rateInclusive": rateInclusive,
        "isDefault": isDefault,
        "active": active,
    };

}
