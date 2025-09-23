import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@module
abstract class AppInjectionModule {
  @preResolve
  Future<SharedPreferences> pref() => SharedPreferences.getInstance();

  @lazySingleton
  http.Client get clent => http.Client();
}
