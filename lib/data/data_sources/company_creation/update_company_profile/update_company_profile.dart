import 'dart:io';

import 'package:mpos_beat/core/service/http_client.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/base/run_safely.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/param/param_builder.dart';
import 'package:mpos_beat/core/utils/extentions.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';
import 'package:mpos_beat/core/utils/urls.dart';
import 'package:mpos_beat/data/models/response.dart';
import 'package:mpos_beat/domain/request/update_company_profile_params.dart';

@lazySingleton
class UpdateCompanyProfile {
  final HttpClient httpClient;
  final RunSafely runSafely;

  UpdateCompanyProfile(this.httpClient, this.runSafely);

  ResultFuture<DefaultResponse> call(BaseParams<CompanyProfileModel> param) {
    return runSafely(
      () async {
        final model = param.data;

        final fields = Map<String, dynamic>.from(model.toMap());
        final files = <String, File>{};

        if (model.cmpLogo != null) {
          // send as multipart file
          files['CmpLogo'] = model.cmpLogo!;
        } else {
          // backend expects empty string
          fields['CmpLogo'] = '';
        }

        final response = await httpClient.postFormData(
          Urls.updateCompanyProfile,
          fields: fields,
          files: files,
        );

        if (response.isOk) {
          Logger.logInfo('Updated successful');
          return DefaultResponse.fromJson(response.data);
        }

        throw CustomException(errMsg: response.message);
      },
      failure: (error) {
        return MainFailure.genericError(errorMsg: error);
      },
    );
  }
}

