import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/exception/custom_exception.dart';
import 'package:mpos_beat/core/failures/failures.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:mpos_beat/core/utils/typedefs.dart';

@lazySingleton
class RunSafely {
  RunSafely();

  ResultFuture<T> call<T>(
    Future<T> Function() action, {
    MainFailure Function(String error)? failure,
  }) async {
    try {
      return right(await action());
    } on CustomException catch (e, s) {
      Logger.logError("RunSafely CustomException: $e,  \n StackTrace $s");
      return left(
        failure?.call(e.errMsg) ?? MainFailure.customError(errorMsg: e.errMsg),
      );
    } catch (e, s) {
      Logger.logError("RunSafely Error: $e,  \n StackTrace $s");
      return left(
        failure?.call(e.toString()) ??
            MainFailure.genericError(errorMsg: e.toString()),
      );
    }
  }
}
