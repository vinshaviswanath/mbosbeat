import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:mpos_beat/core/event/event_manager.dart';
import 'package:mpos_beat/core/utils/logger.dart';

/// Base class for event subscribers
abstract class EventSubscriber {
  final EventManager _eventManager;
  final Map<String, StreamSubscription> _subscriptions = {};
  bool _isDisposed = false;

  EventSubscriber(this._eventManager);

  /// Subscribe to an event
  void subscribe<T>({
    required String eventName,
    required Function(Event<T>) handler,
    Function(dynamic)? onError,
  }) {
    if (_isDisposed) {
      Logger.logWarning(
          'Cannot subscribe to event: $eventName - Subscriber is disposed');
      return;
    }

    if (_subscriptions.containsKey(eventName)) {
      Logger.logWarning('Already subscribed to event: $eventName');
      return;
    }

    _subscriptions[eventName] = _eventManager.subscribe<T>(
      eventName: eventName,
      handler: handler,
      onError: (error) {
        Logger.logError(
          'Error in event handler for $eventName',
          // error: error,
        );
        onError?.call(error);
      },
    );
  }

  /// Unsubscribe from an event
  void unsubscribe(String eventName) {
    if (_isDisposed) return;

    final subscription = _subscriptions[eventName];
    if (subscription != null) {
      _eventManager.unsubscribe(eventName, subscription);
      _subscriptions.remove(eventName);
    }
  }

  /// Unsubscribe from all events
  void unsubscribeAll() {
    if (_isDisposed) return;

    for (final eventName in _subscriptions.keys.toList()) {
      unsubscribe(eventName);
    }
  }

  /// Dispose the subscriber
  @disposeMethod
  void dispose() {
    if (_isDisposed) return;

    _isDisposed = true;
    unsubscribeAll();
  }

  /// Check if the subscriber is disposed
  bool get isDisposed => _isDisposed;
}
