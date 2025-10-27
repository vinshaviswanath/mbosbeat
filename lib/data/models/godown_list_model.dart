class GodownListModel {
    GodownListModel({
        required this.vehicleList,
        required this.id,
        required this.status,
        required this.message,
    });

    final List<VehicleList> vehicleList;
    final int? id;
    final int? status;
    final String? message;

    factory GodownListModel.fromJson(Map<String, dynamic> json){ 
        return GodownListModel(
            vehicleList: json["vehicleList"] == null ? [] : List<VehicleList>.from(json["vehicleList"]!.map((x) => VehicleList.fromJson(x))),
            id: json["id"],
            status: json["status"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "vehicleList": vehicleList.map((x) => x?.toJson()).toList(),
        "id": id,
        "status": status,
        "message": message,
    };

}

class VehicleList {
    VehicleList({
        required this.id,
        required this.companyId,
        required this.code,
        required this.name,
        required this.active,
    });

    final int? id;
    final int? companyId;
    final String? code;
    final String? name;
    final int? active;

    factory VehicleList.fromJson(Map<String, dynamic> json){ 
        return VehicleList(
            id: json["id"],
            companyId: json["companyID"],
            code: json["code"],
            name: json["name"],
            active: json["active"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "companyID": companyId,
        "code": code,
        "name": name,
        "active": active,
    };

}
