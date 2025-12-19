import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/service/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/login_response.dart';
import 'package:mpos_beat/data/models/otp_response.dart';
import 'package:mpos_beat/domain/request/otp_validation_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class OtpValidation {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  final AppDb appDb;

  OtpValidation(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences, {
    required this.appDb,
  });

  ResultFuture<LoginResponse> call(BaseParams<OtpParams> param) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          Urls.otpValidation,
          data: param.toMap(),
        );

        if (response.isOk) {
          final data = LoginResponse.fromJson(response.data);
          final token = data.loginData?.token;
          if (token != null && token.isNotEmpty && data.status != 10) {
            await sharedPreferences.setString("token", token);
          }
await appDb.registrationDetailDao.clearAll();
          await appDb.registrationDetailDao.insertUser(data.loginData!);
          await appDb.registrationDetailDao.printUsers();
        if (data.status == 1) {
            await appDb.userDao.clearAll();
            await appDb.userDao.insertUser(data.loginData!);
            await appDb.userDao.printUsers();
           return data;
          }
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
