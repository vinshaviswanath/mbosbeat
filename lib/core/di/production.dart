

import 'package:mpos_beat/core/di/env.dart';
import 'package:mpos_beat/core/utils/logger.dart';


/// A class representing the production environment configuration.
///
/// The [ProductionEnv] class extends [Env] and provides specific configuration for the production environment.
/// It initializes with a domain URL for production and logs that the application has started in production mode.
class ProductionEnv extends Env {
  /// Creates an instance of [ProductionEnv] with the specified [env].
  ///
  /// Parameters:
  /// - [env]: The name of the environment.
  ProductionEnv(String env)
      : super(domainUrl: 'https://bingo.lilacinfotech.com', env: env) {
    Logger.logInfo('App Started In Production Mode');
  }

  @override
  String toString() {
    return 'Production';
  }
}
