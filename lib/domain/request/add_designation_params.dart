import 'package:mpos_beat/core/param/param_builder.dart';

class AddDesignationParams extends ToMap {
    AddDesignationParams({
        required this.id,
        required this.customerId,
        required this.designation,
    });

    final String id;
    final String customerId;
    final String? designation;

    factory AddDesignationParams.fromJson(Map<String, dynamic> json){ 
        return AddDesignationParams(
            id: json["Id"],
            customerId: json["CustomerId"],
            designation: json["Designation"],
        );
    }

@override
    Map<String, dynamic> toMap() => {
        "Id": id,
        "CustomerId": customerId,
        "Designation": designation,
    };

}
