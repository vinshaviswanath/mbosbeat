import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/login_response.dart';
import 'package:mpos_beat/domain/request/login_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LoginImpl {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  LoginImpl(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<LoginResponse> call(BaseParams<LoginParams> param) {
    return runSafely(
      () async {
        final response = await httpClient.post(Urls.login, data: param.toMap());

        if (response.isOk) {
          final data = LoginResponse.fromJson(response.data);
          final token = data.loginData?.token;
          if (token != null && token.isNotEmpty && data.status != 10) {
            await sharedPreferences.setString("token", token);
          }
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
