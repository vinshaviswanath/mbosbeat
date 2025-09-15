import 'dart:convert';
import 'package:mpos_beat/core/di/injection.dart';
import 'package:mpos_beat/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static const String _key = "registered_users";

  static List<LocalUser> getUsers()  {
    final prefs = sl<SharedPreferences>();
    final data = prefs.getString(_key);
    if (data == null) return [];
    final List decoded = jsonDecode(data);
    return decoded.map((e) => LocalUser.fromJson(e)).toList();
  }

  static Future<void> saveUser(LocalUser user) async {
    final prefs = sl<SharedPreferences>();
    final users =  getUsers();
    // prevent duplicates by phone
    final exists = users.any((u) => u.phone == user.phone);
    if (!exists) {
      users.add(user);
      await prefs.setString(
        _key,
        jsonEncode(users.map((u) => u.toJson()).toList()),
      );
    }
  }

  static Future<LocalUser?> getUserByPhone(String phone) async {
    final users =  getUsers();
    try {
      return users.firstWhere((u) => u.phone == phone);
    } catch (_) {
      return null;
    }
  }

  static Future<void> updateUser(LocalUser updated) async {
    final prefs = sl<SharedPreferences>();
    final users =  getUsers();
    final index = users.indexWhere((u) => u.phone == updated.phone);
    if (index != -1) {
      users[index] = updated;
      await prefs.setString(
        _key,
        jsonEncode(users.map((u) => u.toJson()).toList()),
      );
    }
  }

  // static Future<void> clearUsers() async {
  //   final prefs = sl<SharedPreferences>();
  //   await prefs.remove(_key);
  // }
}
