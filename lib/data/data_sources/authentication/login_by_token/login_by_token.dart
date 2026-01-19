import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/login_response.dart';
import 'package:mpos_beat/domain/request/login_by_token_param.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LoginByToken {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  final AppDb appDb;

  LoginByToken(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
    this.appDb,
  );

  ResultFuture<LoginResponse> call(BaseParams<LoginByTokenParam> param) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          Urls.loginByToken,
          data: param.toMap(),
        );
        // final response = await httpClient.postFormData(Urls.login, fields: param.toMap());
        if (response.isOk) {
          final data = LoginResponse.fromJson(response.data);
          final token = data.loginData?.token;
          final customerId = data.loginData?.customerId;
          final logindata = data.loginData;
          if (token != null && token.isNotEmpty && data.status != 10) {
            await sharedPreferences.setString("token", token);
          }
          await sharedPreferences.setInt("customerId", customerId ?? 0);

          // await appDb.into(appDb.users).insert(User.fromJson(response.data));
          if (logindata != null) {
            await appDb.registrationDetailDao.clearAll();
            await appDb.registrationDetailDao.insertUser(logindata);
            await appDb.registrationDetailDao.printUsers();
          } else {
            // Optional: log or throw custom error
            debugPrint("loginData is null, skipping DB insert");
          }

          appDb.select(appDb.registrationDetails).watch();
          return data;
        }

        throw CustomException(errMsg: response.message);
      },
      failure: (error) {
        if (error.toLowerCase() == 'Invalid Referrel Code!'.toLowerCase()) {
          return InvalidReferralCode(errorMsg: error);
        }
        return MainFailure.genericError(errorMsg: error);
      },
    );
  }
}
