import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/event/event_manager.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/data/data_sources/authentication/company_registeration/company_registeration.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@module
abstract class AppInjectionModule {
  @preResolve
  Future<SharedPreferences> pref() => SharedPreferences.getInstance();

  @lazySingleton
  http.Client get clent => http.Client();

  @lazySingleton
  CompanyRegisteration companyRegisteration(
    HttpClient httpClient,
    RunSafely runSafely,
    SharedPreferences sharedPreferences,
    AppDb appDb,
    EventManager eventManager,
    RegistrationEventBinder registrationEventBinder,
  ) => CompanyRegisteration(
    httpClient,
    runSafely,
    sharedPreferences,
    appDb,
    eventManager,
    [registrationEventBinder],
  );
}
