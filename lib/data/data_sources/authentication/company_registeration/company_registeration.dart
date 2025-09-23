import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/company_registration_response.dart';
import 'package:mpos_beat/domain/request/company_registration_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class CompanyRegisteration {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  CompanyRegisteration(this.httpClient, this.runSafely, this.sharedPreferences);

  ResultFuture<CompanyRegistrationResponse> call(
      BaseParams<CompanyRegistrationParams> param) {
    return runSafely(
      () async {
        final response = await httpClient.post(
          Urls.companyRegistration,
          data: param.toMap(),
        );

        if (response.isOk) {
          final data = CompanyRegistrationResponse.fromJson(response.data);
          return data;
        }

        throw CustomException(errMsg: response.message);
      },
      failure: (error) {
        Logger.logWarning("Errroooorrrrrr $error");
        if (error.toLowerCase() == 'Invalid Referrel Code!'.toLowerCase()) {
          return InvalidReferralCode(errorMsg: error);
        }
        return MainFailure.genericError(errorMsg: error);
      },
    );
  }
}

// UserDetailModel? getUserDetails() {
//   final userDetailsJson = sl<SharedPreferences>().getString('user-details');
//   if (userDetailsJson != null) {
//     try {
//       final Map<String, dynamic> userDetails = jsonDecode(userDetailsJson);
//       return UserDetailModel.fromJson(userDetails);
//     } catch (e) {
//       Logger.logError('Error decoding user details: $e');
//     }
//   }
//   return null;
// }
