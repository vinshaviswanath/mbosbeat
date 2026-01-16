import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/registration_details_tables.dart';
import 'package:mpos_beat/data/models/data/login_data.dart';

part 'registration_detail_dao.g.dart';

@DriftAccessor(tables: [
  RegistrationDetails
])
class RegistrationDetailDao extends DatabaseAccessor<AppDb> with _$RegistrationDetailDaoMixin {
  RegistrationDetailDao(super.db);

  DateTime? _safeDate(dynamic v) {
    if (v == null || v.toString().trim().isEmpty) return null;
    if (v is DateTime) return v;
    return DateTime.tryParse(v.toString());
  }

  Future<void> printUsers() async {
    final list = await select(registrationDetails).get();
    debugPrint("Registration details List Length :: ${list.length}");
    debugPrint("===== USER TABLE JSON =====");
    for (var u in list) {
      debugPrint(
        const JsonEncoder.withIndent("  ").convert({
          "userId": u.userId,
          "customerId": u.customerId,
          "fullName": u.fullName,
          "mobile": u.mobile,
          "email": u.email,
          "companyName": u.companyName,
          "expiryDate": u.expiryDate?.toIso8601String(),
        }),
      );
    }
    debugPrint("================================");
  }

  Future<void> insertUser(LoginData data) async {
    final comp = RegistrationDetailsCompanion(
      userId: Value(data.userId ?? 0),
      customerId: Value(data.customerId),
      fullName: Value(data.fullName),
      mobile: Value(data.mobile),
      whatsappNo: Value(data.whatsappNo),
      email: Value(data.email),
      designation: Value(data.designation),
      username: Value(data.username),
      userActive: Value(data.userActive),
      companyName: Value(data.companyName),
      address: Value(data.address),
      countryId: Value(data.countryId),
      stateId: Value(data.stateId),
      activationType: Value(data.activationType),
      expiryDate: Value(_safeDate(data.expiryDate)),
      custActive: Value(data.custActive),
      token: Value(data.token),
      dbName: Value(data.dbName),
    );

    await into(registrationDetails).insertOnConflictUpdate(comp);
  }

  Future<List<RegistrationDetail>> getAllUsers() => select(registrationDetails).get();

  Stream<List<RegistrationDetail>> watchAllUsers() => select(registrationDetails).watch();


  Future<void> clearAll() => delete(registrationDetails).go();

  Stream<RegistrationDetail?> watchLoggedInUser() {
    return (select(registrationDetails)..limit(1)).watchSingleOrNull();
  }

  Future<String?> getDesignation() async {
  final user = await (select(registrationDetails)..limit(1))
      .getSingleOrNull();
  return user?.designation;
}

Future<int?> getLoggedInUserId() async {
  final user = await (select(registrationDetails)..limit(1))
      .getSingleOrNull();
  return user?.userId;
}

}
