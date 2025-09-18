class LoginData {
    LoginData({
        required this.userId,
        required this.customerId,
        required this.fullName,
        required this.mobile,
        required this.whatsappNo,
        required this.email,
        required this.designation,
        required this.username,
        required this.mpin,
        required this.userActive,
        required this.companyName,
        required this.address,
        required this.countryId,
        required this.stateId,
        required this.activationType,
        required this.expiryDate,
        required this.custActive,
        required this.token,
        required this.dbName,
    });

    final int? userId;
    final int? customerId;
    final String? fullName;
    final String? mobile;
    final String? whatsappNo;
    final String? email;
    final String? designation;
    final String? username;
    final dynamic mpin;
    final int? userActive;
    final String? companyName;
    final String? address;
    final int? countryId;
    final int? stateId;
    final String? activationType;
    final DateTime? expiryDate;
    final int? custActive;
    final String? token;
    final String? dbName;

    factory LoginData.fromJson(Map<String, dynamic> json){ 
        return LoginData(
            userId: json["userID"],
            customerId: json["customerID"],
            fullName: json["fullName"],
            mobile: json["mobile"],
            whatsappNo: json["whatsappNo"],
            email: json["email"],
            designation: json["designation"],
            username: json["username"],
            mpin: json["mpin"],
            userActive: json["userActive"],
            companyName: json["companyName"],
            address: json["address"],
            countryId: json["countryId"],
            stateId: json["stateId"],
            activationType: json["activationType"],
            expiryDate: DateTime.tryParse(json["expiryDate"] ?? ""),
            custActive: json["custActive"],
            token: json["token"],
            dbName: json["dbName"],
        );
    }

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "customerID": customerId,
        "fullName": fullName,
        "mobile": mobile,
        "whatsappNo": whatsappNo,
        "email": email,
        "designation": designation,
        "username": username,
        "mpin": mpin,
        "userActive": userActive,
        "companyName": companyName,
        "address": address,
        "countryId": countryId,
        "stateId": stateId,
        "activationType": activationType,
        "expiryDate": expiryDate?.toIso8601String(),
        "custActive": custActive,
        "token": token,
        "dbName": dbName,
    };

}