import 'package:mpos_beat/core/utils/imports.dart';

class AppNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    Logger.logInfo(
      '$runtimeType Pushed: ${route.settings.name}, from: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    Logger.logInfo(
      '$runtimeType Popped: ${route.settings.name}, back to: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    Logger.logInfo('$runtimeType Removed: ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    Logger.logInfo(
      '$runtimeType Replaced: ${oldRoute?.settings.name} -> ${newRoute?.settings.name}',
    );
  }
}



















