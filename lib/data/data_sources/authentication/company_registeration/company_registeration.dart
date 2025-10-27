import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/event/event_manager.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/serveice/http_client.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/logger.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/local_db/app_db.dart';
import 'package:mpos_beat/data/models/company_registration_response.dart';
import 'package:mpos_beat/domain/request/company_registration_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum CompanyRegisterationEvent { register }

// @lazySingleton
class CompanyRegisteration {
  final HttpClient httpClient;
  final RunSafely runSafely;
  final SharedPreferences sharedPreferences;
  final AppDb appDb;
  final EventManager eventManager;
  final List<IBinder> binders;

  CompanyRegisteration(
    this.httpClient,
    this.runSafely,
    this.sharedPreferences,
    this.appDb,
    this.eventManager,
    this.binders,
  ) {
    for (var binder in binders) {
      binder.bind();
    }
  }

  ResultFuture<CompanyRegistrationResponse> call(BaseParams<CompanyRegistrationParams> param) {
    return runSafely(
      () async {
        // final details = RegistrationDetail(
        //   id: 0,
        //   productName: '',
        //   adminUsername: param.data.adminUsername,
        //   companyName: param.data.companyName,
        //   email: param.data.email,
        //   mobile: param.data.mobile,
        //   password: param.data.password,
        // );
        // await appDb
        //     .into(appDb.registrationDetails)
        //     .insert(details.toCompanion(true));

        // eventManager.emit<BaseParams<CompanyRegistrationParams>>(
        //   eventName: CompanyRegisterationEvent.register.name,
        //   data: param,
        // );

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

abstract class IBinder {
  void bind();
  void unbind();
}

@lazySingleton
class RegistrationEventBinder implements IBinder {
  final EventManager eventManager;
  final HttpClient httpClient;
  final RunSafely runSafely;
  RegistrationEventBinder(this.eventManager, this.httpClient, this.runSafely);

  StreamSubscription? subscription;

  @override
  void bind() {
    subscription = eventManager
        .on<BaseParams<CompanyRegistrationParams>>(
          CompanyRegisterationEvent.register.name,
        )
        .listen((event) async {
          await httpClient.post(
            Urls.companyRegistration,
            data: event.data.toMap(),
          );
        });
  }

  @override
  void unbind() {
    subscription?.cancel();
  }
}
