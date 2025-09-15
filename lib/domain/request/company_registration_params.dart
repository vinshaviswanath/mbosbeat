import 'package:mpos_beat/core/param/param_builder.dart';

class CompanyRegistrationParams extends ToMap{
    CompanyRegistrationParams({
        // required this.id,
        // required this.productName,
        required this.companyName,
        required this.mobile,
        required this.email,
        required this.adminUsername,
        required this.password,
    });

    // final int? id;
    // final String? productName;
    final String? companyName;
    final String? mobile;
    final String? email;
    final String? adminUsername;
    final String? password;

    factory CompanyRegistrationParams.fromJson(Map<String, dynamic> json){ 
        return CompanyRegistrationParams(
            // id: json["ID"],
            // productName: json["ProductName"],
            companyName: json["CompanyName"],
            mobile: json["Mobile"],
            email: json["Email"],
            adminUsername: json["AdminUsername"],
            password: json["Password"],
        );
    }

@override
    Map<String, dynamic> toMap() => {
        "ID": 0,
        "ProductName": "mPosBeat",
        "CompanyName": companyName,
        "Mobile": mobile,
        "Email": email,
        "AdminUsername": adminUsername,
        "Password": password,
    };

}
