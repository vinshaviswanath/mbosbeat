import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/local_db/tables/user_tables.dart';
import 'package:mpos_beat/data/models/data/login_data.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDb> with _$UserDaoMixin {
  UserDao(super.db);

  DateTime? _safeDate(dynamic v) {
    if (v == null || v.toString().trim().isEmpty) return null;
    if (v is DateTime) return v;
    return DateTime.tryParse(v.toString());
  }

  Future<void> printUsers() async {
    final list = await select(users).get();
    print("USER List Length :: ${list.length}");
    print("===== USER TABLE JSON =====");
    for (var u in list) {
      print(
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
    print("================================");
  }

  Future<void> insertUser(LoginData data) async {
    final comp = UsersCompanion(
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

    await into(users).insertOnConflictUpdate(comp);
  }

  Future<List<User>> getAllUsers() => select(users).get();

  Future<void> clearAll() => delete(users).go();

  Stream<User?> watchLoggedInUser() {
    return (select(users)..limit(1)).watchSingleOrNull();
  }
}
